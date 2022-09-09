//
//  SplashViewController.swift
//  YAS Clinic
//
//  Created by MAC-1 on 28/04/2022.
//

import UIKit
import Alamofire

class SplashViewController: UIViewController {

    var deviceID = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//        getDeviceIDs()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let deviceId = UIDevice.current.identifierForVendor?.uuidString{
            print("deviceId: \(deviceId)")
            deviceID = deviceId
        }
        
//        if UserDefaults.standard.bool(forKey: Constants.UserSession.logIn){
//            checkSesssion()
//        }else{
//
//        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        checkSesssion()
    }
    
    func checkSesssion(){
        print("Login : &&&&& \(UserDefaults.standard.bool(forKey: Constants.UserSession.logIn))")
        
        if UserDefaults.standard.bool(forKey: Constants.UserSession.guestUser){
            print("Guset User@@ : \(UserDefaults.standard.bool(forKey: Constants.UserSession.guestUser))")
        }else{
            print("Guset User## : \(UserDefaults.standard.bool(forKey: Constants.UserSession.guestUser))")
            
            
        }
        
        if UserDefaults.standard.bool(forKey: Constants.UserSession.logOut){
            print("Logout &&: \(UserDefaults.standard.bool(forKey: Constants.UserSession.logOut))")
            let StoryBoard = UIStoryboard(name: "Authentication", bundle: nil)
            let vc = StoryBoard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
            vc.modalPresentationStyle = .fullScreen
            vc.modalTransitionStyle = .crossDissolve
            self.present(vc, animated: true, completion: nil)
        }else{
            if UserDefaults.standard.bool(forKey: Constants.UserSession.logIn){
                print("LogIn &&: \(UserDefaults.standard.bool(forKey: Constants.UserSession.logIn))")
                if let email =  UserDefaults.standard.value(forKey: Constants.UserSession.email) as? String,
                   let password = UserDefaults.standard.value(forKey: Constants.UserSession.password) as? String{
                    
                    login(email: email, password: password)
                }else{
                    let StoryBoard = UIStoryboard(name: "Authentication", bundle: nil)
                    let vc = StoryBoard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
                    vc.modalPresentationStyle = .fullScreen
                    vc.modalTransitionStyle = .crossDissolve
                    self.present(vc, animated: true, completion: nil)
                }
            }else{
                //guest user retrive to main screen
                print("guestUSER")
                print("LogIn ##: \(UserDefaults.standard.bool(forKey: Constants.UserSession.logIn))")
                let StoryBoard = UIStoryboard(name: "Main", bundle: nil)
                let vc = StoryBoard.instantiateViewController(withIdentifier: "tabbar") as! UITabBarController
                vc.modalPresentationStyle = .fullScreen
                vc.modalTransitionStyle = .crossDissolve
                self.present(vc, animated: true, completion: nil)
            }
        }
        
        
        
    }
    
    
    var loginData : Login_Base.User!
//    var user = UserInfo()
    func login(email: String, password: String){
        ApiManager.callRestApi(url: Router.login(["identifier":email,"password":password]), myCustomClass: Login_Base.self, completionHandler: {
            (data,error) in
            if error == "204"{
                loading.dismiss()
            }else if let dt = data{
                if dt.error?.status == 400{
                    HAlert.ShowToast(VC: self, msg: dt.error?.message ?? "invalid_login_credentials".localiz())
                }else{
                    if let token = dt.jwt{
                        user.token = token
                    }
                    
                    if let userData = dt.user{
                        print("userInfo: \(userData)")
                        self.loginData = userData
                        
                        user.email = userData.email!
                        user.Firebase_token = userData.firebase_token ?? ""
                        user.Phone_number = userData.phone_number ?? ""
                        user.id = userData.id!
                        user.username = userData.username!
                        user.provider = userData.provider!
                        
                        
                        guestUser = false
                        let StoryBoard = UIStoryboard(name: "Main", bundle: nil)
                        let vc = StoryBoard.instantiateViewController(withIdentifier: "tabbar") as! UITabBarController
                        vc.modalPresentationStyle = .fullScreen
                        vc.modalTransitionStyle = .crossDissolve
                        self.present(vc, animated: true, completion: nil)
                    }
                }
                loading.dismiss()
                
            }else{
                loading.dismiss()
                HAlert.ShowBoldToast(VC: self, msg: "something_went_wrong".localiz())
            }
        })
    }
    
    
    var DeviceIDs : DeviceIDs_Base!
    var DeviceIDsArray = [DeviceIDs_Base.Data]()
    
    
    func getDeviceIDs(){
        loading.show(vc: self)
        ApiManager.callRestApi(url: Router.getDeviceIDs(["populate": "*"]),
                               myCustomClass: DeviceIDs_Base.self, completionHandler: {
            (data,error) in
            if error == "204"{
                loading.dismiss()
            }else if let dt = data{
                
                self.DeviceIDsArray.removeAll()
                
                self.DeviceIDsArray = dt.data!
                
                print("DeviceIDs Count: \(self.DeviceIDsArray.count)")
                loading.dismiss()
                
                if self.DeviceIDsArray.count > 0{
                    let result = self.DeviceIDsArray.filter( { return $0.attributes?.device_id == self.deviceID } )
                    
                    if result.count > 0{
                        print("Already register")
                        print(result)
                        let storyboard = UIStoryboard(name: "Main", bundle: nil)
                        let vc = storyboard.instantiateViewController(withIdentifier: "tabbar") as! UITabBarController
                        vc.modalPresentationStyle = .fullScreen
                        vc.modalTransitionStyle = .crossDissolve
                        self.present(vc, animated: true, completion: nil)
                    }else{
                        print("Not Registered")
                        print(result)
                        if let deviceId = UIDevice.current.identifierForVendor?.uuidString{
                            print("deviceId: \(deviceId)")
                            self.registerDeviceId(Device_id: deviceId, Device_token: deviceTokenstring)
                        }
                    }
                   
                }
                
            }else{
                loading.dismiss()
                HAlert.ShowBoldToast(VC: self, msg: "something_went_wrong".localiz())
            }
        })
    }
    
      func registerDeviceId(Device_id: String,Device_token: String){
          let urlString = URLS.baseUrl + "user-devices" //"https://api-yas.broomstickcreative.com/api/user-devices"
  //        let json = "{\"What\":\"Ever\"}"
          let json = "{\"data\":{\"device_id\":\"\(Device_id)\",\"device_token\":\"\(Device_token)\"}}"

          let url = URL(string: urlString)!
          let jsonData = json.data(using: .utf8, allowLossyConversion: false)!

          var request = URLRequest(url: url)
          request.httpMethod = HTTPMethod.post.rawValue
          request.setValue("application/json; charset=UTF-8", forHTTPHeaderField: "Content-Type")
          request.httpBody = jsonData

          AF.request(request).responseJSON {
              (response) in
              
              switch response.result {
              case .success(let value):
                  
                  print(value,"\(response.response?.statusCode ?? 0)")
                  
                  if response.response?.statusCode ?? 0 == 200{
                      let storyboard = UIStoryboard(name: "Main", bundle: nil)
                      let vc = storyboard.instantiateViewController(withIdentifier: "tabbar") as! UITabBarController
                      vc.modalPresentationStyle = .fullScreen
                      vc.modalTransitionStyle = .crossDissolve
                      self.present(vc, animated: true, completion: nil)
                  }
              case .failure(let error):
                  print("Error :- \(error)")
                  print("Status :- \((response.response?.statusCode ?? 0))")
                  if (response.response?.statusCode ?? 0) == 204{
                      print("\(response.response!.statusCode)")
                      
                      HAlert.ShowToast(VC: self, msg: "server_error".localiz())
                  }else{
                      print(response.error?.errorDescription)
                      HAlert.ShowToast(VC: self, msg: response.error?.errorDescription ?? "server_error".localiz())
                  }
                  
              }
          }
          
          
          
      }
}

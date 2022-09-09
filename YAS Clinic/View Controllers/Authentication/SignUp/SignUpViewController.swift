//
//  SignUpViewController.swift
//  YAS Clinic
//
//  Created by MAC-1 on 07/03/2022.
//

import UIKit
import Alamofire

class SignUpViewController: UIViewController {
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var alreadyHaveAccountLabel: UILabel!
    @IBOutlet weak var loginButton: UIButton!
    
    var deviceID = ""
    override func viewDidLoad() {
        super.viewDidLoad()

//        getDeviceIDs()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        if let deviceId = UIDevice.current.identifierForVendor?.uuidString{
            print("deviceId: \(deviceId)")
            deviceID = deviceId
        }
        nameTextField.placeholder = "name".localiz()
        emailTextField.placeholder = "email".localiz()
        passwordTextField.placeholder = "password".localiz()
        signUpButton.setTitle("singn_up".localiz(), for: .normal)
        alreadyHaveAccountLabel.text = "already_have_an_account".localiz()
        loginButton.setTitle("login".localiz(), for: .normal)
    }
    
    @IBAction func signUpAction(_ sender: Any) {
        if Reachability.isConnectedToNetwork(){
            if nameTextField.text!.isEmpty{
                HAlert.ShowToast(VC: self, msg: "please_enter_user_name".localiz())
            }else if emailTextField.text!.isEmpty{
                HAlert.ShowToast(VC: self, msg: "please_enter_email_address".localiz())
            }else if passwordTextField.text!.isEmpty{
                HAlert.ShowToast(VC: self, msg: "please_enter_password".localiz())
            }else if passwordTextField.text!.count < 6{
                HAlert.ShowToast(VC: self, msg: "please_enter_valid_password".localiz())
            }else{
                if emailTextField.text!.isValidEmail(){
                    loading.show(vc: self)
                    registration(userName: nameTextField.text!, email: emailTextField.text!, password: passwordTextField.text!, Device_token: deviceTokenstring, Device_id: "0")
                    
//                    getDeviceIDs()
                    
                }else{
                    HAlert.ShowToast(VC: self, msg: "please_enter_valid_email".localiz())
                }
            }
        }
        else{
            HAlert.ShowToast(VC: self, msg: Reachability.notConnectivityMessage)
        }
    }
    
    @IBAction func alreadyHaveAccount(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }
    
//    var DeviceIDs : DeviceIDs_Base!
//    var DeviceIDsArray = [DeviceIDs_Base.Data]()
//
//
//    func getDeviceIDs(){
//        loading.show(vc: self)
//        ApiManager.callRestApi(url: Router.getDeviceIDs(["populate": "*"]),
//                               myCustomClass: DeviceIDs_Base.self, completionHandler: {
//            (data,error) in
//            if error == "204"{
//                loading.dismiss()
//            }else if let dt = data{
//
//                self.DeviceIDsArray.removeAll()
//
//                self.DeviceIDsArray = dt.data!
//
//                print("DeviceIDs Count: \(self.DeviceIDsArray.count)")
//                loading.dismiss()
//
//                if self.DeviceIDsArray.count > 0{
//
//                    let result = self.DeviceIDsArray.filter( { return $0.attributes?.device_id == self.deviceID } )
//
//                    if result.count > 0{
//                        print("Already register")
//                        print(result)
////                        self.registerDeviceId(Device_id: "\((result.first?.id)!)", Device_token: deviceTokenstring)
//                        self.registration(userName: self.nameTextField.text!, email: self.emailTextField.text!, password: self.passwordTextField.text!, Device_token: deviceTokenstring, Device_id: "\((result.first?.id)!)")
//                    }else{
//                        print("Not Registered")
//                        print(result)
//                        if let deviceId = UIDevice.current.identifierForVendor?.uuidString{
//                            print("deviceId: \(deviceId)")
////                            self.registerDeviceId(Device_id: deviceId, Device_token: deviceTokenstring)
//                            self.registration(userName: self.nameTextField.text!, email: self.emailTextField.text!, password: self.passwordTextField.text!, Device_token: deviceTokenstring, Device_id: deviceId)
//                        }
//                    }
//
//                }
//
//            }else{
//                loading.dismiss()
//                HAlert.ShowBoldToast(VC: self, msg: "Some thing went wrong")
//            }
//        })
//    }
    
    
    
    
    var loginData : Login_Base.User!
//    var user = UserInfo()

    func registration(userName: String,email: String, password: String, Device_token: String, Device_id: String){
        user.token = ""
        ApiManager.callRestApi(url: Router.registration(["username":userName,"email":email,"password":password,"phone_number":"1111111111", "Firebase_token":Device_token, "user_device_id": Device_id ]), myCustomClass: Login_Base.self, completionHandler: {
            (data,error) in
            if let dt = data{
                if dt.error?.status == 400{
//                    HAlert.ShowToast(VC: self, msg: dt.error?.message ?? "Invalid Credentials")
                    HAlert.CreateAlert(title: "Alert!", message: dt.error?.message ?? "invalid_credentials".localiz(), ViewController: self)
                    
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
    
}

/*//
 //  SignUpViewController.swift
 //  YAS Clinic
 //
 //  Created by MAC-1 on 07/03/2022.
 //

 import UIKit
 import Alamofire

 class SignUpViewController: UIViewController {
     @IBOutlet weak var nameTextField: UITextField!
     @IBOutlet weak var emailTextField: UITextField!
     @IBOutlet weak var passwordTextField: UITextField!
     
     var deviceID = ""
     override func viewDidLoad() {
         super.viewDidLoad()

 //        getDeviceIDs()
         // Do any additional setup after loading the view.
     }
     override func viewWillAppear(_ animated: Bool) {
         if let deviceId = UIDevice.current.identifierForVendor?.uuidString{
             print("deviceId: \(deviceId)")
             deviceID = deviceId
         }
     }
     
     @IBAction func signUpAction(_ sender: Any) {
         if Reachability.isConnectedToNetwork(){
             if nameTextField.text!.isEmpty{
                 HAlert.ShowToast(VC: self, msg: "Please Enter User Name")
             }else if emailTextField.text!.isEmpty{
                 HAlert.ShowToast(VC: self, msg: "Please Enter Email Address")
             }else if passwordTextField.text!.isEmpty{
                 HAlert.ShowToast(VC: self, msg: "Please Enter Password")
             }else if passwordTextField.text!.count < 6{
                 HAlert.ShowToast(VC: self, msg: "Please Enter Valid Password")
             }else{
                 if emailTextField.text!.isValidEmail(){
                     loading.show(vc: self)
 //                    registration(userName: nameTextField.text!, email: emailTextField.text!, password: passwordTextField.text!)
                     
                     getDeviceIDs()
                     
                 }else{
                     HAlert.ShowToast(VC: self, msg: "Please Enter Valid Email")
                 }
             }
         }
         else{
             HAlert.ShowToast(VC: self, msg: Reachability.notConnectivityMessage)
         }
     }
     
     @IBAction func alreadyHaveAccount(_ sender: Any) {
         let vc = storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
         vc.modalPresentationStyle = .fullScreen
         present(vc, animated: true, completion: nil)
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
 //                        self.registerDeviceId(Device_id: "\((result.first?.id)!)", Device_token: deviceTokenstring)
                         self.registration(userName: self.nameTextField.text!, email: self.emailTextField.text!, password: self.passwordTextField.text!, Device_token: deviceTokenstring, Device_id: "\((result.first?.id)!)")
                     }else{
                         print("Not Registered")
                         print(result)
                         if let deviceId = UIDevice.current.identifierForVendor?.uuidString{
                             print("deviceId: \(deviceId)")
 //                            self.registerDeviceId(Device_id: deviceId, Device_token: deviceTokenstring)
                             self.registration(userName: self.nameTextField.text!, email: self.emailTextField.text!, password: self.passwordTextField.text!, Device_token: deviceTokenstring, Device_id: deviceId)
                         }
                     }
                    
                 }
                 
             }else{
                 loading.dismiss()
                 HAlert.ShowBoldToast(VC: self, msg: "Some thing went wrong")
             }
         })
     }
     
     
     
     
     var loginData : Login_Base.User!
 //    var user = UserInfo()
     func registration(userName: String,email: String, password: String, Device_token: String, Device_id: String){
         user.token = ""
         ApiManager.callRestApi(url: Router.registration(["username":userName,"email":email,"password":password,"phone_number":"1111111111", "Firebase_token":Device_token, "user_device_id": Device_id ]), myCustomClass: Login_Base.self, completionHandler: {
             (data,error) in
             if let dt = data{
                 if dt.error?.status == 400{
 //                    HAlert.ShowToast(VC: self, msg: dt.error?.message ?? "Invalid Credentials")
                     HAlert.CreateAlert(title: "Alert!", message: dt.error?.message ?? "Invalid Credentials", ViewController: self)
                     
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
                 HAlert.ShowBoldToast(VC: self, msg: "Some thing went wrong")
             }
         })
     }
     
 }

*/

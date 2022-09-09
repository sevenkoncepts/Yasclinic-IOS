//
//  LoginViewController.swift
//  YASClinic
//
//  Created by MAC-1 on 02/03/2022.
//

import UIKit
import Foundation

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var forgotButton: UIButton!
    @IBOutlet weak var dontHaveAnAccountLabel: UILabel!
    @IBOutlet weak var signUpButton: UIButton!
    
    var isFromSideMenu = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        emailTextField.text = "as@msn.com"
//        passwordTextField.text = "manager"

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        emailTextField.placeholder = "email".localiz()
        passwordTextField.placeholder = "password".localiz()
        loginButton.setTitle("login".localiz(), for: .normal)
        forgotButton.setTitle("forget_password".localiz(), for: .normal)
        dontHaveAnAccountLabel.text = "dont_have_an_account".localiz()
        signUpButton.setTitle("singn_up".localiz(), for: .normal)
        
        if isFromSideMenu{
            self.tabBarController?.tabBar.isHidden = true
            let backButton = UIBarButtonItem()
            backButton.title = "back".localiz()
            self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        }
    }
    @IBAction func forgotPasswordAction(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ForgotPasswordViewController") as! ForgotPasswordViewController
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
    
    @IBAction func loginAction(_ sender: Any) {
        
        if Reachability.isConnectedToNetwork(){
            if emailTextField.text!.isEmpty{
                HAlert.ShowToast(VC: self, msg: "please_enter_email_address".localiz())
            }else if passwordTextField.text!.isEmpty{
                HAlert.ShowToast(VC: self, msg: "please_enter_password".localiz())
            }else if passwordTextField.text!.count < 6{
                HAlert.ShowToast(VC: self, msg: "invalid_password".localiz())
            }else{
                if emailTextField.text!.isValidEmail(){
                    loading.show(vc: self)
                    login(email: emailTextField.text!, password: passwordTextField.text!)
                    
                }else{
                    HAlert.ShowToast(VC: self, msg: "please_enter_valid_email".localiz())
                }
            }
        }
        else{
            HAlert.ShowToast(VC: self, msg: Reachability.notConnectivityMessage)
        }
    }
    
    @IBAction func dontHaveAccountAction(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "SignUpViewController") as! SignUpViewController
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
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
                        
                        UserDefaults.standard.set(userData.email, forKey: Constants.UserSession.email)
                        UserDefaults.standard.set(self.passwordTextField.text!, forKey: Constants.UserSession.password)
                        UserDefaults.standard.set(true, forKey: Constants.UserSession.logIn)
                        UserDefaults.standard.set(false, forKey: Constants.UserSession.logOut)
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


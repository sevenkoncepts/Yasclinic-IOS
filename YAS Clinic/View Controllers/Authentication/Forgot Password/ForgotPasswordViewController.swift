//
//  ForgotPasswordViewController.swift
//  YAS Clinic
//
//  Created by MAC-1 on 17/08/2022.
//

import UIKit

class ForgotPasswordViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func sendAction(_ sender: Any) {
        if Reachability.isConnectedToNetwork(){
            if emailTextField.text!.isEmpty{
                HAlert.ShowToast(VC: self, msg: "please_enter_email_address".localiz())
            }else{
                if emailTextField.text!.isValidEmail(){
                    loading.show(vc: self)
                    sendRequest(email: emailTextField.text!)
                    
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
    
    func sendRequest(email: String){
        ApiManager.callRestApi(url: Router.forgotPassword(["email":email]), myCustomClass: Login_Base.self, completionHandler: {
            (data,error) in
            if error == "204"{
                loading.dismiss()
            }else if let dt = data{
                if dt.error?.status == 400{
                    HAlert.ShowToast(VC: self, msg: dt.error?.message ?? "This_email_does_not_exist".localiz())
                }else{
//                    HAlert.ShowToast(VC: self, msg:  "please_check_your_email_for _further_instructions".localiz())
                    let refreshAlert = UIAlertController(title: "confirmation".localiz(), message: "please_check_your_email_for _further_instructions".localiz(), preferredStyle: UIAlertController.Style.alert)
                    
                    refreshAlert.addAction(UIAlertAction(title: "ok".localiz(), style: .default, handler: { (action: UIAlertAction!) in
                        print("Handle Ok logic here")
                        let vc = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
                        vc.modalPresentationStyle = .fullScreen
                        self.present(vc, animated: true, completion: nil)
                    }))
                    
                    self.present(refreshAlert, animated: true, completion: nil)
                }
                loading.dismiss()
                
            }else{
                loading.dismiss()
                HAlert.ShowBoldToast(VC: self, msg: "something_went_wrong".localiz())
            }
        })
    }
    
    @IBAction func backToLoginAction(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }
}

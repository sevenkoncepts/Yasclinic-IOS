//
//  GetInTouchPopUpViewController.swift
//  YAS Clinic
//
//  Created by MAC-1 on 08/03/2022.
//

import UIKit
import Alamofire

class GetInTouchPopUpViewController: UIViewController {

    @IBOutlet weak var getInTouchTitleLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var phoneNoTextField: UITextField!
    @IBOutlet weak var messageTextField: UITextField!
    @IBOutlet weak var sendButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        getInTouchTitleLabel.text = "get_in_touch".localiz()
        nameTextField.placeholder = "full_name".localiz()
        emailTextField.placeholder = "email_address".localiz()
        phoneNoTextField.placeholder = "phone_no".localiz()
        messageTextField.placeholder = "type_your_message".localiz()
        sendButton.setTitle("send".localiz(), for: .normal)
    }
    
    @IBAction func sendAction(_ sender: Any) {
        if Reachability.isConnectedToNetwork(){
            if nameTextField.text!.isEmpty{
                HAlert.ShowToast(VC: self, msg: "please_enter_user_name".localiz())
            }else if emailTextField.text!.isEmpty{
                HAlert.ShowToast(VC: self, msg: "please_enter_email_address".localiz())
            }else if phoneNoTextField.text!.isEmpty{
                HAlert.ShowToast(VC: self, msg: "please_enter_phone_no".localiz())
            }else if messageTextField.text!.isEmpty{
                HAlert.ShowToast(VC: self, msg: "please_write_message".localiz())
            }else{
                if emailTextField.text!.isValidEmail(){
                    loading.show(vc: self)
                    sendGetInTouch(userName: nameTextField.text!, email: emailTextField.text!, phoneNo: phoneNoTextField.text!, message: messageTextField.text!)
                    
                }else{
                    HAlert.ShowToast(VC: self, msg: "please_enter_valid_email".localiz())
                }
            }
        }
        else{
            HAlert.ShowToast(VC: self, msg: Reachability.notConnectivityMessage)
        }
    }
    @IBAction func dismissAction(_ sender: Any) {
        NotificationCenter.default.post(name: Notification.Name(rawValue: "GetInTouchDismissTap"), object: nil)
        self.dismiss(animated: true, completion: nil)
    }
    
    
    var contactUs : ContactUs_Base!
  
    func sendGetInTouch(userName: String,email: String,phoneNo: String, message: String){
        let urlString = "https://api-yas.broomstickcreative.com/api/contactus-forms"
//        let json = "{\"What\":\"Ever\"}"
        let json = "{\"data\":{\"name\":\"\(userName)\",\"email\":\"\(email)\",\"phone_number\":\"\(phoneNo)\",\"message\":\"\(message)\"}}"

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
                    
                    
                    // create the alert
                    let alert = UIAlertController(title: "alert".localiz(), message: "successfully_send".localiz(), preferredStyle: UIAlertController.Style.alert)
                    
                    // add an action (button)
                    alert.addAction(UIAlertAction(title: "ok".localiz(), style: UIAlertAction.Style.default, handler: { action in
                        
                        self.dismiss(animated: true, completion: nil)
                    }))
                    
                    // show the alert
                    self.present(alert, animated: true, completion: nil)
                    
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

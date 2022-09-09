//
//  ConfirmBookingViewController.swift
//  YAS Clinic
//
//  Created by MAC-1 on 08/03/2022.
//

import UIKit

class ConfirmBookingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    override func viewWillAppear(_ animated: Bool) {
        self.title = "confirm_booking".localiz()
    }
    @IBAction func payCashAtClinicAction(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Appointment", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "ThankYouViewController") as! ThankYouViewController
        vc.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(vc,animated: true)
    }
    
    @IBAction func payOnlineAction(_ sender: Any) {
        HAlert.ShowToast(VC: self, msg: "Coming soon...")
    }
}

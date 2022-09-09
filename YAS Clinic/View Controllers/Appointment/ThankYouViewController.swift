//
//  ThankYouViewController.swift
//  YAS Clinic
//
//  Created by MAC-1 on 08/03/2022.
//

import UIKit

class ThankYouViewController: UIViewController {

    var thankyouMessage = String()
    @IBOutlet weak var bookingDetailsLable: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        
        bookingDetailsLable.text = thankyouMessage
        self.tabBarController?.tabBar.isHidden = true
        self.navigationController?.isNavigationBarHidden = true
    }
    
    @IBAction func goToMyAppointmentsAction(_ sender: Any) {
        self.tabBarController?.tabBar.isHidden = false
        self.navigationController?.isNavigationBarHidden = false
        let storyboard = UIStoryboard(name: "Appointment", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "MyAppointmentViewController") as! MyAppointmentViewController

        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .crossDissolve
        vc.isFromThankyou = true
//            self.present(vc, animated: true, completion: nil)
        navigationController?.pushViewController(vc,animated: true)
    }
}

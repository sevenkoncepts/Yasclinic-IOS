//
//  appointmentPopupViewController.swift
//  YAS Clinic
//
//  Created by MAC-1 on 16/03/2022.
//

import UIKit

class appointmentPopupViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }
    
    @IBAction func dismissAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func rescheduleAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
        
    }
    @IBAction func nextAction(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Appointment", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "appointmentFormNav") as! UINavigationController
        vc.modalPresentationStyle = .fullScreen
//        navigationController?.navigationBar.isHidden = false
        self.present(vc, animated: true, completion: nil)
//        navigationController?.pushViewController(vc,animated: true)
    }
}

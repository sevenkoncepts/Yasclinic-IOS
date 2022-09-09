//
//  ProfileViewController.swift
//  YASClinic
//
//  Created by MAC-1 on 03/03/2022.
//

import UIKit

struct doctorInfo{
    var name = ""
    var designation = ""
    var description = ""
    var address = "Khalifa City, Abu Khalifa City, Abu Khalifa City, Abu Khalifa City, Abu Khalifa City, Abu"
}
var doctor = doctorInfo()
var doctorData = [doctorInfo]()

class ProfileViewController: UIViewController {

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var coloredView: CustomGradientView!
    @IBOutlet weak var whiteView: CustomGradientView!
    @IBOutlet weak var contactUsButton: UIButton!
    @IBOutlet weak var bookAnAppointmentButton: UIButton!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var designationLabel: UILabel!
    @IBOutlet weak var degreeLabel: UILabel!
    @IBOutlet weak var specialityLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var timingsLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    @IBOutlet weak var locationTitleLabel: UILabel!
    @IBOutlet weak var viewLargerMapTitleLabel: UILabel!
    
    @IBOutlet weak var scrollViewHeight: NSLayoutConstraint!
    
    var doctor_ID = 0
    var speciality_ID = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        coloredView.isHidden = true
        whiteView.isHidden = true
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        setData()
        
    }

    func setData(){
        self.title = "profile".localiz()
        nameLabel.text = doctor.name
        designationLabel.text = doctor.designation
        descriptionLabel.text = doctor.description
        locationLabel.text = doctor.address
        bookAnAppointmentButton.setTitle("book_an_appointment".localiz(), for: .normal)
        contactUsButton.setTitle("contact_us".localiz(), for: .normal)
        locationTitleLabel.text = "location".localiz()
        viewLargerMapTitleLabel.text = "view_larger_map".localiz()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let height = descriptionLabel.bounds.size.height
        print("Height: \(height)")
        scrollViewHeight.constant = scrollViewHeight.constant + height + 60
        
        view.layoutIfNeeded()
    }
    @IBAction func contactUsAction(_ sender: Any) {
        coloredView.isHidden = false
        contactUsButton.setTitleColor(.white, for: .normal)
        whiteView.isHidden = false
        bookAnAppointmentButton.setTitleColor(UIColor(hexString: "1B99B8"), for: .normal)
        
        
        
        let storyboard = UIStoryboard(name: "SideMenu", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "ContactUsViewController") as! ContactUsViewController
        vc.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(vc,animated: true)
    }
    @IBAction func bookAnAppointmentAction(_ sender: Any) {
        
        coloredView.isHidden = true
        contactUsButton.setTitleColor(UIColor(hexString: "1B99B8"), for: .normal)
        whiteView.isHidden = true
        bookAnAppointmentButton.setTitleColor(.white, for: .normal)
        
        
        if guestUser{
            
            let refreshAlert = UIAlertController(title: "alert".localiz(), message: "please_login_to_book_an_appointment".localiz(), preferredStyle: UIAlertController.Style.alert)

            refreshAlert.addAction(UIAlertAction(title: "yes".localiz(), style: .default, handler: { (action: UIAlertAction!) in
                print("Handle Ok logic here")

                let storyboard = UIStoryboard(name: "Authentication", bundle: nil)
                let vc = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
                
                vc.modalPresentationStyle = .fullScreen
                vc.modalTransitionStyle = .crossDissolve
                self.present(vc, animated: true, completion: nil)
        //                navigationController?.pushViewController(vc,animated: true)
            }))

            refreshAlert.addAction(UIAlertAction(title: "no".localiz(), style: .cancel, handler: { (action: UIAlertAction!) in
                print("Handle Cancel Logic here")
            }))

            present(refreshAlert, animated: true, completion: nil)
            
        }else{
            
            let storyboard = UIStoryboard(name: "Appointment", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "CalendarViewController") as! CalendarViewController
            vc.modalPresentationStyle = .fullScreen
            
            print("Doctor Id &&&& :\(doctor_ID)")
            print("specialityId &&& :\(speciality_ID)")
            
            vc.doctor_ID = doctor_ID
            vc.speciality_ID = speciality_ID
            navigationController?.pushViewController(vc,animated: true)
        }
    }
    
    @IBAction func viewLargerMapAction(_ sender: Any) {
    }
}



//
//  DoctorsViewController.swift
//  YASClinic
//
//  Created by MAC-1 on 02/03/2022.
//

import UIKit
import SDWebImage
import LanguageManager_iOS

class DoctorsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var doctorsData : Doctors!
    var screenTitle = ""
    var specialityId = Int()
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UINib(nibName: "DoctorsTableViewCell", bundle: nil), forCellReuseIdentifier: "DoctorsTableViewCell")
        self.tableView.estimatedRowHeight = UITableView.automaticDimension//272.0
        self.tableView.rowHeight = UITableView.automaticDimension
        
        tableView.reloadData()
    }
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setTintColor(.white)
        navigationController?.backgroundColor(UIColor(hexString: Constants.Colors.AppBlueColor))
        getDoctors(language: selectedLanguage, specialityId: specialityId)
        self.title = screenTitle
//        self.tabBarController?.tabBar.backgroundColor = UIColor(hexString: "#003A70")
        
        //MARK: - Change back text
        let backButton = UIBarButtonItem()
        backButton.title = "back".localiz()
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
    }
    
    var doctors : Doctors_Base!
    var doctorsArray = [Doctors_Base.Data]()
    func getDoctors(language: String, specialityId: Int){
        loading.show(vc: self)
        ApiManager.callRestApi(url: Router.getDoctors(["populate":"*", "filters[specialties][id][$eq]" : "\(specialityId)"]), myCustomClass: Doctors_Base.self, completionHandler: {
            (data,error) in
            if error == "204"{
                loading.dismiss()
            }else if let dt = data{
                
                
                self.doctorsArray = dt.data!
                loading.dismiss()
                self.tableView.reloadData()
                
            }else{
                loading.dismiss()
                HAlert.ShowBoldToast(VC: self, msg: "something_went_wrong".localiz())
            }
        })
    }
}

extension DoctorsViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return doctorsArray.count
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.alpha = 0.7
        UIView.animate(withDuration: 1.0) {
            cell.alpha = 1.0
        }
//        if indexPath.row == notificationsArray.count - 1 {
//            if datacount > 7{
//                self.paginationApplied = true
//                if notification.pagination.currentPage <= notification.pagination.totalPages{
//                    GetNotifications(page: notification.pagination.currentPage + 1)
//                }
//            }
//        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:DoctorsTableViewCell = self.tableView.dequeueReusableCell(withIdentifier: "DoctorsTableViewCell") as! DoctorsTableViewCell
        cell.selectedBackgroundView?.backgroundColor = .clear
        tableView.backgroundColor = UIColor.clear
        
        let data = doctorsArray[indexPath.row]
        let localizationData = data.attributes?.localizations?.data
        
        let language = LanguageManager.shared.currentLanguage
        if language == .english{
            
            cell.nameLabel.text = data.attributes?.doc_name
    //        cell.designationLabel.text = data?.attributes?.doc_designation
            cell.specialityLabel.text = data.attributes?.doc_designation
    //        cell.locationLabel.text = data?.attributes?
        }else{
            cell.nameLabel.text = localizationData?.first?.attributes?.doc_name
            cell.specialityLabel.text = localizationData?.first?.attributes?.doc_designation
        }
        
        
        
        
        
//        let image = data.attributes?.icon?.Icon_data?.attributes?.formats?.small?.url
//        let newString = image?.replacingOccurrences(of: " ", with: "%20", options: .literal, range: nil)
//        let url = "https://api-yas.broomstickcreative.com\(newString!)"
//        cell.doctorImageView.sd_setImage(with: URL(string: url ),placeholderImage: #imageLiteral(resourceName: "person"))
        
        cell.viewProfileButton.setTitle("view_profile".localiz(), for: .normal)
        cell.bookAnAppointmentLabel.text = "book_an_appointment".localiz()
        
        cell.viewProfileButton.tag = indexPath.row
        cell.viewProfileButton.addTarget(self, action: #selector(profileAction), for: .touchUpInside)
        
        cell.bookAnAppointmentButton.tag = indexPath.row
        cell.bookAnAppointmentButton.addTarget(self, action: #selector(bookAppointmentAction), for: .touchUpInside)
        return cell
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
    
    @objc func profileAction(sender: UIButton){
        print(sender.tag)
        let tag:NSInteger = sender.tag
        let indexPath = IndexPath(row: tag, section: 0)
//        let cell = tableView.cellForRow(at: indexPath) as! BookingCalendarTableViewCell
        let data = doctorsData.data?[indexPath.row]

        let storyboard = UIStoryboard(name: "Profile", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "ProfileViewController") as! ProfileViewController
        vc.modalPresentationStyle = .fullScreen
//        vc.doctorData = data?.attributes
        
        doctor.name = (data?.attributes?.doc_name)!
        doctor.designation = (data?.attributes?.doc_designation)!
        doctor.description = (data?.attributes?.doc_desc)!
        vc.doctor_ID = data?.id ?? -1
        vc.speciality_ID = specialityId
        navigationController?.pushViewController(vc,animated: true)

    }
    
    @objc func bookAppointmentAction(sender: UIButton){
        print(sender.tag)
        let tag:NSInteger = sender.tag
        let indexPath = IndexPath(row: tag, section: 0)
        
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
            let data = doctorsArray[indexPath.row]
            let storyboard = UIStoryboard(name: "Appointment", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "CalendarViewController") as! CalendarViewController
            vc.modalPresentationStyle = .fullScreen
            
            print("Doctor Id &&&& :\(data.id)")
            print("specialityId &&& :\(specialityId)")
            
            vc.doctor_ID = data.id ?? -1
            vc.speciality_ID = specialityId
            navigationController?.pushViewController(vc,animated: true)
        }
        
    }
    
    
}

/*
 Dr. Heba Moustafa
 
 In Arabic
 Doctor Id &&&& :Optional(53)
 specialityId &&& :6
 
 
 In English
 Doctor Id &&&& :Optional(52)
 specialityId &&& :5
 */

//
//  AccountViewController.swift
//  YAS Clinic
//
//  Created by MAC-1 on 10/03/2022.
//

import UIKit
import LanguageManager_iOS

class AccountViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var phoneNumLabel: UILabel!
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var guestView: UIView!
    let btn = BadgedButtonItem(with: UIImage(named: "bell"))
    
//    var profileItemsEnglish = ["My Profile","Past Visits","My Appointments","Favourite Doctor", "Labouratory Results","Help"]
//    var profileItemsArabic = ["ملفي","الزيارات السابقة","المواعيد الخاصة بي","الطبيب المفضل", "النتائج المخبرية","يساعد"]
    
    var profileItemsEnglish = ["My Appointments","Help"]
    var profileItemsArabic = ["المواعيد الخاصة بي","يساعد"]
    
//    var profileGuestItemsEnglish = ["My Profile","Past Visits","Favourite Doctor", "Labouratory Results","Help"]
//    var profileGuestItemsArabic = ["ملفي","الزيارات السابقة","الطبيب المفضل", "النتائج المخبرية","يساعد"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.navigationItem.rightBarButtonItem = btn
//        self.navigationItem.rightBarButtonItem?.tintColor = .white
//        self.navigationController?.navigationBar.barTintColor = .white

        
        btn.tapAction = {

            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "NotificationsViewController") as! NotificationsViewController

            vc.modalPresentationStyle = .fullScreen
            vc.modalTransitionStyle = .crossDissolve
    //        self.present(vc, animated: true, completion: nil)
            self.navigationController?.pushViewController(vc,animated: true)
        }
        tableView.register(UINib(nibName: "AccountTableViewCell", bundle: nil), forCellReuseIdentifier: "AccountTableViewCell")
    }
    override func viewDidAppear(_ animated: Bool) {
        UIBarButtonItem.appearance(whenContainedInInstancesOf: [UINavigationBar.self]).tintColor = UIColor.white
    }
    override func viewWillAppear(_ animated: Bool) {
        setData()
        navigationController?.setTintColor(.white)
        navigationController?.backgroundColor(UIColor(hexString: Constants.Colors.AppBlueColor))
        self.tabBarController?.tabBar.isHidden = false
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
    }
    func setData(){
        self.navigationController?.navigationBar.topItem?.title = "account".localiz()
        
//        let patientIdTitle = "patient_id".localiz()
//        let phoneNumberTitle = "phone_number".localiz()
        userNameLabel.text = user.username.capitalizingFirstLetter()
        emailLabel.text = "\(user.email)"
        phoneNumLabel.text = "\(user.Phone_number)"
        self.title = "profile".localiz()
        if guestUser{
            guestView.isHidden = false
        }else{
            guestView.isHidden = true
        }

        tableView.reloadData()
    }
    @IBAction func sideMenuAction(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "SideMenuNavigationController")
        self.present(controller, animated: true, completion: nil)
    }
    
    @IBAction func signUpAction(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Authentication", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController

        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .crossDissolve
        vc.isFromSideMenu = true
        navigationController?.pushViewController(vc,animated: true)
    }
}

extension AccountViewController: UITableViewDelegate, UITableViewDataSource{
   
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if !guestUser{
            if LanguageManager.shared.currentLanguage == .english{
                return profileItemsEnglish.count
            }else{
                return profileItemsArabic.count
            }
        }
        return 0
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
        let cell:AccountTableViewCell = self.tableView.dequeueReusableCell(withIdentifier: "AccountTableViewCell") as! AccountTableViewCell
        cell.selectedBackgroundView?.backgroundColor = .clear
        tableView.backgroundColor = UIColor.clear
        
        let data : String
        if !guestUser{
            if LanguageManager.shared.currentLanguage == .english{
                data = profileItemsEnglish[indexPath.row]
            }else{
                data = profileItemsArabic[indexPath.row]
            }
            cell.itemLabel.text = data
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0{
            let storyboard = UIStoryboard(name: "Appointment", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "MyAppointmentViewController") as! MyAppointmentViewController

            vc.modalPresentationStyle = .fullScreen
            vc.modalTransitionStyle = .crossDissolve
    //            self.present(vc, animated: true, completion: nil)
            navigationController?.pushViewController(vc,animated: true)
        }else if indexPath.row == 1{
            HAlert.toastMessage("coming_soon".localiz())
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
}


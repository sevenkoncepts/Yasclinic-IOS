//
//  SideMenuViewController.swift
//  YAS Clinic
//
//  Created by MAC-1 on 28/02/2022.
//"Book an Appointment"

import UIKit
import LanguageManager_iOS

class SideMenuViewController: UIViewController {
    @IBOutlet weak var userNameLAbel: UILabel!
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var userDesignationLabel: UILabel!
    
    var sideMenuItemsEnglish = ["My Appointment","PCR Test","About us", "About Covid - 19","Contact Us","Insurance Network","Logout","Language","English","Arabic"]
    
    var sideMenuItemsArabic = ["تعييني", "اختبار PCR","معلومات عنا","حول كوفيد - 19","اتصل بنا","شبكة التأمين","خروج","لغة","English","العربي"]
    
    var sideMenuGuestItemsEnglish = ["PCR Test","About us", "About Covid - 19","Contact Us","Insurance Network","Language","English","Arabic"]
    
    var sideMenuGuestItemsArabic = ["اختبار PCR","معلومات عنا", "حول كوفيد - 19","اتصل بنا","شبكة التأمين","لغة","English","Arabic"]
    
    var flagsArray = ["English","العربي"]
    var flagImages: [UIImage] = []
    
    var image1 = #imageLiteral(resourceName: "Rectangle 92")
    let image2 = #imageLiteral(resourceName: "uae-flag 1")
    var languageTap = false
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        flagImages.append(image1)
        flagImages.append(image2)
        tableView.register(UINib(nibName: "SideMenuTableViewCell", bundle: nil), forCellReuseIdentifier: "SideMenuTableViewCell")
        tableView.register(UINib(nibName: "LanguageTableViewCell", bundle: nil), forCellReuseIdentifier: "LanguageTableViewCell")
        
    }
    override func viewWillAppear(_ animated: Bool) {
//        setData()
        
        let language = LanguageManager.shared.currentLanguage
        
            if language == .english{
                selectedLanguage = englishLanguage
            }else{
                selectedLanguage = arabicLanguage
            }
        
    }
    override func viewDidAppear(_ animated: Bool) {
        setData()
    }
    
    
    func setData(){
        if guestUser{
            userNameLAbel.text = "Login Or Sign up"
//            userDesignationLabel.text = user.email
        }else{
            userNameLAbel.text = user.username
            userDesignationLabel.text = user.email
        }
        
    }
    func setupUpdateView(languageCode code: String){
        
        tableView.reloadData()
        UserDefaults.standard.setValue(selectedLanguage, forKey: "language")
        
        print("Selected Language::::: *** \(UserDefaults.standard.value(forKey: "language"))")
        
        if code == arabicLanguage{

            // Change the language
            LanguageManager.shared.setLanguage(language: .arabic) { title -> UIViewController in
                print("title of the scene: \(title ?? "")")
                // The view controller that you want to show after changing the language
                return self.viewControllerToShow()
            } animation: { view in
                // Do custom animation
                view.transform = CGAffineTransform(scaleX: 2, y: 2)
                view.alpha = 0
            }
        }else{

            // Change the language
            LanguageManager.shared.setLanguage(language: .english) { title -> UIViewController in
                print("title of the scene: \(title ?? "")")
                // The view controller that you want to show after changing the language
                return self.viewControllerToShow()
            } animation: { view in
                // Do custom animation
                view.transform = CGAffineTransform(scaleX: 2, y: 2)
                view.alpha = 0
            }
        }
    }
    
    private func viewControllerToShow() -> UIViewController {
        let StoryBoard = UIStoryboard(name: "Main", bundle: nil)
        let vc = StoryBoard.instantiateViewController(withIdentifier: "tabbar") as! UITabBarController
        return vc
    }
    
    @IBAction func profileAction(_ sender: Any) {
        if guestUser{
            let storyboard = UIStoryboard(name: "Authentication", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController

            vc.modalPresentationStyle = .fullScreen
            vc.modalTransitionStyle = .crossDissolve
            vc.isFromSideMenu = true
    //            self.present(vc, animated: true, completion: nil)
            navigationController?.pushViewController(vc,animated: true)
        }
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let vc = storyboard.instantiateViewController(withIdentifier: "AccountViewController") as! AccountViewController
//
//        vc.modalPresentationStyle = .fullScreen
//        vc.modalTransitionStyle = .crossDissolve
////            self.present(vc, animated: true, completion: nil)
//        navigationController?.pushViewController(vc,animated: true)
    }
    
}

extension SideMenuViewController: UITableViewDelegate, UITableViewDataSource{
   
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if languageTap{
            if guestUser{
                if selectedLanguage == englishLanguage{
                    return sideMenuGuestItemsEnglish.count
                }else{
                    return sideMenuGuestItemsArabic.count
                }
                
            }else{
                if selectedLanguage == englishLanguage{
                    return sideMenuItemsEnglish.count
                }else{
                    return sideMenuItemsArabic.count
                }
                
            }
        }else{
            if guestUser{
                if selectedLanguage == englishLanguage{
                    return sideMenuGuestItemsEnglish.count - 2
                }else{
                    return sideMenuGuestItemsArabic.count - 2
                }
                
            }else{
                if selectedLanguage == englishLanguage{
                    return sideMenuItemsEnglish.count - 2
                }else{
                    return sideMenuItemsArabic.count - 2
                }
                
            }
        }
//        return 0
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
        let cell:SideMenuTableViewCell = self.tableView.dequeueReusableCell(withIdentifier: "SideMenuTableViewCell") as! SideMenuTableViewCell
        cell.selectedBackgroundView?.backgroundColor = .clear
        tableView.backgroundColor = UIColor.clear
        
        if selectedLanguage == arabicLanguage{
            cell.nameLabel.textAlignment = .right
        }else{
            cell.nameLabel.textAlignment = .left
        }
        
        var data : String
        if guestUser{
            if selectedLanguage == englishLanguage{
                data = sideMenuGuestItemsEnglish[indexPath.row]
            }else{
                data = sideMenuGuestItemsArabic[indexPath.row]
            }
            
        }else{
            if selectedLanguage == englishLanguage{
                data = sideMenuItemsEnglish[indexPath.row]
            }else{
                data = sideMenuItemsArabic[indexPath.row]
            }
            
        }
        cell.nameLabel.text = data
        
        if languageTap{
            if data == "English" || data == "Arabic"{
                
                let cell:LanguageTableViewCell = self.tableView.dequeueReusableCell(withIdentifier: "LanguageTableViewCell") as! LanguageTableViewCell
                cell.selectedBackgroundView?.backgroundColor = .clear
                tableView.backgroundColor = UIColor.clear
                
                if data == "English"{
                    let imagesData = flagImages[0]
                    cell.flagImageView.image = imagesData
                    if selectedLanguage == englishLanguage{
                        cell.tickImageView.isHidden = false
                    }else{
                        cell.tickImageView.isHidden = true
                    }
                }else{
                    let imagesData = flagImages[1]
                    cell.flagImageView.image = imagesData
                    if selectedLanguage == arabicLanguage{
                        cell.tickImageView.isHidden = false
                    }else{
                        cell.tickImageView.isHidden = true
                    }
                }
                
                cell.languageLabel.text = data
                
                return cell
            }
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let index = indexPath.row
        if guestUser{
            if index == 0{
                tabBarController?.selectedIndex = 2
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let vc = storyboard.instantiateViewController(withIdentifier: "PCRTestViewController") as! PCRTestViewController

                vc.modalPresentationStyle = .fullScreen
                vc.modalTransitionStyle = .crossDissolve
                vc.isSideMenu = true
                navigationController?.pushViewController(vc,animated: true)
            }
//            else if index == 1{
//                if guestUser{
//
//                    let refreshAlert = UIAlertController(title: "alert".localiz(), message: "please_login_to_book_an_appointment".localiz(), preferredStyle: UIAlertController.Style.alert)
//
//                    refreshAlert.addAction(UIAlertAction(title: "yes".localiz(), style: .default, handler: { (action: UIAlertAction!) in
//                        print("Handle Ok logic here")
//
//                        let storyboard = UIStoryboard(name: "Authentication", bundle: nil)
//                        let vc = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
//
//                        vc.modalPresentationStyle = .fullScreen
//                        vc.modalTransitionStyle = .crossDissolve
//                        self.present(vc, animated: true, completion: nil)
//        //                navigationController?.pushViewController(vc,animated: true)
//                    }))
//
//                    refreshAlert.addAction(UIAlertAction(title: "no".localiz(), style: .cancel, handler: { (action: UIAlertAction!) in
//                        print("Handle Cancel Logic here")
//                    }))
//
//                    present(refreshAlert, animated: true, completion: nil)
//
//                }else{
//                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
//                    let vc = storyboard.instantiateViewController(withIdentifier: "SpecialitiesViewController") as! SpecialitiesViewController
//                    vc.modalPresentationStyle = .fullScreen
//            //        navigationController?.navigationBar.isHidden = false
//            //        self.present(vc, animated: true, completion: nil)
//                    navigationController?.pushViewController(vc,animated: true)
//                }
//            }
            else if index == 1{
                let storyboard = UIStoryboard(name: "SideMenu", bundle: nil)
                let vc = storyboard.instantiateViewController(withIdentifier: "AboutUsViewController") as! AboutUsViewController
                vc.modalPresentationStyle = .fullScreen
                navigationController?.pushViewController(vc,animated: true)
            }
            else if index == 2{
                let storyboard = UIStoryboard(name: "SideMenu", bundle: nil)
                let vc = storyboard.instantiateViewController(withIdentifier: "AboutCovidViewController") as! AboutCovidViewController
                vc.modalPresentationStyle = .fullScreen
                navigationController?.pushViewController(vc,animated: true)
            }
            else if index == 3{
                let storyboard = UIStoryboard(name: "SideMenu", bundle: nil)
                let vc = storyboard.instantiateViewController(withIdentifier: "ContactUsViewController") as! ContactUsViewController
                vc.modalPresentationStyle = .fullScreen
                navigationController?.pushViewController(vc,animated: true)
            }
            else if index == 4{
                let storyboard = UIStoryboard(name: "SideMenu", bundle: nil)
                let vc = storyboard.instantiateViewController(withIdentifier: "InsuranceNetworkViewController") as! InsuranceNetworkViewController
                vc.modalPresentationStyle = .fullScreen
                navigationController?.pushViewController(vc,animated: true)
            }
    //        else if index == 6{
    //            let storyboard = UIStoryboard(name: "SideMenuItems", bundle: nil)
    //            let vc = storyboard.instantiateViewController(withIdentifier: "ContactUsViewController") as! ContactUsViewController
    //            vc.modalPresentationStyle = .fullScreen
    //            navigationController?.pushViewController(vc,animated: true)
    //        }
    //        else if index == 7{
    //            let storyboard = UIStoryboard(name: "Settings", bundle: nil)
    //            let vc = storyboard.instantiateViewController(withIdentifier: "SettingsViewController") as! SettingsViewController
    //            vc.modalPresentationStyle = .fullScreen
    //            navigationController?.pushViewController(vc,animated: true)
    //        }
            else if index == 5{
                    if languageTap{
                        languageTap = false
                        tableView.reloadData()
                        tableView.scrollToBottom(animated: true)
                    }else{
                    languageTap = true
                    tableView.reloadData()
                    tableView.scrollToBottom(animated: true)
                }
            }
            else if index == 6{
                selectedLanguage = englishLanguage
                
//                guard LanguageManager.shared.currentLanguage != .english else{
//                    return
//                }
                LanguageManager.shared.setLanguage(language: .english)
                
                setupUpdateView(languageCode: selectedLanguage)
                NotificationCenter.default.post(name: Notification.Name(rawValue: "languageTapObserver"), object: nil)
//                tableView.reloadData()
            }
            else if index == 7{
                selectedLanguage = arabicLanguage
                LanguageManager.shared.setLanguage(language: .arabic)
                setupUpdateView(languageCode: selectedLanguage)
                NotificationCenter.default.post(name: Notification.Name(rawValue: "languageTapObserver"), object: nil)
//                tableView.reloadData()
            }
        }else{
            if index == 0{
                let storyboard = UIStoryboard(name: "Appointment", bundle: nil)
                let vc = storyboard.instantiateViewController(withIdentifier: "MyAppointmentViewController") as! MyAppointmentViewController

                vc.modalPresentationStyle = .fullScreen
                vc.modalTransitionStyle = .crossDissolve
    //            self.present(vc, animated: true, completion: nil)
                navigationController?.pushViewController(vc,animated: true)
            }
            else if index == 1{
                tabBarController?.selectedIndex = 2
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let vc = storyboard.instantiateViewController(withIdentifier: "PCRTestViewController") as! PCRTestViewController

                vc.modalPresentationStyle = .fullScreen
                vc.modalTransitionStyle = .crossDissolve
    //            vc.isSideMenu = false
                navigationController?.pushViewController(vc,animated: true)
            }
//            else if index == 2{
//                if guestUser{
//
//                    let refreshAlert = UIAlertController(title: "alert".localiz(), message: "please_login_to_book_an_appointment".localiz(), preferredStyle: UIAlertController.Style.alert)
//
//                    refreshAlert.addAction(UIAlertAction(title: "yes".localiz(), style: .default, handler: { (action: UIAlertAction!) in
//                        print("Handle Ok logic here")
//
//                        let storyboard = UIStoryboard(name: "Authentication", bundle: nil)
//                        let vc = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
//
//                        vc.modalPresentationStyle = .fullScreen
//                        vc.modalTransitionStyle = .crossDissolve
//                        self.present(vc, animated: true, completion: nil)
//                //                navigationController?.pushViewController(vc,animated: true)
//                    }))
//
//                    refreshAlert.addAction(UIAlertAction(title: "no".localiz(), style: .cancel, handler: { (action: UIAlertAction!) in
//                        print("Handle Cancel Logic here")
//                    }))
//
//                    present(refreshAlert, animated: true, completion: nil)
//
//                }else{
//                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
//                    let vc = storyboard.instantiateViewController(withIdentifier: "SpecialitiesViewController") as! SpecialitiesViewController
//                    vc.modalPresentationStyle = .fullScreen
//            //        navigationController?.navigationBar.isHidden = false
//            //        self.present(vc, animated: true, completion: nil)
//                    navigationController?.pushViewController(vc,animated: true)
//                }
//            }
            else if index == 2{
                let storyboard = UIStoryboard(name: "SideMenu", bundle: nil)
                let vc = storyboard.instantiateViewController(withIdentifier: "AboutUsViewController") as! AboutUsViewController
                vc.modalPresentationStyle = .fullScreen
                navigationController?.pushViewController(vc,animated: true)
            }
            else if index == 3{
                let storyboard = UIStoryboard(name: "SideMenu", bundle: nil)
                let vc = storyboard.instantiateViewController(withIdentifier: "AboutCovidViewController") as! AboutCovidViewController
                vc.modalPresentationStyle = .fullScreen
                navigationController?.pushViewController(vc,animated: true)
            }
            else if index == 4{
                let storyboard = UIStoryboard(name: "SideMenu", bundle: nil)
                let vc = storyboard.instantiateViewController(withIdentifier: "ContactUsViewController") as! ContactUsViewController
                vc.modalPresentationStyle = .fullScreen
                navigationController?.pushViewController(vc,animated: true)
            }
            else if index == 5{
                let storyboard = UIStoryboard(name: "SideMenu", bundle: nil)
                let vc = storyboard.instantiateViewController(withIdentifier: "InsuranceNetworkViewController") as! InsuranceNetworkViewController
                vc.modalPresentationStyle = .fullScreen
                navigationController?.pushViewController(vc,animated: true)
            }
    //        else if index == 6{
    //            let storyboard = UIStoryboard(name: "SideMenuItems", bundle: nil)
    //            let vc = storyboard.instantiateViewController(withIdentifier: "ContactUsViewController") as! ContactUsViewController
    //            vc.modalPresentationStyle = .fullScreen
    //            navigationController?.pushViewController(vc,animated: true)
    //        }
            else if index == 6{
                print("logout clicked")
                let refreshAlert = UIAlertController(title: "alert".localiz(), message: "are_you_sure_you_want_to_logout".localiz(), preferredStyle: UIAlertController.Style.alert)

                refreshAlert.addAction(UIAlertAction(title: "yes".localiz(), style: .default, handler: { (action: UIAlertAction!) in
                    print("Handle Ok logic here")

//                    let idCardNo = UserDefaults.standard.value(forKey: Constants.UserSession.idCardNo) as? String
                    let Email = UserDefaults.standard.value(forKey: Constants.UserSession.email) as? String
                    let Password = UserDefaults.standard.value(forKey: Constants.UserSession.password) as? String
//                    let touchId = UserDefaults.standard.bool(forKey: Constants.UserSession.enableTouchId)
//
//
//
//                    let defaults = UserDefaults.standard
//                    let dictionary = defaults.dictionaryRepresentation()
//
//                    dictionary.keys.forEach
//                    { key in   defaults.removeObject(forKey: key)
//                    }
//
//                    UserDefaults.standard.set(touchId, forKey: Constants.UserSession.enableTouchId)
//                    UserDefaults.standard.set(idCardNo, forKey: Constants.UserSession.idCardNo)
                    guestUser = true
                    UserDefaults.standard.set(Email, forKey: Constants.UserSession.email)
                    UserDefaults.standard.set(Password, forKey: Constants.UserSession.password)
                    UserDefaults.standard.set(false, forKey: Constants.UserSession.logOut)

                    self.userNameLAbel.text = "Login Or Sign up"
                    self.userDesignationLabel.text = ""
                    self.tableView.reloadData()
                    UserDefaults.standard.set(false, forKey: Constants.UserSession.logIn)
                    UserDefaults.standard.set(true, forKey: Constants.UserSession.guestUser)
                    user.email = ""
                    user.id = 0

//                    let vc = UIStoryboard.init(name: "Authentication", bundle: Bundle.main).instantiateViewController(withIdentifier: "LoginViewController") as?  LoginViewController
//        //            vc?.logout = true
//                    vc?.modalPresentationStyle = .fullScreen
//
//                    self.present(vc! , animated: true , completion: nil )
                }))

                refreshAlert.addAction(UIAlertAction(title: "no".localiz(), style: .cancel, handler: { (action: UIAlertAction!) in
                    print("Handle Cancel Logic here")
                }))

                present(refreshAlert, animated: true, completion: nil)
            }
            else if index == 7{
                if languageTap{
                    languageTap = false
                    tableView.reloadData()
                    tableView.scrollToBottom(animated: true)
                }else{
                    languageTap = true
                    tableView.reloadData()
                    tableView.scrollToBottom(animated: true)
                }
            }
            else if index == 8{
                selectedLanguage = englishLanguage
                if let tabVC = self.tabBarController as? TabBarViewController {
                    
                    tabVC.setupItems()
                }
                
                
                setupUpdateView(languageCode: selectedLanguage)
                NotificationCenter.default.post(name: Notification.Name(rawValue: "languageTapObserver"), object: nil)
                tableView.reloadData()
            }
            else if index == 9{
                selectedLanguage = arabicLanguage
                if let tabVC = self.tabBarController as? TabBarViewController {
                    
                    tabVC.setupItems()
                }
                setupUpdateView(languageCode: selectedLanguage)
                NotificationCenter.default.post(name: Notification.Name(rawValue: "languageTapObserver"), object: nil)
                tableView.reloadData()
            }
        }
        
//        else if index == 10{
//            let refreshAlert = UIAlertController(title: "Alert", message: "Are you sure you want to logout?", preferredStyle: UIAlertController.Style.alert)
//
//            refreshAlert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { (action: UIAlertAction!) in
//                print("Handle Ok logic here")
//
//                let idCardNo = UserDefaults.standard.value(forKey: Constants.UserSession.idCardNo) as? String
//                let Email = UserDefaults.standard.value(forKey: Constants.UserSession.email) as? String
//                let Password = UserDefaults.standard.value(forKey: Constants.UserSession.password) as? String
//                let touchId = UserDefaults.standard.bool(forKey: Constants.UserSession.enableTouchId)
//
//
//
//                let defaults = UserDefaults.standard
//                let dictionary = defaults.dictionaryRepresentation()
//
//                dictionary.keys.forEach
//                { key in   defaults.removeObject(forKey: key)
//                }
//
//                UserDefaults.standard.set(touchId, forKey: Constants.UserSession.enableTouchId)
//                UserDefaults.standard.set(idCardNo, forKey: Constants.UserSession.idCardNo)
//                UserDefaults.standard.set(Email, forKey: Constants.UserSession.email)
//                UserDefaults.standard.set(Password, forKey: Constants.UserSession.password)
//                UserDefaults.standard.set(true, forKey: Constants.UserSession.logOut)
//
//
//                let vc = UIStoryboard.init(name: "Authentication", bundle: Bundle.main).instantiateViewController(withIdentifier: "LoginViewController") as?  LoginViewController
//    //            vc?.logout = true
//                vc?.modalPresentationStyle = .fullScreen
//
//                self.present(vc! , animated: true , completion: nil )
//            }))
//
//            refreshAlert.addAction(UIAlertAction(title: "No", style: .cancel, handler: { (action: UIAlertAction!) in
//                print("Handle Cancel Logic here")
//            }))
//
//            present(refreshAlert, animated: true, completion: nil)
//        }
    }
    
}
extension UITableView {
    
    func scrollToBottom(animated: Bool) {
        
        DispatchQueue.main.async {
            let point = CGPoint(x: 0, y: self.contentSize.height + self.contentInset.bottom - self.frame.height)
            if point.y >= 0 {
                self.setContentOffset(point, animated: animated)
            }
        }
    }
    func scrollToTop() {
        DispatchQueue.main.async {
            let indexPath = IndexPath(row: 0, section: 0)
            if self.hasRowAtIndexPath(indexPath: indexPath) {
                self.scrollToRow(at: indexPath, at: .top, animated: false)
           }
        }
    }
    func hasRowAtIndexPath(indexPath: IndexPath) -> Bool {
        return indexPath.section < self.numberOfSections && indexPath.row < self.numberOfRows(inSection: indexPath.section)
    }
}


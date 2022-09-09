//
//  SpecialitiesViewController.swift
//  YAS Clinic
//
//  Created by MAC-1 on 01/03/2022.
//

import UIKit
import SDWebImage
import LanguageManager_iOS

class SpecialitiesViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var notificationButton: UIBarButtonItem!
    
    
    var isSideMenu = true
    let btn = BadgedButtonItem(with: UIImage(named: "bell"))
    
//    let dataArray = ["Specialities","Book an Appointment","Hospitals","About Covid 19","PCR Test","Insurance Network","Specialities","Book an Appointment","Hospitals","About Covid 19","PCR Test","Insurance Network"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.tintColor = UIColor.white
        collectionView.register(UINib(nibName: "ServicesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ServicesCollectionViewCell")
        NotificationCenter.default.addObserver(self, selector: #selector(self.catchIt(_:)), name: NSNotification.Name(rawValue: "languageTapObserver"), object: nil)
//        setupRightItem()
        //        self.title = "SEARCH SPECIALITY"
        // Do any additional setup after loading the view.
        
        self.navigationItem.rightBarButtonItem = btn
//        self.navigationItem.rightBarButtonItem
//        self.btn.setBadge(with: 10)
        btn.tapAction = {

            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "NotificationsViewController") as! NotificationsViewController

            vc.modalPresentationStyle = .fullScreen
            vc.modalTransitionStyle = .crossDissolve
    //        self.present(vc, animated: true, completion: nil)
            self.navigationController?.pushViewController(vc,animated: true)
        }
    }
    
    //MARK: - On tap language
    @objc func catchIt(_ userInfo: Notification){
        getSpecialities(language: selectedLanguage)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
        tabBarController?.selectedIndex = 0
        navigationController?.setTintColor(.white)
        navigationController?.backgroundColor(UIColor(hexString: Constants.Colors.AppBlueColor))
        self.navigationItem.rightBarButtonItem?.tintColor = .white
        self.navigationController?.navigationBar.topItem?.title = "speciality_Main_title".localiz()
        let language = LanguageManager.shared.currentLanguage
        if language == .english{
            selectedLanguage = englishLanguage
        }else{
            selectedLanguage = arabicLanguage
        }
        
        getSpecialities(language: selectedLanguage)
//        setupRightItem()
        self.tabBarController?.tabBar.backgroundColor = UIColor(hexString: "#003A70")
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
    }
    @IBAction func sideMenuAction(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "SideMenuNavigationController")
        self.present(controller, animated: true, completion: nil)
    }
    
    @IBAction func notificationAction(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "NotificationsViewController") as! NotificationsViewController
        
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .crossDissolve
//        self.present(vc, animated: true, completion: nil)
                navigationController?.pushViewController(vc,animated: true)
    }
    
    var specialities : Specialities_Base!
    var speciliatiesArray = [Specialities_Base.Data]()
    func getSpecialities(language: String){
        loading.show(vc: self)
        ApiManager.callRestApi(url: Router.getSpecialities(["sort":"title", "locale": language, "populate":"*"]), myCustomClass: Specialities_Base.self, completionHandler: {
            (data,error) in
            if error == "204"{
                loading.dismiss()
            }else if let dt = data{
                
                
                self.speciliatiesArray = dt.data!
                loading.dismiss()
                self.collectionView.reloadData()
                
            }else{
                loading.dismiss()
                HAlert.ShowBoldToast(VC: self, msg: "something_went_wrong".localiz())
            }
        })
    }
    
    var notifications : Notifications_Base!
    var notificationsArray = [Notifications_Base.Data]()
    func getNotificationsCount(language: String, deviceId: String){
        loading.show(vc: self)
        ApiManager.callRestApi(url: Router.getNotificationsCount(["populate": "*", "filters[device_id][$eq]":deviceId,"pagination[pageSize]":"100", "filters[status][$eq]": "true"]), myCustomClass: Notifications_Base.self, completionHandler: {
            (data,error) in
            if error == "204"{
//                loading.dismiss()
            }else if let dt = data{
                self.notificationsArray.removeAll()
                
                self.notificationsArray = dt.data!
                loading.dismiss()
//                self.tableView.reloadData()
                let notificationsCount = self.notificationsArray.count
                if notificationsCount > 0{
                    self.btn.setBadge(with: notificationsCount)
                }
                
            }else{
                loading.dismiss()
//                HAlert.ShowBoldToast(VC: self, msg: "Some thing went wrong")
            }
        })
    }
    
}

extension SpecialitiesViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return speciliatiesArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:ServicesCollectionViewCell = self.collectionView.dequeueReusableCell(withReuseIdentifier: "ServicesCollectionViewCell", for: indexPath) as! ServicesCollectionViewCell
        
        
        let data = speciliatiesArray[indexPath.row]
        //for arabic
//        cell.serviceNameLabel.text = data.attributes?.localizations?.data?.first?.attributes?.title
        
        cell.serviceNameLabel.text = data.attributes?.title
//        let image = "https://api-yas.broomstickcreative.com/uploads/medium_DENTISTRY_7e2c2c89e2.png"
        
        let image = data.attributes?.icon?.Icon_data?.attributes?.formats?.small?.url
        let newString = image?.replacingOccurrences(of: " ", with: "%20", options: .literal, range: nil)
        let url = "https://api-yas.broomstickcreative.com\(newString!)"
        cell.serviceImageView.sd_setImage(with: URL(string: url ),placeholderImage: #imageLiteral(resourceName: "person"))//, placeholderImage: #imageLiteral(resourceName: "Rectangle 65")
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let data = speciliatiesArray[indexPath.row]
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "DoctorsViewController") as! DoctorsViewController
        vc.modalPresentationStyle = .fullScreen
        vc.screenTitle = (data.attributes?.title)!
        vc.doctorsData = data.attributes?.doctors
        
        let language = LanguageManager.shared.currentLanguage
        if language == .english{
            
            if let specialityID = data.id{
                vc.specialityId = specialityID
                navigationController?.pushViewController(vc,animated: true)
            }
        }else{
            if let locSpecialityID = data.attributes?.localizations?.data?.first?.id{
                vc.specialityId = locSpecialityID
                navigationController?.pushViewController(vc,animated: true)
            }
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 15.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.collectionView.frame.width/2.1, height: self.collectionView.frame.height/4.2)
    }
}


//https://api-yas.broomstickcreative.com/api/specialties?locale=ar-AE&populate=*&
//https://api-yas.broomstickcreative.com/api/specialties?locale=ar-AE&populate=*


extension UINavigationController {
    func transparentNavigationBar() {
        self.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationBar.shadowImage = UIImage()
        self.navigationBar.isTranslucent = true
    }

    func setTintColor(_ color: UIColor) {
        self.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: color]
        self.navigationBar.tintColor = color
    }

    func backgroundColor(_ color: UIColor) {
        navigationBar.setBackgroundImage(nil, for: .default)
        navigationBar.barTintColor = color
        navigationBar.shadowImage = UIImage()
    }
}

/*public enum Languages: String {
 case nl,ja,ko,vi,ru,sv,fr,es,pt,it,de,da,fi,nb,tr,el,id,
      ms,th,hi,hu,pl,cs,sk,uk,hr,ca,ro,he,ur,fa,ku,arc,sl,ml,am
   case enGB = "en-GB"
   case enAU = "en-AU"
   case enCA = "en-CA"
   case enIN = "en-IN"
   case frCA = "fr-CA"
   case esMX = "es-MX"
   case ptBR = "pt-BR"
   case zhHans = "zh-Hans"
   case zhHant = "zh-Hant"
   case zhHK = "zh-HK"
   case es419 = "es-419"
   case ptPT = "pt-PT"
   case arabic = "ar-AE"
   case english = "en"
   case deviceLanguage
}*/

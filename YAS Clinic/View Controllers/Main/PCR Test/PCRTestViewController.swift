//
//  PCRTestViewController.swift
//  YAS Clinic
//
//  Created by MAC-1 on 01/03/2022.
//

import UIKit
import WebKit
import MapKit
import MessageUI

class PCRTestViewController: UIViewController, MFMailComposeViewControllerDelegate {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var PCRTestView: UIView!
    
    @IBOutlet weak var coloredView: CustomGradientView!
    @IBOutlet weak var whiteView: CustomGradientView!
    @IBOutlet weak var vaccinationButton: UIButton!
    @IBOutlet weak var locationButton: UIButton!
    
    
    @IBOutlet weak var webView: WKWebView!
    var isSideMenu = false
    let btn = BadgedButtonItem(with: UIImage(named: "bell"))
    let userProfileButton = UIButton(type: .custom)
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UINib(nibName: "HospitalsTableViewCell", bundle: nil), forCellReuseIdentifier: "HospitalsTableViewCell")
        self.tableView.estimatedRowHeight = UITableView.automaticDimension//272.0
        self.tableView.rowHeight = UITableView.automaticDimension
        
//        setupRightItem()
        self.navigationItem.rightBarButtonItem = btn
        self.navigationController?.navigationBar.tintColor = UIColor.white
        btn.tapAction = {

            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "NotificationsViewController") as! NotificationsViewController

            vc.modalPresentationStyle = .fullScreen
            vc.modalTransitionStyle = .crossDissolve
    //        self.present(vc, animated: true, completion: nil)
            self.navigationController?.pushViewController(vc,animated: true)
        }
        coloredView.isHidden = true
        whiteView.isHidden = true
    }
    override func viewWillAppear(_ animated: Bool) {
        
//        self.navigationItem.top = "LOCATIONS"
        self.navigationItem.rightBarButtonItem?.tintColor = .white
        navigationController?.backgroundColor(UIColor(hexString: Constants.Colors.AppBlueColor))
        self.tabBarController?.selectedIndex = 2
        if isSideMenu{
            self.title = "title_locations".localiz()
        }else{
            self.navigationController?.navigationBar.topItem?.title = "title_locations".localiz()
        }
        
        
        PCRTestView.isHidden = true
        webView.isHidden = true
        getHospitals(language: selectedLanguage)
        self.tabBarController?.tabBar.backgroundColor = UIColor(hexString: "#003A70")
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        locationButton.setTitle("location".localiz(), for: .normal)
        vaccinationButton.setTitle("vaccination_pcr_test".localiz(), for: .normal)
    }
    private func setupRightItem() {
        
        userProfileButton.imageView?.contentMode = .scaleAspectFill
        userProfileButton.clipsToBounds = true
        userProfileButton.addTarget(self, action: #selector(notificationTapped), for: .touchUpInside)
        let image = UIImage(systemName: "bell")
        userProfileButton.setImage(image, for: .normal)
        userProfileButton.tintColor = .white
        userProfileButton.frame = CGRect(x: 0, y: 5, width: 70, height: 70)
//        userProfileButton.layer.cornerRadius = 20
        userProfileButton.clipsToBounds = true
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: userProfileButton)
        
        userProfileButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        userProfileButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    //MARK:- Action Navigation ImageView
    @objc private func notificationTapped() {
        // -> Action
        print("Clicked")
//        let vc = storyboard?.instantiateViewController(withIdentifier: "UserProfileVC") as! UserProfileVC
//
//        vc.modalPresentationStyle = .fullScreen
//        vc.modalTransitionStyle = .crossDissolve
//        navigationController?.pushViewController(vc,animated: true)
        
    }
    @IBAction func sideMenuAction(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "SideMenuNavigationController")
        self.present(controller, animated: true, completion: nil)
    }

    @IBAction func vaccinationAction(_ sender: Any) {
        self.title = "title_pcr_test".localiz()
        coloredView.isHidden = false
        vaccinationButton.setTitleColor(.white, for: .normal)
        whiteView.isHidden = false
        locationButton.setTitleColor(UIColor(hexString: "1B99B8"), for: .normal)
        
        webView.isHidden = false
//        let url = URL(string: "http://yasclinicpcrbooking.ae:7777/pls/apex/f?p=817:4:6061319263913")
//        webView.load(URLRequest(url: url!))
        
        webView.load(NSURLRequest(url: NSURL(string: "http://yasclinicpcrbooking.ae:7777/pls/apex/f?p=817:4:6061319263913")! as URL) as URLRequest)
        tableView.isHidden = true
    }
    
    @IBAction func locationAction(_ sender: Any) {
        self.title = "title_locations".localiz()
        coloredView.isHidden = true
        vaccinationButton.setTitleColor(UIColor(hexString: "1B99B8"), for: .normal)
        whiteView.isHidden = true
        locationButton.setTitleColor(.white, for: .normal)
        
        webView.isHidden = true
        tableView.isHidden = false
    }
    var hospitals : Hospitals_Base!
    var hospitalsArray = [Hospitals_Base.Data]()
    func getHospitals(language: String){
        loading.show(vc: self)
        ApiManager.callRestApi(url: Router.getHospitals(["locale": language, "populate":"*"]), myCustomClass: Hospitals_Base.self, completionHandler: {
            (data,error) in
            if error == "204"{
                loading.dismiss()
            }else if let dt = data{
                
                
                self.hospitalsArray = dt.data!
                loading.dismiss()
                self.tableView.reloadData()
                
            }else{
                loading.dismiss()
                HAlert.ShowBoldToast(VC: self, msg: "something_went_wrong".localiz())
            }
        })
    }
}
//http://yasclinicpcrbooking.ae:7777/pls/apex/f?p=817:4:6061319263913
extension PCRTestViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hospitalsArray.count
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
        let cell:HospitalsTableViewCell = self.tableView.dequeueReusableCell(withIdentifier: "HospitalsTableViewCell") as! HospitalsTableViewCell
        cell.selectedBackgroundView?.backgroundColor = .clear
        tableView.backgroundColor = UIColor.clear
        
        let data = hospitalsArray[indexPath.row]
        
        cell.getDirectionsButton.setTitle("get_direction".localiz(), for: .normal)
        
        cell.appointmentButtonView.isHidden = true
        cell.hospitalNameLabel.text = data.attributes?.hos_name
        cell.locationLabel.text = data.attributes?.hos_address
        cell.phoneNoLabel.text = data.attributes?.hos_phone
        
        let image = data.attributes?.hos_img?.data?.attributes?.url
        let newString = image?.replacingOccurrences(of: " ", with: "%20", options: .literal, range: nil)
        let url = "https://api-yas.broomstickcreative.com\(newString!)"
        cell.hospitalImageView.sd_setImage(with: URL(string: url ),placeholderImage: #imageLiteral(resourceName: "person"))
        
        cell.getDirectionsButton.tag = indexPath.row
        cell.getDirectionsButton.addTarget(self, action: #selector(getDirectionsAction), for: .touchUpInside)
        
        cell.locationButton.tag = indexPath.row
        cell.locationButton.addTarget(self, action: #selector(getDirectionsAction), for: .touchUpInside)
        
        cell.callButton.tag = indexPath.row
        cell.callButton.addTarget(self, action: #selector(callAction), for: .touchUpInside)
        
        cell.emailButton.tag = indexPath.row
        cell.emailButton.addTarget(self, action: #selector(emailAction), for: .touchUpInside)
        
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
    
    
    @objc func getDirectionsAction(sender: UIButton){
        print(sender.tag)
        let tag:NSInteger = sender.tag
        let indexPath = IndexPath(row: tag, section: 0)
//        let cell = tableView.cellForRow(at: indexPath) as! BookingCalendarTableViewCell
        let data = hospitalsArray[indexPath.row]
        
        if let latLong = data.attributes?.hos_lat_lon{
            let lat = latLong.components(separatedBy: ",")[0].removeWhitespace()
            let lng = latLong.components(separatedBy: ",")[1].removeWhitespace()
            
            print(lat)
            print(lng)

            openAppleMap(latitude: lat, longitude: lng, hospitalName: data.attributes?.hos_name ?? "")
        }
//        let vc = storyboard?.instantiateViewController(withIdentifier: "DirectionsViewController") as! DirectionsViewController
//        vc.modalPresentationStyle = .fullScreen
//        navigationController?.pushViewController(vc,animated: true)

    }
    @objc func callAction(sender: UIButton){
        print(sender.tag)
        let tag:NSInteger = sender.tag
        let indexPath = IndexPath(row: tag, section: 0)
        let data = hospitalsArray[indexPath.row]
        
        if let phoneNumber = data.attributes?.hos_phone{
            dialNumber(number: phoneNumber)
        }
    }
    
    @objc func emailAction(sender: UIButton){
        print(sender.tag)
        let tag:NSInteger = sender.tag
        let indexPath = IndexPath(row: tag, section: 0)
        let data = hospitalsArray[indexPath.row]
        
//        if let email = data.attributes?.email{
            sendEmail(email: "info@yasclinicgroup.ae")
//        }
    }
    
    func openAppleMap(latitude: String, longitude: String, hospitalName: String){
        guard let latDouble =  Double(latitude) else {return }
        guard let longDouble =  Double(longitude) else {return }
        
        let regionDistance:CLLocationDistance = 10000
            let coordinates = CLLocationCoordinate2DMake(latDouble, longDouble)
        let regionSpan = MKCoordinateRegion(center: coordinates, latitudinalMeters: regionDistance, longitudinalMeters: regionDistance)
            let options = [
                MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center),
                MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span)
            ]
            let placemark = MKPlacemark(coordinate: coordinates, addressDictionary: nil)
            let mapItem = MKMapItem(placemark: placemark)
            mapItem.name = hospitalName
        mapItem.openInMaps(launchOptions: options)
    }
    
    func dialNumber(number : String) {

        guard let url = URL(string: "tel://\(number)") else {
        return //be safe
        }

        if #available(iOS 10.0, *) {
        UIApplication.shared.open(url)
        } else {
        UIApplication.shared.openURL(url)
        }
    }
    
    func sendEmail(email: String){
        // Modify following variables with your text / recipient
        let recipientEmail = email
        let subject = ""
        let body = ""
        
        // Show default mail composer
        if MFMailComposeViewController.canSendMail() {
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self
            mail.setToRecipients([recipientEmail])
            mail.setSubject(subject)
            mail.setMessageBody(body, isHTML: false)
            
            present(mail, animated: true)
            
            // Show third party email composer if default Mail app is not present
        } else if let emailUrl = createEmailUrl(to: recipientEmail, subject: subject, body: body) {
            UIApplication.shared.open(emailUrl)
        }
    }
    
    //MARK: - MFMail compose method
    
    private func createEmailUrl(to: String, subject: String, body: String) -> URL? {
        let subjectEncoded = subject.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        let bodyEncoded = body.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        
        let gmailUrl = URL(string: "googlegmail://co?to=\(to)&subject=\(subjectEncoded)&body=\(bodyEncoded)")
        let outlookUrl = URL(string: "ms-outlook://compose?to=\(to)&subject=\(subjectEncoded)")
        let yahooMail = URL(string: "ymail://mail/compose?to=\(to)&subject=\(subjectEncoded)&body=\(bodyEncoded)")
        let sparkUrl = URL(string: "readdle-spark://compose?recipient=\(to)&subject=\(subjectEncoded)&body=\(bodyEncoded)")
        let defaultUrl = URL(string: "mailto:\(to)?subject=\(subjectEncoded)&body=\(bodyEncoded)")
        
        if let gmailUrl = gmailUrl, UIApplication.shared.canOpenURL(gmailUrl) {
            return gmailUrl
        } else if let outlookUrl = outlookUrl, UIApplication.shared.canOpenURL(outlookUrl) {
            return outlookUrl
        } else if let yahooMail = yahooMail, UIApplication.shared.canOpenURL(yahooMail) {
            return yahooMail
        } else if let sparkUrl = sparkUrl, UIApplication.shared.canOpenURL(sparkUrl) {
            return sparkUrl
        }
        
        return defaultUrl
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true)
    }
}

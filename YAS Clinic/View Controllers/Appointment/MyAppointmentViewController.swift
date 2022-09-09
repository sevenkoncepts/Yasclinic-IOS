//
//  MyAppointmentViewController.swift
//  YAS Clinic
//
//  Created by MAC-1 on 07/03/2022.
//

import UIKit
import SDWebImage

class MyAppointmentViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var recentAppointmentView: UIView!
    
    @IBOutlet weak var coloredView: CustomGradientView!
    @IBOutlet weak var whiteView: CustomGradientView!
    
    @IBOutlet weak var upcomingButton: UIButton!
    @IBOutlet weak var historyButton: UIButton!
    var isFromThankyou = false
    
    var recent = true
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UINib(nibName: "MyAppointmentTableViewCell", bundle: nil), forCellReuseIdentifier: "MyAppointmentTableViewCell")
        
        tableView.register(UINib(nibName: "RecentAppointmentTableViewCell", bundle: nil), forCellReuseIdentifier: "RecentAppointmentTableViewCell")
        
        self.tableView.estimatedRowHeight = UITableView.automaticDimension//272.0
        self.tableView.rowHeight = UITableView.automaticDimension
        
        
        recentAppointmentView.isHidden = true
        
        
//        coloredView.isHidden = true
//        whiteView.isHidden = true
        
    }
    override func viewWillAppear(_ animated: Bool) {
//        recentAppointmentView.isHidden = false
//        tableView.isHidden = true
        self.title = "my_appointment".localiz()
        historyButton.setTitle("history".localiz(), for: .normal)
        upcomingButton.setTitle("upcoming".localiz(), for: .normal)
        
        setUpcomingButton()
        
        self.navigationController?.navigationBar.tintColor = UIColor.white
        let currentDate = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd" //"2022-04-14"
        let formattedDate = formatter.string(from: currentDate)
        getUpcomingBookings(language: selectedLanguage, date: formattedDate)
        getRecentBookings(language: selectedLanguage, date: formattedDate)
        
        if isFromThankyou{
            
//            setUpcomingButton()
            
//            recentAppointmentView.isHidden = true
//            tableView.isHidden = false
//            coloredView.isHidden = false
//            historyButton.setTitleColor(UIColor(hexString: "1B99B8"), for: .normal)
//            whiteView.isHidden = false
//            upcomingButton.setTitleColor(.white, for: .normal)
            
            self.navigationItem.setHidesBackButton(true, animated: true)
        }
    }
    
//    var emptyBackgroundView = UIView()
//    func setupEmptyBackgroundView() {
//        let image = UIImage(named: "logo")!.withRenderingMode(.alwaysTemplate)
//        let topMessage = "my_appointments".localiz()
//        let bottomMessage = "dont_have_any_appointment".localiz()
//        emptyBackgroundView = EmptyBackgroundView(image: image, top: topMessage, bottom: bottomMessage)
//        emptyBackgroundView.isHidden = false
//        self.tableView.backgroundView = emptyBackgroundView
//        self.tableView.tableFooterView = UIView()
//        self.tableView.backgroundColor = .clear
//        view.setNeedsLayout()
//        view.layoutIfNeeded()
//    }
    
    @IBAction func upcomingAction(_ sender: Any) {
        setUpcomingButton()
    }
    
    @IBAction func historyAction(_ sender: Any) {
        setHistoryButton()
    }
    
    func setUpcomingButton(){
        coloredView.isHidden = true
        upcomingButton.setTitleColor(.white, for: .normal)
        whiteView.isHidden = true
        historyButton.setTitleColor(UIColor(hexString: "1B99B8"), for: .normal)
        
//        recentAppointmentView.isHidden = false
        recent = true
        tableView.reloadData()
    }
    func setHistoryButton(){
        coloredView.isHidden = false
        upcomingButton.setTitleColor(UIColor(hexString: "1B99B8"), for: .normal)
        whiteView.isHidden = false
        historyButton.setTitleColor(.white, for: .normal)
        
//        recentAppointmentView.isHidden = true
        recent = false
        tableView.reloadData()
    }
    
    var upcomingbookings : UpcomingBookings_Base!
    var upcomingBookingsArray = [UpcomingBookings_Base.Data]()
    
    
    func getUpcomingBookings(language: String, date: String){
        loading.show(vc: self)
        ApiManager.callRestApi(url: Router.getUpcomingBookings(["populate": "date_id,month_id,year_id,timing_id_from,timing_id_to,doctor_id.doc_img,specialty_id,hospital_id,users_id",
                                                              "filters[createdAt][$gt]":"\(date)",
                                                                "filters[users_id][id][$eq]":"\(user.id)"]),
                               myCustomClass: UpcomingBookings_Base.self, completionHandler: {
            (data,error) in
            if error == "204"{
                loading.dismiss()
            }else if let dt = data{
                
                self.upcomingBookingsArray.removeAll()
                self.upcomingBookingsArray = dt.data!
                
                print("bookings Count: \(self.upcomingBookingsArray.count)")
                
                if self.upcomingBookingsArray.count > 0{
                    
                    loading.dismiss()
                    
                    self.tableView.reloadData()
                }else{
                    loading.dismiss()
                    self.tableView.setEmptyMessage("dont_have_any_appointment".localiz())
                }
            }else{
                loading.dismiss()
                HAlert.ShowBoldToast(VC: self, msg: "something_went_wrong".localiz())
            }
        })
    }
    
    
    var recentBookings : RecentBookings_Base!
    var recentBookingsArray = [RecentBookings_Base.Data]()
    
    
    func getRecentBookings(language: String, date: String){
        loading.show(vc: self)
        ApiManager.callRestApi(url: Router.getRecentBookings(["populate": "date_id,month_id,year_id,timing_id_from,timing_id_to,doctor_id.doc_img,specialty_id,hospital_id,users_id",
                                                              "filters[createdAt][$lt]":"\(date)",
                                                              "filters[users_id][id][$eq]":"\(user.id)"]),
                               myCustomClass: RecentBookings_Base.self, completionHandler: {
            (data,error) in
            if error == "204"{
                loading.dismiss()
            }else if let dt = data{
                
                self.recentBookingsArray.removeAll()
                
                self.recentBookingsArray = dt.data!
                
                print("recent bookings Count: \(self.recentBookingsArray.count)")
                loading.dismiss()
                
                self.tableView.reloadData()
                
            }else{
                loading.dismiss()
                HAlert.ShowBoldToast(VC: self, msg: "something_went_wrong".localiz())
            }
        })
    }
    
    
    
}

extension MyAppointmentViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if !recent{
            if recentBookingsArray.count == 0{
                self.tableView.setEmptyMessage("dont_have_any_appointment".localiz())
            }else{
                self.tableView.restore()
            }
            return recentBookingsArray.count
        }else{
            if upcomingBookingsArray.count == 0{
                self.tableView.setEmptyMessage("dont_have_any_appointment".localiz())
            }else{
                self.tableView.restore()
            }
            return upcomingBookingsArray.count
        }
        
    }
//    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//        cell.alpha = 0.7
//        UIView.animate(withDuration: 1.0) {
//            cell.alpha = 1.0
//        }
////        if indexPath.row == notificationsArray.count - 1 {
////            if datacount > 7{
////                self.paginationApplied = true
////                if notification.pagination.currentPage <= notification.pagination.totalPages{
////                    GetNotifications(page: notification.pagination.currentPage + 1)
////                }
////            }
////        }
//    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if recent{
            let cell:RecentAppointmentTableViewCell = self.tableView.dequeueReusableCell(withIdentifier: "RecentAppointmentTableViewCell") as! RecentAppointmentTableViewCell
            cell.selectedBackgroundView?.backgroundColor = .clear
            tableView.backgroundColor = UIColor.clear
            
            let data = upcomingBookingsArray[indexPath.row].attributes
            
            cell.doctorNameLabel.text = data?.doctor_id?.data?.attributes?.doc_name
            cell.designationLabel.text = data?.doctor_id?.data?.attributes?.doc_designation
            
            
            let month = data?.month_id?.data?.attributes?.month_name ?? ""
            let day = data?.date_id?.data?.attributes?.date_name ?? ""
            let year = data?.year_id?.data?.attributes?.year_name ?? ""
            
            let time = data?.timing_id_from?.data?.attributes?.name ?? ""
            
            cell.dateTimeLabel.text = "\(month) \(day), \(year) - \(time)"
            cell.phoneNumberLabel.text = data?.hospital_id?.data?.attributes?.hos_phone
            
            
            cell.doctorImageView.cornerRadiuss = cell.doctorImageView.frame.height/2
            
            let image = data?.doctor_id?.data?.attributes?.doc_img?.data?.attributes?.url
            let newString = image?.replacingOccurrences(of: " ", with: "%20", options: .literal, range: nil)
            let url = "https://api-yas.broomstickcreative.com\(newString!)"
            cell.doctorImageView.sd_setImage(with: URL(string: url ),placeholderImage: #imageLiteral(resourceName: "person"))
            
            return cell
        }else{
            let cell:MyAppointmentTableViewCell = self.tableView.dequeueReusableCell(withIdentifier: "MyAppointmentTableViewCell") as! MyAppointmentTableViewCell
            cell.selectedBackgroundView?.backgroundColor = .clear
            tableView.backgroundColor = UIColor.clear
            
            let data = recentBookingsArray[indexPath.row]
            
            cell.doctorNameLabel.text = data.attributes?.doctor_id?.data?.attributes?.doc_name
            cell.designationLabel.text = data.attributes?.doctor_id?.data?.attributes?.doc_designation
            
            cell.addressLabel.text = data.attributes?.hospital_id?.data?.attributes?.hos_address
            cell.phoneNumLabel.text = data.attributes?.hospital_id?.data?.attributes?.hos_phone
            cell.procedureLabel.text = "Procedure: \(data.attributes?.doctor_id?.data?.attributes?.doc_designation ?? "")"
            let month = data.attributes?.month_id?.data?.attributes?.month_name ?? ""
            let day = data.attributes?.date_id?.data?.attributes?.date_name ?? ""
            let year = data.attributes?.year_id?.data?.attributes?.year_name ?? ""
            
            cell.dateLabel.text = "\(month) \(day), \(year)"
            cell.timeLabel.text = data.attributes?.timing_id_from?.data?.attributes?.name
            
            let image = data.attributes?.doctor_id?.data?.attributes?.doc_img?.data?.attributes?.url
            let newString = image?.replacingOccurrences(of: " ", with: "%20", options: .literal, range: nil)
            let url = "https://api-yas.broomstickcreative.com\(newString!)"
            cell.doctorImageView.sd_setImage(with: URL(string: url ),placeholderImage: #imageLiteral(resourceName: "person"))
            
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
    
    
    
}

//
//  CalendarViewController.swift
//  YAS Clinic
//
//  Created by MAC-1 on 07/03/2022.
//

import UIKit
import Alamofire


class CalendarViewController: UIViewController {
    
    @IBOutlet weak var appointmentDatePicker: UIDatePicker!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var dateButtonTitleView: UIStackView!
    @IBOutlet weak var yourAppointmentPopUpView: UIView!
    
    @IBOutlet weak var BookAnAppointmentButton: UIButton!
    @IBOutlet weak var coloredView: CustomGradientView!
    @IBOutlet weak var whiteView: CustomGradientView!
    @IBOutlet weak var rescheduleButton: UIButton!
    @IBOutlet weak var doctorNameLabel: UILabel!
    @IBOutlet weak var designationLabel: UILabel!
    @IBOutlet weak var specialityLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    
    
    @IBOutlet weak var selectDateToMakeAppointmentLabel: UILabel!
    @IBOutlet weak var pickADateButton: UIButton!
    @IBOutlet weak var popupDesignationLabel: UILabel!
    @IBOutlet weak var popupDoctorNameLabel: UILabel!
    @IBOutlet weak var consultationLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var popupAddressLabel: UILabel!
    @IBOutlet weak var phoneNumLabel: UILabel!
    
    @IBOutlet weak var payCashView: CustomGradientView!
    @IBOutlet weak var payCashLabel: UILabel!
    @IBOutlet weak var payCashIcon: UIImageView!
    
    
    @IBOutlet weak var payOnlineView: CustomGradientView!
    @IBOutlet weak var payOnlineLabel: UILabel!
    @IBOutlet weak var payOnlineIcon: UIImageView!
    
    @IBOutlet weak var scrollViewHeight: NSLayoutConstraint!
    
    var doctor_ID = 0
    var speciality_ID = 0
    var selectedIndex = -1
    var dateSelect = false
    var i = -1
    let myGroup = DispatchGroup()
    
    var userSelectedTime = ""
    
    var cashType = "cash"
    
    let online = "online"
    let cash = "cash"
    
    //    var dummyTime = ["8:00 am","9:00 am","10:00 am","11:00 am","12:00 pm","1:00 pm","2:00 pm","3:00 pm","4:00 pm","5:00 pm","6:00 pm","7:00 pm","8:00 pm","9:00 pm","10:00 pm","11:00 pm","12:00 am"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        coloredView.isHidden = true
        whiteView.isHidden = true
        //        appointmentDatePicker.minimumDate = Date()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        self.title = "calender".localiz()
        if selectedLanguage == arabicLanguage{
//            appointmentDatePicker.locale = Locale(identifier: "ar")
        }
        
        yourAppointmentPopUpView.isHidden = true
        //        resetSchedule()
        getSchedule(language: selectedLanguage, doctorID: doctor_ID)
        
        setPayCash()
        
        pickADateButton.setTitle("pick-A-Date".localiz(), for: .normal)
        selectDateToMakeAppointmentLabel.text = "select-date-to-make-an-appointment".localiz()
        payCashLabel.text = "pay_cash_at_clinic".localiz()
        payOnlineLabel.text = "pay_cash_at_online".localiz()
        
        BookAnAppointmentButton.setTitle("book_an_appointment".localiz(), for: .normal)
    }
    
    @IBAction func rescheduleAction(_ sender: Any) {
        coloredView.isHidden = false
        rescheduleButton.setTitleColor(.white, for: .normal)
        whiteView.isHidden = false
        BookAnAppointmentButton.setTitleColor(UIColor(hexString: "1B99B8"), for: .normal)
        
        self.tabBarController?.tabBar.isHidden = false
        self.navigationController?.isNavigationBarHidden = false
        yourAppointmentPopUpView.isHidden = true
        
    }
    
    @IBAction func bookAnAppointmentAction(_ sender: Any){
        if dateSelect{
            if cashType == cash{
                self.confirmPopup()
            }else if cashType == online{
                HAlert.CreateAlert(title: "alert".localiz(), message: "online_payment_alert".localiz(), ViewController: self)
            }
        }else{
            HAlert.CreateAlert(title: "alert".localiz(), message: "pick_a_date".localiz(), ViewController: self)
//            HAlert.ShowToast(VC: self, msg: "pick_a_date".localiz())
        }
    }
    
    @IBAction func dismissAction(_ sender: Any) {
        self.tabBarController?.tabBar.isHidden = false
        self.navigationController?.isNavigationBarHidden = false
        yourAppointmentPopUpView.isHidden = true
    }
    
    @IBAction func payCashAction(_ sender: Any) {
        setPayCash()
        cashType = cash
    }
    
    @IBAction func payOnlineAction(_ sender: Any) {
        setPayOnline()
        cashType = online
        
    }
    
    func setPayCash(){
        payCashView.backgroundColor = UIColor(hexString: Constants.Colors.AppBlueColor)
        payCashLabel.textColor = .white
        payCashIcon.tintColor = .white
        
        payOnlineView.backgroundColor = .white
        payOnlineLabel.textColor = UIColor(hexString: Constants.Colors.AppBlueColor)
        payOnlineIcon.tintColor = UIColor(hexString: Constants.Colors.AppBlueColor)
    }
    
    func setPayOnline(){
        
        payCashView.backgroundColor = .white
        payCashLabel.textColor = UIColor(hexString: Constants.Colors.AppBlueColor)
        payCashIcon.tintColor = UIColor(hexString: Constants.Colors.AppBlueColor)
        
        payOnlineView.backgroundColor = UIColor(hexString: Constants.Colors.AppBlueColor)
        payOnlineLabel.textColor = .white
        payOnlineIcon.tintColor = .white
    }
    
    
    @IBAction func nextPopUpAction(_ sender: Any) {
        
//        let data = selectedDateSchedule
//
//        if let toTimeId = data?.availability?[selectedIndex].to_time?.data?.id,
//           let monthId = data?.month_id?.data?.id,
//           let yearId = data?.year_id?.data?.id,
//           let dateId = data?.date_id?.data?.id,
//           let fromTimeId = data?.availability?[selectedIndex].from_time?.data?.id,
//           let hospitalId = data?.hospital_id?.data?.id,
//           let yearName = data?.year_id?.data?.attributes?.year_name,
//           let monthName = data?.month_id?.data?.attributes?.month_name,
//           let dateName = data?.date_id?.data?.attributes?.date_name{
//
//            let date = "\(monthName) \(dateName),\(yearName)"
//
//            confirmBooking(doctorId: doctor_ID, timeToId: toTimeId, fullName: user.username, monthId: monthId, specialityId: speciality_ID, phoneNumber: user.Phone_number, yearId: yearId, dateId: dateId, timeFromId: fromTimeId, hospitalId: hospitalId, email: user.email, doctorName: <#T##String#>, date: date, time: <#T##String#>)
//        }
 
        
        
    }
    
    //MARK: - Get doctor schedule by Doctor ID
    var schedules : Schedule_Base!
    var scheduleArray = [Schedule_Base.Data]()
    
    var selectedDateSchedule : Schedule_Base.Schedule!
    //    var timingArray = [String]()
    func getSchedule(language: String, doctorID: Int){
        loading.show(vc: self)
        ApiManager.callRestApi(url: Router.getSchedule(["filters[doctor_id][id][$eq]": "\(doctorID)", "populate":"doctor_id,schedule.availability.from_time,schedule.availability.to_time,schedule.date_id,schedule.month_id,schedule.year_id,schedule.hospital_id"]), myCustomClass: Schedule_Base.self, completionHandler: {
            (data,error) in
            if error == "204"{
                loading.dismiss()
            }else if let dt = data{
                
                
                self.scheduleArray = dt.data!
                
                self.doctorNameLabel.text = self.scheduleArray.first?.attributes?.doctor_id?.data?.attributes?.doc_name?.capitalizingFirstLetter()
                self.designationLabel.text = self.scheduleArray.first?.attributes?.doctor_id?.data?.attributes?.doc_designation?.capitalizingFirstLetter()
                self.specialityLabel.text = self.scheduleArray.first?.attributes?.doctor_id?.data?.attributes?.doc_designation?.components(separatedBy: " ")[0]
                
                
                print("Schedule Count: \(self.scheduleArray.first?.attributes?.schedule?.count)")
                
                if self.scheduleArray.count > 0{
                    
                    for schedule in self.scheduleArray{
                        
                        for cc in schedule.attributes?.schedule ?? []{
                            
                            self.addressLabel.text = cc.hospital_id?.data?.attributes?.hos_address
                            let year = cc.year_id?.data?.attributes?.year_name
                            let month = cc.month_id?.data?.attributes?.month_name
                            let date = cc.date_id?.data?.attributes?.date_name
                            
                            let currentDate = Date()
                            let format = currentDate.getFormattedDate(format: "yyyy-MMMM-dd-EEEE")
                            let currentYear = format.components(separatedBy: "-")[0]
                            let currentMonth = format.components(separatedBy: "-")[1]
                            let currentDatee = format.components(separatedBy: "-")[2]
                            let currentDay = format.components(separatedBy: "-")[3]
                            
                            
                            //refine current day schedule
                            if currentYear == year && currentMonth == month && currentDatee == date{
                                //print("Current Date: \(format)")
                                self.selectedDateSchedule = cc
                                self.collectionView.reloadData()
                                print("Year: \(year)")
                                print("Month: \(month)")
                                print("Day: \(date)")
                                print("***************")
                                
                                
                                self.getDoctorBookings(language: selectedLanguage, doctorID: self.doctor_ID, dateID: (cc.date_id?.data?.id)!, monthID: (cc.month_id?.data?.id)!, yearID: (cc.year_id?.data?.id)!, hospitalID: (cc.hospital_id?.data?.id)!)
                                
                                
                            }else{
                                HAlert.ShowToast(VC: self, msg: "no_schedule_available".localiz())
                            }
                        }
                    }
                }else{
                    //show no schedule message
                    HAlert.ShowToast(VC: self, msg: "no_schedule_available".localiz())
                }
                
                print("scheduleArray count: \(self.scheduleArray.count)")
                
                loading.dismiss()
                //                self.collectionView.reloadData()
                
            }else{
                loading.dismiss()
                HAlert.ShowBoldToast(VC: self, msg: "something_went_wrong".localiz())
            }
        })
    }
    
    
    @IBAction func pickDateAction(_ sender: Any) {
        
        let pickedDate = appointmentDatePicker.date
        print(pickedDate.getFormattedDate(format: "yyyy-MMMM-d-EEEE"))
        
        //        scheduleData.removeAll()
        //        resetSchedule()
        
        if self.scheduleArray.count > 0{
            
            for schedule in self.scheduleArray{
                
                for (index,item) in schedule.attributes!.schedule!.enumerated(){
                    
                    //array data
                    let year = item.year_id?.data?.attributes?.year_name
                    let month = item.month_id?.data?.attributes?.month_name
                    let date = item.date_id?.data?.attributes?.date_name
                    
                    //user picked date
                    let format = pickedDate.getFormattedDate(format: "yyyy-MMMM-d-EEEE")
                    let currentYear = format.components(separatedBy: "-")[0]
                    let currentMonth = format.components(separatedBy: "-")[1]
                    let currentDatee = format.components(separatedBy: "-")[2]
                    let currentDay = format.components(separatedBy: "-")[3]
                    
                    
                    //compare user picked date from schedules
                    if currentYear == year && currentMonth == month && currentDatee == date{
                        
                        self.selectedDateSchedule = nil
                        collectionView.reloadData()
                        
                        self.selectedDateSchedule = item
                        //
                        //                    self.collectionView.reloadData()
                        
                        self.doctorNameLabel.text = self.scheduleArray.first?.attributes?.doctor_id?.data?.attributes?.doc_name?.capitalizingFirstLetter()
                        self.designationLabel.text = self.scheduleArray.first?.attributes?.doctor_id?.data?.attributes?.doc_designation?.capitalizingFirstLetter()
                        self.addressLabel.text = item.hospital_id?.data?.attributes?.hos_address
                        
                        print("Year: \(year)")
                        print("Month: \(month)")
                        print("Day: \(date)")
                        print("***************")
                        self.dismiss(animated: true, completion: nil)
                        getDoctorBookings(language: selectedLanguage, doctorID: doctor_ID, dateID: (item.date_id?.data?.id)!, monthID: (item.month_id?.data?.id)!, yearID: (item.year_id?.data?.id)!, hospitalID: (item.hospital_id?.data?.id)!)
                        
                        break
                    }else{
                        print("index::: \(index)")
                        print("schedule.attributes?.schedule?.count::: \(schedule.attributes?.schedule?.count)")
                        if index == (schedule.attributes?.schedule!.count)! - 1{
                            self.resetSchedule()
                            
                            print("schedule reset")
                            
//                            HAlert.CreateAlert(title: "alert".localiz(), message: "no_schedule_available".localiz(), ViewController: self)
                            HAlert.ShowToast(VC: self, msg: "no_schedule_available".localiz())
                        }
                        
                    }
                }
                //            collectionView.reloadData()
                
                //            print("scheduleData count: \(scheduleData.count)")
                //            print("scheduleArray count: \(self.scheduleArray.count)")
                //            print(scheduleData)
                
                
                
            }
        }else{
//            HAlert.CreateAlert(title: "alert".localiz(), message: "no_schedule_available".localiz(), ViewController: self)
            HAlert.ShowToast(VC: self, msg: "no_schedule_available".localiz())
        }
        
    }
    
    var bookings : DoctorBookings_Base!
    var bookingsArray = [DoctorBookings_Base.Data]()
    //    var timingArray = [String]()
    
    var booked = true
    
    func getDoctorBookings(language: String, doctorID: Int, dateID: Int, monthID: Int, yearID: Int, hospitalID: Int){
        loading.show(vc: self)
        ApiManager.callRestApi(url: Router.getdoctorBookings(["populate": "*",
                                                              "filters[doctor_id][id]":"\(doctorID)",
                                                              "filters[date_id][id]":"\(dateID)",
                                                              "filters[month_id][id]":"\(monthID)",
                                                              "filters[year_id][id]":"\(yearID)",
                                                              "filters[hospital_id][id]":"\(hospitalID)",
                                                              "pagination[pageSize]":"100"]),
                               myCustomClass: DoctorBookings_Base.self, completionHandler: {
            (data,error) in
            if error == "204"{
                loading.dismiss()
            }else if let dt = data{
                print(data)
                self.bookingsArray.removeAll()
                
                self.bookingsArray = dt.data!
                
                print("bookings Count: \(self.bookingsArray.count)")
                //                self.myGroup.leave()
                
                if self.bookingsArray.count > 0{
                    //                    self.indexx += 1
                    
                    for booking in self.bookingsArray{
                        
                        for (index,item) in self.selectedDateSchedule.availability!.enumerated() {
                            
                            if booking.attributes?.timing_id_from?.data?.id == item.from_time?.data?.id{
                                print("Not available %%%%%% $$$")
                                print("\(index) &&&&")
                                self.selectedDateSchedule.availability?[index].isAvaliable = false
                            }else{
                                //                                print("Available %%%%%% $$$")
                                //                                self.selectedDateSchedule.availability?[index].isAvaliable = true
                                //                                print("\(index) &&&&")
                            }
                        }
                        //
                        
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) { // Change `2.0` to the desired number of seconds.
                        // Code you want to be delayed
                        self.collectionView.reloadData()
                        print("Reload after 2.0 seconds")
                    }
                    //                    self.collectionView.reloadData()
                    loading.dismiss()
                }else{
                    
                    self.collectionView.reloadData()
                    
                    loading.dismiss()
                    
                }
            }else{
                loading.dismiss()
                HAlert.ShowBoldToast(VC: self, msg: "something_went_wrong".localiz())
            }
        })
    }
    
    
    
    
    func confirmPopup(){
        let refreshAlert = UIAlertController(title: "alert".localiz(), message: "slot_available_are_you_sure_you_want_to_book_this_slot?".localiz(), preferredStyle: UIAlertController.Style.alert)
        
        refreshAlert.addAction(UIAlertAction(title: "yes".localiz(), style: .default, handler: { (action: UIAlertAction!) in
            print("Handle Ok logic here")
            
            let data = self.selectedDateSchedule
            
            if let toTimeId = data?.availability?[self.selectedIndex].to_time?.data?.id,
               let monthId = data?.month_id?.data?.id,
               let yearId = data?.year_id?.data?.id,
               let dateId = data?.date_id?.data?.id,
               let fromTimeId = data?.availability?[self.selectedIndex].from_time?.data?.id,
               let hospitalId = data?.hospital_id?.data?.id,
               let doctorName = self.scheduleArray.first?.attributes?.doctor_id?.data?.attributes?.doc_name,
               let yearName = data?.year_id?.data?.attributes?.year_name,
               let monthName = data?.month_id?.data?.attributes?.month_name,
               let dateName = data?.date_id?.data?.attributes?.date_name,
               let designation = self.scheduleArray.first?.attributes?.doctor_id?.data?.attributes?.doc_designation{
                
                let date = "\(monthName) \(dateName),\(yearName)"
                let docNameAndDesignation = "\(doctorName) \(designation)"
                
                let time = self.userSelectedTime //scheduleData[self.selectedIndex].scheduleTime + ",\(scheduleData[self.selectedIndex].day)"
                
                self.confirmBooking(doctorId: self.doctor_ID, timeToId: toTimeId, fullName: user.username, monthId: monthId, specialityId: self.speciality_ID, phoneNumber: user.Phone_number, yearId: yearId, dateId: dateId, timeFromId: fromTimeId, hospitalId: hospitalId, email: user.email, doctorName: docNameAndDesignation, date: date, time: time, users_id: user.id)
            }
            
            
//            self.popupDoctorNameLabel.text = self.scheduleArray.first?.attributes?.doctor_id?.data?.attributes?.doc_name //scheduleData[self.selectedIndex].doctorName
//            self.popupDesignationLabel.text = self.scheduleArray.first?.attributes?.doctor_id?.data?.attributes?.doc_designation //scheduleData[self.selectedIndex].doctorSpeciality
//
//            let formatter = DateFormatter()
//            formatter.dateFormat = "yyyy-MM-dd"
//            let datee = formatter.string(from: self.appointmentDatePicker.date)
//
//            self.dateLabel.text = datee //scheduleData[self.selectedIndex].scheduleDate
//            self.timeLabel.text = self.userSelectedTime //scheduleData[self.selectedIndex].scheduleTime + ",\(scheduleData[self.selectedIndex].day)"
//
//            self.popupAddressLabel.text = self.selectedDateSchedule.hospital_id?.data?.attributes?.hos_address //scheduleData[self.selectedIndex].hospitalLocation
//            self.phoneNumLabel.text = self.selectedDateSchedule.hospital_id?.data?.attributes?.hos_phone //scheduleData[self.selectedIndex].hospitalPhoneNumber
//
//
//
//            self.coloredView.isHidden = true
//            self.rescheduleButton.setTitleColor(UIColor(hexString: "1B99B8"), for: .normal)
//            self.whiteView.isHidden = true
//            self.BookAnAppointmentButton.setTitleColor(.white, for: .normal)
//
//            self.yourAppointmentPopUpView.isHidden = false
//
//            self.tabBarController?.tabBar.isHidden = true
//            self.navigationController?.isNavigationBarHidden = true
        }))
        
        refreshAlert.addAction(UIAlertAction(title: "no".localiz(), style: .cancel, handler: { (action: UIAlertAction!) in
            print("Handle Cancel Logic here")
        }))
        
        self.present(refreshAlert, animated: true, completion: nil)
    }
    func resetSchedule(){
        //        scheduleData.removeAll()
        self.selectedDateSchedule = nil
        self.collectionView.reloadData()
    }
}

extension CalendarViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if selectedDateSchedule != nil{
            self.collectionView.restore()
            return selectedDateSchedule.availability!.count //scheduleData.count
        }else{
            self.collectionView.setEmptyMessage("nothing_to_show".localiz())
            
            return 0
        }
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:TimingCollectionViewCell = self.collectionView.dequeueReusableCell(withReuseIdentifier: "TimingCollectionViewCell", for: indexPath) as! TimingCollectionViewCell
        let data = selectedDateSchedule.availability?[indexPath.row] //scheduleData[indexPath.row]
        if let fromTime = data?.from_time?.data?.attributes?.name,
           let toTime = data?.to_time?.data?.attributes?.name{
            
            cell.timeLabel.text = "\(fromTime)-\(toTime)"
        }
        
        
        if (data?.isAvaliable)!{
            
            if indexPath.row == selectedIndex{
                cell.bgView.backgroundColor = UIColor(hexString: Constants.Colors.AppBlueColor)
                cell.timeLabel.textColor = .white
            }else{
                cell.bgView.backgroundColor = .white
                cell.timeLabel.textColor = .darkGray
            }
            
            
        }else{
            cell.bgView.backgroundColor = UIColor.lightGray// UIColor(hexString: "003A70")
            //            cell.timeLabel.textColor = .white
        }
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let data = selectedDateSchedule.availability?[indexPath.row] //scheduleData[indexPath.row]
        
        if (data?.isAvaliable)!{
            
            
            let date = Date()
            let formatter = DateFormatter()
            formatter.locale = Locale(identifier: "en-US")
            formatter.dateFormat = "hh:mm a"
            let stringTime = formatter.string(from: date)
            let currentTime = formatter.date(from: stringTime)
            print("currentTime  \(currentTime)")
            
            if let selectedToTime = data?.from_time?.data?.attributes?.name{
                
                let dateFormatter = DateFormatter()
                dateFormatter.locale = Locale(identifier: "en_US") // set locale to reliable US_POSIX
                dateFormatter.dateFormat = "hh:mm a"
                let selectedTime = dateFormatter.date(from:selectedToTime)!
                
                
                if selectedTime < currentTime!{
//                    HAlert.ShowToast(VC: self, msg: "time_slot_expire".localiz())
                    HAlert.toastMessage("time_slot_expire".localiz())
                    dateSelect = false
                    selectedIndex = -1
                    collectionView.reloadData()
                }else{
                    
                    let data = selectedDateSchedule.availability?[indexPath.row] //scheduleData[indexPath.row]
                    if let fromTime = data?.from_time?.data?.attributes?.name,
                       let toTime = data?.to_time?.data?.attributes?.name{
                        
                        userSelectedTime = "\(fromTime)-\(toTime)"
                    }
                    
//                    confirmPopup()
                    dateSelect = true
                    selectedIndex = indexPath.row
                    collectionView.reloadData()
                }
                
            }
            
        }else{
            dateSelect = false
            selectedIndex = -1
            collectionView.reloadData()
//            HAlert.ShowToast(VC: self, msg: "already_booked".localiz())
            HAlert.toastMessage("already_booked".localiz())
        }
        
        
        
        
        
        //        getDoctorBookings(language: selectedLanguage, doctorID: data.doctorId, dateID: data.dateId, monthID: data.monthId, yearID: data.yearId, hospitalID: data.hospitalId, toID: data.toTimeId, fromID: data.fromTimeId, yearName: data.yearName, monthName: data.monthName, dateName: data.dateName, index: indexPath.row)
        
        
        print(data)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.collectionView.frame.width/3.2, height: self.collectionView.frame.height/6.4)
    }
}
extension Date {
    func getFormattedDate(format: String) -> String {
        let dateformat = DateFormatter()
        dateformat.dateFormat = format
        return dateformat.string(from: self)
    }
}


extension CalendarViewController{
    
    func confirmBooking(doctorId: Int, timeToId: Int, fullName: String, monthId: Int, specialityId: Int, phoneNumber: String, yearId: Int, dateId: Int, timeFromId: Int, hospitalId: Int,email: String, doctorName: String, date: String, time: String, users_id: Int){
        
        loading.show(vc: self)
        let urlString = "https://api-yas.broomstickcreative.com/api/bookings"
        //        let json = "{\"What\":\"Ever\"}"
        let json = "{\"data\":{\"doctor_id\":\"\(doctorId)\",\"timing_id_to\":\"\(timeToId)\",\"full_name\":\"\(fullName)\",\"month_id\":\"\(monthId)\",\"specialty_id\":\"\(specialityId)\",\"phone_number\":\"\(phoneNumber)\",\"year_id\":\"\(yearId)\",\"date_id\":\"\(dateId)\",\"timing_id_from\":\"\(timeFromId)\",\"hospital_id\":\"\(hospitalId)\",\"email\":\"\(email)\",\"users_id\":\"\(users_id)\"}}"
        
        let url = URL(string: urlString)!
        let jsonData = json.data(using: .utf8, allowLossyConversion: false)!
        
        var request = URLRequest(url: url)
        request.httpMethod = HTTPMethod.post.rawValue
        request.setValue("application/json; charset=UTF-8", forHTTPHeaderField: "Content-Type")
        request.httpBody = jsonData
        
        AF.request(request).responseJSON {
            (response) in
            loading.dismiss()
            switch response.result {
            case .success(let value):
                
                print(value,"\(response.response?.statusCode ?? 0)")
                
                if response.response?.statusCode ?? 0 == 200{
                    
                    
                    // create the alert
                    let alert = UIAlertController(title: "alert".localiz(), message: "successfully_booked_your_appointment".localiz(), preferredStyle: UIAlertController.Style.alert)
                    
                    // add an action (button)
                    alert.addAction(UIAlertAction(title: "ok".localiz(), style: UIAlertAction.Style.default, handler: { action in
                        self.tabBarController?.tabBar.isHidden = false
                        self.navigationController?.isNavigationBarHidden = false
                        let storyboard = UIStoryboard(name: "Appointment", bundle: nil)
                        let vc = storyboard.instantiateViewController(withIdentifier: "ThankYouViewController") as! ThankYouViewController
                        vc.modalPresentationStyle = .fullScreen
                        vc.thankyouMessage = "\("you_have_booked_an_appointment_with".localiz()) \(doctorName) \("on".localiz()) \(date) \("at".localiz()) \(time)"
                        self.navigationController?.pushViewController(vc,animated: true)
                    }))
                    
                    // show the alert
                    self.present(alert, animated: true, completion: nil)
                    
                }
                
            case .failure(let error):
                loading.dismiss()
                print("Error :- \(error)")
                print("Status :- \((response.response?.statusCode ?? 0))")
                if (response.response?.statusCode ?? 0) == 204{
                    print("\(response.response!.statusCode)")
                    
                    HAlert.ShowToast(VC: self, msg: "server_error".localiz())
                }else{
                    loading.dismiss()
                    print(response.error?.errorDescription)
                    HAlert.ShowToast(VC: self, msg: response.error?.errorDescription ?? "server_error".localiz())
                }
                
            }
        }
    }
}

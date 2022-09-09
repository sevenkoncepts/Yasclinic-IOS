//
//  NotificationsViewController.swift
//  YAS Clinic
//
//  Created by MAC-1 on 28/04/2022.
//

import UIKit
import Alamofire

class NotificationsViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.register(UINib(nibName: "NotificationsTableViewCell", bundle: nil), forCellReuseIdentifier: "NotificationsTableViewCell")
        self.tableView.estimatedRowHeight = UITableView.automaticDimension//272.0
        self.tableView.rowHeight = UITableView.automaticDimension
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.title = "title_notifications".localiz()
        self.navigationController?.navigationBar.tintColor = UIColor.white
        
        if guestUser{
//            setupEmptyBackgroundView(topMsg: "title_notifications".localiz(), bottomMsg: "please_login_to_see_notifications".localiz())
            self.tableView.setEmptyMessage("please_login_to_see_notifications".localiz())
        }else{
            getNotifications(language: selectedLanguage, userId: user.id)
        }
    }
    
//    var emptyBackgroundView = UIView()
//    func setupEmptyBackgroundView(topMsg: String, bottomMsg: String) {
//        let image = UIImage(named: "logo")!.withRenderingMode(.alwaysTemplate)
//        let topMessage = topMsg
//        let bottomMessage = bottomMsg
//        emptyBackgroundView = EmptyBackgroundView(image: image, top: topMessage, bottom: bottomMessage)
//        emptyBackgroundView.isHidden = false
//        self.tableView.backgroundView = emptyBackgroundView
//        self.tableView.tableFooterView = UIView()
//        self.tableView.backgroundColor = .clear
//        view.setNeedsLayout()
//        view.layoutIfNeeded()
//    }
    
    
    var notifications : Notifications_Base!
    var notificationsArray = [Notifications_Base.Data]()
    func getNotifications(language: String, userId: Int){
        loading.show(vc: self)
        //["populate": "*", "filters[device_id][$eq]":deviceId,"pagination[pageSize]":"100"]
        ApiManager.callRestApi(url: Router.getNotifications(["populate": "*", "filters[users_permissions_user][id][$eq]":"\(userId)","pagination[pageSize]":"100"]), myCustomClass: Notifications_Base.self, completionHandler: {
            (data,error) in
            if error == "204"{
                loading.dismiss()
            }else if let dt = data{
                self.notificationsArray.removeAll()
                
                if ((dt.data?.isEmpty) != nil){
//                    self.setupEmptyBackgroundView(topMsg: "title_notifications".localiz(), bottomMsg: "you_dont_have_any_notification".localiz())
                    self.tableView.setEmptyMessage("you_dont_have_any_notification".localiz())
                }else{
                    self.notificationsArray = dt.data!
                    loading.dismiss()
                    self.tableView.reloadData()
                }
                loading.dismiss()
                
            }else{
                loading.dismiss()
                HAlert.ShowBoldToast(VC: self, msg: "something_went_wrong".localiz())
            }
        })
    }
    
    //MARK: - Update Status
    
      func updateStatus(id: Int){
          let urlString = URLS.baseUrl + "user-push-notifications/\(id)"
  //        let json = "{\"What\":\"Ever\"}"
          let json = "{\"data\":{\"status\":\"\(false)\"}}"

          let url = URL(string: urlString)!
          let jsonData = json.data(using: .utf8, allowLossyConversion: false)!

          var request = URLRequest(url: url)
          request.httpMethod = HTTPMethod.put.rawValue
          request.setValue("application/json; charset=UTF-8", forHTTPHeaderField: "Content-Type")
          request.httpBody = jsonData

          AF.request(request).responseJSON {
              (response) in
              
              switch response.result {
              case .success(let value):
                  
                  print(value,"\(response.response?.statusCode ?? 0)")
                  
                  if response.response?.statusCode ?? 0 == 200{
                      
                      
                  }
              case .failure(let error):
                  print("Error :- \(error)")
                  print("Status :- \((response.response?.statusCode ?? 0))")
                  if (response.response?.statusCode ?? 0) == 204{
                      print("\(response.response!.statusCode)")
                      
//                      HAlert.ShowToast(VC: self, msg: "Server error")
                  }else{
                      print(response.error?.errorDescription)
//                      HAlert.ShowToast(VC: self, msg: response.error?.errorDescription ?? "Server Error")
                  }
                  
              }
          }
      }
    
    func deleteNotification(id: Int) {

//        let parameters = ["ID": "16"] as [String : Any]
        guard let url = URL(string: URLS.baseUrl + "user-push-notifications/\(id)") else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        guard let httpBody = try? JSONSerialization.data(withJSONObject:[:], options: []) else { return }
        request.httpBody = httpBody
        
        AF.request(request).responseJSON {
            (response) in
            
            switch response.result {
            case .success(let value):
                
                print(value,"\(response.response?.statusCode ?? 0)")
                
                if response.response?.statusCode ?? 0 == 200{
                    
                    HAlert.CreateAlert(title: "confirmation".localiz(), message: "notification_successfully_deleted".localiz(), ViewController: self)
                    
                    if let deviceId = UIDevice.current.identifierForVendor?.uuidString{
                        print("deviceId: \(deviceId)")
                        self.getNotifications(language: selectedLanguage, userId: user.id)
                    }
                }
            case .failure(let error):
                print("Error :- \(error)")
                print("Status :- \((response.response?.statusCode ?? 0))")
                if (response.response?.statusCode ?? 0) == 204{
                    print("\(response.response!.statusCode)")
                    
//                      HAlert.ShowToast(VC: self, msg: "Server error")
                }else{
                    print(response.error?.errorDescription)
//                      HAlert.ShowToast(VC: self, msg: response.error?.errorDescription ?? "Server Error")
                }
                
            }
        }
    }
}

extension NotificationsViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if notificationsArray.count == 0{
            self.tableView.setEmptyMessage("you_dont_have_any_notification".localiz())
        }else{
            self.tableView.restore()
        }
        return notificationsArray.count
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.alpha = 0.7
        UIView.animate(withDuration: 1.0) {
            cell.alpha = 1.0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:NotificationsTableViewCell = self.tableView.dequeueReusableCell(withIdentifier: "NotificationsTableViewCell") as! NotificationsTableViewCell
        cell.selectedBackgroundView?.backgroundColor = .clear
        tableView.backgroundColor = UIColor.clear
  
        let data = notificationsArray[indexPath.row]
        cell.titleLabel.text = data.attributes?.title
        cell.descriptionLabel.text = data.attributes?.description
        cell.dateLabel.text = data.attributes?.updatedAt
       
        let serverDateFormatter: DateFormatter = {
            let result = DateFormatter()
            //let a = "2021-01-19T13:06:45.000000Z" //example
                    //"2022-03-24T07:56:41.213
            //2022-04-26T05:56:56.165Z
            result.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSS"
            result.timeZone = NSTimeZone(forSecondsFromGMT: 0) as TimeZone
            return result
        }()

        let date = serverDateFormatter.date(from: data.attributes?.updatedAt ?? "")

//        cell.dateLabel.text = date?.timeAgoSinceDate()
        
        cell.deleteButton.tag = indexPath.row
        cell.deleteButton.addTarget(self, action: #selector(deleteAction), for: .touchUpInside)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
     
        let data = notificationsArray[indexPath.row]
        
        if let id = data.id{
            updateStatus(id: id)
        }
    }
    @objc func deleteAction(sender: UIButton){
        print(sender.tag)
        let tag:NSInteger = sender.tag
        let indexPath = IndexPath(row: tag, section: 0)
//        let cell = tableView.cellForRow(at: indexPath) as! BookingCalendarTableViewCell
        let data = notificationsArray[indexPath.row]
        
        if let id = data.id{
            
            let refreshAlert = UIAlertController(title: "alert".localiz(), message: "are_you_sure_you_want_to_delete_this_notification".localiz(), preferredStyle: UIAlertController.Style.alert)
            
            refreshAlert.addAction(UIAlertAction(title: "yes".localiz(), style: .default, handler: { (action: UIAlertAction!) in
                print("Handle Ok logic here")
                
                self.deleteNotification(id: id)
                
            }))
            
            refreshAlert.addAction(UIAlertAction(title: "no".localiz(), style: .cancel, handler: { (action: UIAlertAction!) in
                print("Handle Cancel Logic here")
            }))
            
            present(refreshAlert, animated: true, completion: nil)
            
        }
    }
}

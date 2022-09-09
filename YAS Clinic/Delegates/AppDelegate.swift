//
//  AppDelegate.swift
//  YAS Clinic
//
//  Created by MAC-1 on 28/02/2022.
//

import UIKit
import IQKeyboardManagerSwift
import NotificationCenter
import Firebase
import LanguageManager_iOS

let AppName = "app_name".localiz()
var guestUser = true
var deviceTokenstring = ""

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let gcmMessageIDKey = "gcm.message_id"

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        FirebaseApp.configure()
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.shouldResignOnTouchOutside = true
        
        selectedLanguage = englishLanguage
        LanguageManager.shared.defaultLanguage = .deviceLanguage
        //MARK:- Notifications
        UNUserNotificationCenter.current().delegate = self
        if(launchOptions?[UIApplication.LaunchOptionsKey.remoteNotification] != nil){
            // your code here
        }
        
        
        if #available(iOS 10.0, *) {
            // For iOS 10 display notification (sent via APNS)
            UNUserNotificationCenter.current().delegate = self
            
            let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
            UNUserNotificationCenter.current().requestAuthorization(
                options: authOptions,
                completionHandler: {_, _ in })
        }
        else {
            let settings: UIUserNotificationSettings =
            UIUserNotificationSettings(types: [.alert, .badge, .sound], categories: nil)
            application.registerUserNotificationSettings(settings)
        }
        
        
        Messaging.messaging().delegate = self
        application.registerForRemoteNotifications()
        
        return true
    }
    

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

// notification when app is not in background
@available(iOS 10, *)
extension AppDelegate : UNUserNotificationCenterDelegate {
    
    // Receive displayed notifications for iOS 10 devices.
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                willPresent notification: UNNotification,
                                withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        let userInfo = notification.request.content.userInfo
        
        // With swizzling disabled you must let Messaging know about the message, for Analytics
        // Messaging.messaging().appDidReceiveMessage(userInfo)
        
        // Print message ID.
        if let messageID = userInfo[gcmMessageIDKey] {
            print("Message ID: \(messageID)")
        }
        
        let aps = userInfo[AnyHashable("aps")]! as! NSDictionary
        print(aps)
        
        
        let alert = aps["alert"]! as! NSDictionary
        let body = alert["body"] as! String
        let title = alert["title"] as! String
        print(body)
        print(title)
        
        
        // Print full message.
        print(userInfo)
        
        // Change this to your preferred presentation option
        completionHandler([.alert])
    }
 

   
    
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                didReceive response: UNNotificationResponse,
                                withCompletionHandler completionHandler: @escaping () -> Void) {
        
        let application = UIApplication.shared
        
        if(application.applicationState == .active){
            print("user tapped the notification bar when the app is in foreground")
            NotificationCenter.default.post(name: Notification.Name(rawValue: "notificationTapObserver"), object: nil)
            
        }
        //MARK:- Go to notification tab
        if(application.applicationState == .inactive)
        {
            print("user tapped the notification bar when the app is in background")
            
            NotificationCenter.default.post(name: Notification.Name(rawValue: "notificationTapObserver"), object: nil)
          
           
        }
        
        let userInfo = response.notification.request.content.userInfo
        // Print message ID.
        if let messageID = userInfo[gcmMessageIDKey] {
            print("Message ID: \(messageID)")
        }
        /* Change root view controller to a specific viewcontroller */
        // let storyboard = UIStoryboard(name: "Main", bundle: nil)
        // let vc = storyboard.instantiateViewController(withIdentifier: "ViewControllerStoryboardID") as? ViewController
        // self.window?.rootViewController = vc
        
        //  completionHandler()
        // Print full message.
        print(userInfo)
        
        completionHandler()
    }
}

// end Handle Active State Notifications

extension AppDelegate: MessagingDelegate{
    
    func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String?) {
        print("Firebase registration token: \(fcmToken!)")
        deviceTokenstring = fcmToken!
        let dataDict:[String: String] = ["token": "\(fcmToken!)"]
        NotificationCenter.default.post(name: Notification.Name("FCMToken"), object: nil, userInfo: dataDict)
        // TODO: If necessary send token to application server.
        // Note: This callback is fired at each app startup and whenever a new token is generated.
    }
    
//    func messaging(_ messaging: Messaging, didReceive remoteMessage: MessagingRemoteMessage) {
//        print("message", remoteMessage.appData)
//    }
    
    //save badge value in firebase
//    func registerUserIntoDatabaseWithID(userId: Int, badgeCount: Int ){
//      let ref: DatabaseReference!
//      ref = Database.database().reference()
//      let userReference = ref.child("UserNotiFications").child("\(userId)")
//      let values = ["badge": badgeCount]
//        userReference.updateChildValues(values, withCompletionBlock: { (err, ref) in
//          if err != nil{
//          print(err!)
//          return
//          }
//          print("Saved user successfully")
//      })
//    }
}

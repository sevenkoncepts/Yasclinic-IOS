//
//  Constants.swift
//  4State
//
//  Created by iOS Developer-Ropstam on 21/06/2021.
//

import Foundation
import UIKit

struct Constants {
   
    struct AlertTitles {
        static let CameraAccess = "Camera Access"
        static let MicrophoneAccess = "Microphone Access"
        static let Alert = "Alert!"
    }

    struct AlertMessages {
        static let NotInterested = "Are you sure you are not interested in this video"
        static let ReportVideo = "Are you sure you want to report this video"
        
        static let CameraAccess = "This app does not have access to your Camera. To enable press OK and switch Camera on."
        static let MicrophoneAccess = "This app does not have access to your Microphone. To enable press OK and switch Microphone on."
    }
    struct Colors{
        static let AppTextColor = "003A70"
        static let AppBlueColor = "003A70"
    }
    
    struct AlertActionTitles {
        static let Ok = "OK"
        static let Cancel = "Cancel"
        static let Delete = "Delete"
    }

    struct UserSession{
        static let email = "email"
        static let password = "password"
        
        static let idCardNo = "idCardNo"
        static let logOut = "logOut"
        static let logIn = "logIn"
        static let enableTouchId = "enableTouchId"
        static let appColor = "51A8E1"
        static let phoneNumber = "+920000000000"
        static let guestUser = "guestUser"
    }

    
}

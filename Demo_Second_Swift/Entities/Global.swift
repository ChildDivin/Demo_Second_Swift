//
//  Global.swift
//  Demo_Second_Swift
//
//  Created by Tops on 02/03/15.
//  Copyright (c) 2015 Tops. All rights reserved.
//

import Foundation

struct Constants
{
    struct NotificationKey {
        static let Welcome = "kWelcomeNotif"
    }
    
    struct Path {
        static let Documents = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as! String
        static let Tmp = NSTemporaryDirectory()
    }
    /*
            Base URL
    */
    struct baseUrl
    {
        static let baseUrl = "http://topsdemo.in/mit/setup_app/ws/"
    }
    /*
            Device Version
    */
    struct ios {
        static let floatVersion = (UIDevice.currentDevice().systemVersion as NSString).floatValue
        static let _8 = (floatVersion >= 8.0) ? true : false
        static let _7 = (floatVersion >= 7.0 && floatVersion < 8.0) ? true : false
        static let _6 = (floatVersion <= 6.0 ) ? true : false
    }
    /*
            Device Type
    */
    struct g_Is_Iphone {
    
        static let deviceType = UIScreen.mainScreen().bounds.size.height
        static let _6p = (deviceType >= 736.0 ) ? true : false
        static let _6 = (deviceType <= 667.0 && deviceType > 568.0) ? true : false
        static let _5 = (deviceType <= 568.0 && deviceType > 480.0) ? true : false
        static let _4 = (deviceType <= 480.0) ? true : false
    }
    /*
          modal
    */
    struct g_Device {
        static let tempType = UIDevice.currentDevice().model.lastPathComponent
        static let is_Simulator = (tempType == "iPhone Simulator" ) ? true : false
       
    }
}


/*

let Device = UIDevice.currentDevice()
private let iosVersion = NSString(string: Device.systemVersion).doubleValue

let iOS8 = iosVersion >= 8
let iOS7 = iosVersion >= 7 && iosVersion < 8

*/
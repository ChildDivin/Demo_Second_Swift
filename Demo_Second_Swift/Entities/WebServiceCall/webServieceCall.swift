//
//  webServieceCall.swift
//  Demo_Second_Swift
//
//  Created by Tops on 05/05/15.
//  Copyright (c) 2015 Tops. All rights reserved.
//

import Foundation

class webServiceCall {
    
     let manger = AFNetworkReachabilityManager()

    class var sharedInstance : webServiceCall {
        struct Static {
            static var instance: webServiceCall?
            static var token: dispatch_once_t = 0
        }
        dispatch_once(&Static.token) {
            Static.instance = webServiceCall()
        }
        return Static.instance!
    }
   
}
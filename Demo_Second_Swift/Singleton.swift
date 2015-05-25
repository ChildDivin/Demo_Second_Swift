//
//  Singleton.swift
//  Demo_Second_Swift
//
//  Created by Tops on 14/02/15.
//  Copyright (c) 2015 Tops. All rights reserved.
//

import UIKit

class Singleton
{
    var strName:NSString!
    var strDetail_Flag:NSString!
    
    class var sharedInstance: Singleton
    {
        struct Static {
            static var instance: Singleton?
            static var token: dispatch_once_t = 0
        }
        
        dispatch_once(&Static.token) {
            Static.instance = Singleton()
        }
        
        return Static.instance!
    }
    
    //MARK: Flag set with is use in webservice view and Details collection view
    func setDetailsFlageMethod (str:NSString)
    {
        strDetail_Flag=str
    }
    func getDetilsFlagMethod() ->NSString
    {
        return strDetail_Flag;
    }
    //MARK: Name set
    func setName(str:NSString)
    {
        strName=str
    }
   
    func getName() ->NSString
    {
        return strName!
    }
    
}

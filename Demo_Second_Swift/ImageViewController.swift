//
//  ImageViewController.swift
//  Demo_Second_Swift
//
//  Created by Tops on 14/02/15.
//  Copyright (c) 2015 Tops. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController
{
    
    //MARK: Globle variable Declaration
    
    @IBOutlet var imgViewMain:UIImageView?
    @IBOutlet var lblName :UILabel?
    @IBOutlet var lblDiscription :UILabel?
    
    let manager = AFHTTPRequestOperationManager()
    
    var strName : NSString?
    //    var imgView2 :UIImageView
    
    //MARK: View Start Methods
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        lblName?.text=String(format:"hello \(strName!)")
        imgViewMain?.image=UIImage(named: "image.jpg")
        
    }
    
    override func viewWillAppear(animated: Bool)
    {
        super.viewWillAppear(animated)
        var count = Singleton.sharedInstance.getName().integerValue
        count++
        Singleton.sharedInstance.setName(NSString(format: "%d", count))
    }
    
    //MARK: Custom Button Action
    
    @IBAction func btnBackClilck (sender:UIButton)
    {
        self.navigationController!.popViewControllerAnimated(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
























////        var url : String = "https://maps.googleapis.com/maps/api/distancematrix/json?origins=-34.4232722,150.8865837&destinations=-34.4250728,150.89314939999997&language=en-US"
////        println("This is String: \(url)")
////        println(NSString(format:"Count is %@",url))
////
////        var remoteUrl : NSURL? = NSURL(string:NSString(format:"%@",url))!
////
////        println("This is URL: \(remoteUrl!)")
////
////        var url1 : NSString = "https://maps.googleapis.com/maps/api/distancematrix/json?origins=-34.4232722,150.8865837&destinations=-34.4250728,150.89314939999997&language=en-US"
////
////        var urlStr : NSString = url1.stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding)!
////        var searchURL : NSURL = NSURL(string: urlStr)!
////        println(searchURL)
//
//var url : String = "https://maps.googleapis.com/maps/api/distancematrix/json?origins=-34.4232722,150.8865837&destinations=-34.4250728,150.89314939999997&language=en-US"
//println("This is String: \(url)")
//var urlStr : NSString = url.stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding)!
//var remoteUrl : NSURL? = NSURL(string: url)
//println("This is URL: \(remoteUrl!)")
}
//
//  CollectionDetailsVC.swift
//  Demo_Second_Swift
//
//  Created by Tops on 28/02/15.
//  Copyright (c) 2015 Tops. All rights reserved.
//

import UIKit

class CollectionDetailsVC: UIViewController
{
    var strUrl:NSString!
    var motionView: PanoramaView!

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        /*    Button Programmatically   */ //Image_Done_tag
      
       NSNotificationCenter.defaultCenter().removeObserver(self, name: "NotificationIdentifier", object: nil)
        
       NSNotificationCenter.defaultCenter().addObserver(self, selector: "methodOfReceivedNotification:", name:"NotificationIdentifier", object: nil)
        
      let btnBack = UIButton.buttonWithType(UIButtonType.Custom) as! UIButton
        btnBack.frame = CGRectMake(10,10, 80, 35)
        btnBack.setTitle("Back", forState: UIControlState.Normal)
        btnBack.tintColor=UIColor.whiteColor()
        btnBack.addTarget(self, action:"btnBackClick:", forControlEvents: UIControlEvents.TouchUpInside)
    
        motionView = PanoramaView(frame: self.view.bounds)
        motionView.setImage(UIImage(named:"London_Tower_Bridge_Sunset_Cityscape_Panorama.jpg")!)
        
       // motionView.setImageUrl(NSURL(string: strUrl)!)

        self.view.addSubview(motionView)
        motionView.addSubview(btnBack)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    func buttonAction(sender:UIButton!)
    {
        println("Button tapped")
    }
    
     func btnBackClick (sender: UIButton)
    {
        //Singleton.sharedInstance.setDetailsFlageMethod("0")
        self.navigationController!.popViewControllerAnimated(true)
    }
    
    func methodOfReceivedNotification (notification :NSNotification)
    {
        println("Notifiacation \(notification)")
        motionView.setImageFrame()
    }
    
}

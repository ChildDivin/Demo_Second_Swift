//
//  ViewController.swift
//  Demo_Second_Swift
//
//  Created by Tops on 14/02/15.
//  Copyright (c) 2015 Tops. All rights reserved.
//

import UIKit
enum slideOutState{
    case BothCollapsed
    case LeftPanelExpanded
    case RightPanelExpanded
}

class ViewController: UIViewController,UITextFieldDelegate {
    
    //MARK: Slide ViewController
    @IBOutlet var lblname: UILabel!
    var centerNavigationController: UINavigationController!
    var centerViewController: CenterViewController!
    
    //MARK: Global Variable Declaration
    @IBOutlet var btnFistView :UIButton?
    @IBOutlet var btnSecond:UIButton?
    @IBOutlet var txtName:UITextField?
    var  count:Int = 0
    let manager = AFHTTPRequestOperationManager()
    
    
    //MARK: View Cycle method Start
    override func viewDidLoad()
    {
        super.viewDidLoad()
        //        centerViewController = UIStoryboard.cenerviewContrl
        //        centerViewController.delegate = self
        
        println(Constants.g_Device.is_Simulator)
        println("is IOS 7 -->\(Constants.ios._7)")
        println("is IOS 8 -->\(Constants.ios._8)")
        println("is IOS 6 -->\(Constants.ios._6)")
        println("\(UIDevice.currentDevice().model.lastPathComponent)")
        println("Device Type 4 -->\(Constants.g_Is_Iphone._4)")
        println("Device Type 5 -->\(Constants.g_Is_Iphone._5)")
        println("Device Type 6 -->\(Constants.g_Is_Iphone._6)")
        println("Device Type 6 plus -->\(Constants.g_Is_Iphone._6p)")
        
        self.navigationController?.navigationBarHidden=true
        
        LocalizeHelper.sharedLocalSystem().setLanguage("en")
        println(LocalizeHelper.sharedLocalSystem().localizedStringForKey("KeyName"))
        
       // lblname?.text="ilesh"
    }
    override func viewWillAppear(animated: Bool)
    {
        super.viewWillAppear(animated)
        println("hello singleton-->\(Singleton.sharedInstance.getName())")
        var strTemp = Singleton.sharedInstance.getName()
        count = strTemp.integerValue
        println(count)
        txtName?.text=""
        btnFistView?.setTitle("GO TO (\(count))-> ImageView", forState: UIControlState.Normal)
    }
    
    
    //MARK: Button Action & Custom Methods
    @IBAction func btnSecondClick(sender: UIButton)
    {
        println("Button Second View Pressed.")
        
        let tblVC = self.storyboard?.instantiateViewControllerWithIdentifier("Table") as! TableViewCotroller
        
        self.navigationController!.pushViewController(tblVC, animated: true)
        
    }
    @IBAction func btnFirstClick(sender:UIButton)
    {
        println("Button First view pressed.")
        
        if (txtName?.text == "")
        {
            /*  Default alertview
            let alert : UIAlertView = UIAlertView(title:"Error", message:"Please put your name in text box .", delegate:nil, cancelButtonTitle: nil, otherButtonTitles:"OK")
            alert.show()
            */
            
            SCLAlertView().showError("Hold On...", subTitle:"You have not saved your Submission yet. Please save the Submission before accessing the Responses list. Blah de blah de blah, blah. Blah de blah de blah, blah.Blah de blah de blah, blah.Blah de blah de blah, blah.Blah de blah de blah, blah.Blah de blah de blah, blah.", closeButtonTitle:"OK")
            
           // SCLAlertView().showError("Error", subTitle:"Please put your name in text box ", closeButtonTitle:"Ok", duration:0.3 )
           // SCLAlertView().showError("Error", subTitle: "hey second error ", closeButtonTitle: "Ok", duration: 0.3)
            
        }
        else
        {
            txtName?.resignFirstResponder()
            let vc = self.storyboard?.instantiateViewControllerWithIdentifier("Image") as! ImageViewController
            vc.strName=txtName?.text
            self.navigationController!.pushViewController(vc, animated:true)
            
        }
        //        self.navigationController!.pushViewController(self.storyboard!.instantiateViewControllerWithIdentifier("Image") as ImageViewController, animated: true)
        
    }
//    override func touchesBegan(touches: NSSet, withEvent event: UIEvent)
//    {
//        // testTouches(touches)
//        println("Touch view .")
//        txtName?.resignFirstResponder()
//    }
    
    func textFieldShouldClear(textField: UITextField) -> Bool
    {
        return true
    }
    
    @IBAction func btnwsClick (sender :UIButton)
    {
        txtName?.resignFirstResponder()
        
        let webVCObj = storyboard?.instantiateViewControllerWithIdentifier("webVC") as! webserviceVC
        
        self.navigationController?.pushViewController(webVCObj, animated: true)
        
    }
    
}


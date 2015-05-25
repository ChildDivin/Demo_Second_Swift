//
//  webserviceVC.swift
//  Demo_Second_Swift
//
//  Created by Tops on 28/02/15.
//  Copyright (c) 2015 Tops. All rights reserved.
//
//#define font_name_AG_Book @"AvantGarde-Book"
//#define font_name_AG_Bold @"AvantGarde-Bold"
//#define font_name_AG_ExtraLight @"AvantGarde-ExtraLight"
//#define font_name_AG_Medium @"AvantGarde-Medium"

import UIKit

class webserviceVC: UIViewController ,UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet var myCollectionView: UICollectionView!
    @IBOutlet var mySpinner: DTIActivityIndicatorView!
    
    let manager = AFHTTPRequestOperationManager()
    private let reuseIdentifier = "myCollection"
    var arrData :Array <AnyObject>=[]
    
    var largePhotoIndexPath : NSIndexPath? {
        didSet
        {
            
            var indexPaths = [NSIndexPath]()
            if largePhotoIndexPath != nil {
                indexPaths.append(largePhotoIndexPath!)
            }
            if oldValue != nil {
                indexPaths.append(oldValue!)
            }
            
            myCollectionView?.performBatchUpdates({
                self.myCollectionView?.reloadItemsAtIndexPaths(indexPaths)
                return
                }){
                    completed in
                    //4
                    if self.largePhotoIndexPath != nil {
                        self.myCollectionView?.scrollToItemAtIndexPath(
                            self.largePhotoIndexPath!,
                            atScrollPosition: .CenteredVertically,
                            animated: true)
                    }
            }
        }
    }
    override func viewDidLoad(){
        super.viewDidLoad()
        myCollectionView.delegate=self
        var number: NSInteger = 20;
    }
    
    override func viewWillAppear(animated: Bool)
    {
        super.viewWillAppear(animated)
        
        if (Singleton.sharedInstance.getDetilsFlagMethod().boolValue)
        {
            let myActivityIndicatorView: DTIActivityIndicatorView = DTIActivityIndicatorView(frame: CGRect(x: self.view.frame.size.width/2-50, y:self.view.frame.size.height/2-50, width:100.0, height:100.0))
            self.view.addSubview(myActivityIndicatorView)
            myActivityIndicatorView.indicatorColor = UIColor.blueColor()
            myActivityIndicatorView.indicatorStyle = DTIIndicatorStyle.convInv(.wp8)
            myActivityIndicatorView.startActivity()
            
            manager.GET("http://topsdemo.in/mit/dating_app/ws/user/get_fb_interest_list?user_id=850",
                parameters: nil,
                success:
                { (operation: AFHTTPRequestOperation!,responseObject: AnyObject!) in
                    //println("JSON: \(responseObject)")
                    var dicMain = responseObject as! Dictionary<String, AnyObject>
                    if (dicMain["FLAG"] as! Bool)
                    {
                        let arrTemp: NSArray = dicMain["fb_interests_list"] as! NSArray
                        for var i=0 ; i<arrTemp.count ; i++
                        {
                            var userdata: UserShare = UserShare()
                            var dicSub: NSDictionary = arrTemp[i] as! NSDictionary
                            userdata.strname = dicSub["name"] as! String
                            userdata.strurl = dicSub["interest_image"] as! String
                            self.arrData.append(userdata)
                        }
                      }
                    myActivityIndicatorView.stopActivity(true)
                    self.myCollectionView .reloadData()
                },
                failure:
                { (operation: AFHTTPRequestOperation!,error: NSError!) in
                    println("")
                    myActivityIndicatorView.stopActivity(true)
                    
                    SCLAlertView().showError("Error", subTitle: "Please check network connection ", closeButtonTitle: "Ok", duration: 0.0)
            })
        }
        else
        {
            Singleton.sharedInstance.setDetailsFlageMethod("1")
            
        }
    }
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        
    }
    
    //MARK: CollationView
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1;
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrData.count;
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell
    {
        
        let Collection_cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! CollectionCell
        var data:UserShare = arrData[indexPath.row] as! UserShare
        //println("\(arrData[0])")
        Collection_cell.backgroundColor=UIColor.whiteColor()
        Collection_cell.imgCell?.layer.cornerRadius=Collection_cell.imgCell.frame.size.height/2
        Collection_cell.imgCell?.layer.masksToBounds=true
        Collection_cell.imgCell?.setImageWithURL(NSURL(string:data.strurl! as String))
        Collection_cell.lblName?.text=data.strname! as String
        Collection_cell.lblName?.font=UIFont(name:"AvantGarde-Book", size:14)
        return Collection_cell
        
    }
    
    func collectionView(collectionView: UICollectionView, shouldSelectItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        
        if largePhotoIndexPath == indexPath {
            largePhotoIndexPath=nil
        }
        else {
            largePhotoIndexPath=indexPath
        }
        
        return true
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath)
    {
        // var dicClick:NSDictionary = arrData[indexPath.row] as NSDictionary
        let detailVC = storyboard?.instantiateViewControllerWithIdentifier("DetailsVC") as! CollectionDetailsVC
        
        //detailVC.strUrl=dicClick["interest_image"] as String
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
    
    
    //    func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView
    //    {
    //
    ////        switch kind
    ////        {
    ////
    ////        case : UICollectionElementKindSectionHeader
    ////            println("hello")
    ////
    ////
    ////        default:
    ////            assert(false, "Unexpected element kind")
    ////        }
    //
    //        return 0
    //    }
    
    //MARK: UIButton Action
    
    @IBAction func btnBackClick(sender:UIButton)
    {
        self.navigationController!.popViewControllerAnimated(true)
    }
}

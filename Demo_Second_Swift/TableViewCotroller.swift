//
//  TableViewCotroller.swift
//  Demo_Second_Swift
//
//  Created by Tops on 16/02/15.
//  Copyright (c) 2015 Tops. All rights reserved.
//

import UIKit

class TableViewCotroller: UIViewController
{
    @IBOutlet var tbl:UITableView?
    var arrData :Array <AnyObject>=[];
    var imageCache = [String : UIImage]()

    //MARK: View cycle Method start
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        var dic1 : Dictionary<String,String>
        var dic2 : Dictionary<String,String>

//        dic1=["name":"Ilesh panchal","image":"image.jpg","Discription":" i am Great IOS Developer."]
//        dic2=["name":"Dipen patel","image":"image.jpg","Discription":" i am Great PHP developer."]
//        arrData.append(dic1)
//        arrData.append(dic2)
        
        
        var dict1:Dictionary<String,String>
        dict1=["image":"http://upload.wikimedia.org/wikipedia/en/thumb/4/41/Flag_of_India.svg/225px-Flag_of_India.svg.png",
            "title":"Indian flag",
            "description":"The National Flag of India is a horizontal rectangular tricolour of deep saffron, white and India green; with the Ashoka Chakra, a 24-spoke wheel, in navy blue at its centre. It was adopted in its present form during a meeting of the Constituent Assembly held on 22 July 1947, when it became the official flag of the Dominion of India. The flag was subsequently retained as that of the Republic of India. In India, the term \"tricolour\" (Hindi: तिरंगा, Tirangā) almost always refers to the Indian national flag. The flag is based on the Swaraj flag, a flag of the Indian National Congress designed by Pingali Venkayya.The flag, by law, is to be made of khadi, a special type of hand-spun cloth of cotton, or silk made popular by Mahatma Gandhi. The manufacturing process and specifications for the flag are laid out by the Bureau of Indian Standards. The right to manufacture the flag is held by the Khadi Development and Village Industries Commission, who allocate it to the regional groups. As of 2009, the Karnataka Khadi Gramodyoga Samyukta Sangha was the sole manufacturer of the flag."];
        arrData.append(dict1)
        
        
        var dict2:Dictionary<String,String>
        
        dict2=["image":"http://static.panoramio.com/photos/large/34325472.jpg", "title":"Thirumalai Nayakar Mahal. Madura", "description":"Thirumalai Nayak ruled Madurai between 1623 and 1659 CE. He was the most notable of the thirteen Madurai Nayak rulers in the 17th century. His contributions are found in the many splendid buildings and temples of Madurai. His kingdom was under constant threat from the armies of Bijapur Sultanate and the other neighbouring Muslim kingdoms, which he managed to repulse successfully. His territories comprised much of the old Pandya territories which included Coimbatore, Tirunelveli, Madurai districts, Aragalur in southern Tamil Nadu and some territories of the Travancore kingdom."];
        arrData.append(dict2)
        
        
        
        dict2=["image":"http://upload.wikimedia.org/wikipedia/commons/thumb/f/f5/Courtallam.jpg/250px-Courtallam.jpg", "title":"Courtallam", "description":"Courtallam (Tamil: குற்றாலம்) or Kutralam, Spa of South India, is a panchayat town situated at a mean elevation of 160 m (520 ft) on the Western Ghats in Tirunelveli District of Tamil Nadu, India. Many seasonal and few perennial rivers such as the Chittar River, the Manimuthar River, the Pachaiyar River and the Tambaraparani River originate in this region. The numerous waterfalls and cascades along with the ubiquitous health resorts in the area have earned it the title the Spa of South India.[1] The falls carry a good amount of water only when there is a rain on the hills, so it is advisable to see the weather forecast, when one plans to come to Courtallam . Season begins from June of every year till September. The South West Monsoon brings in the cold breeze with mild temperature. From October to December North East Monsoon sets over in Tamil Nadu and the climate is cold and the rains are very heavy sometimes. Sometimes the falls get flooded and people are not allowed to take bath during floods."];
        arrData.append(dict2)
        
        
        
        dict2=["image":"http://upload.wikimedia.org/wikipedia/commons/thumb/1/1e/Tiruvalluvar_statue_LIC.jpg/220px-Tiruvalluvar_statue_LIC.jpg", "title":"Thiruvalluvar Statue", "description":"The Thiruvalluvar Statue is a 133 feet (40.6 m) tall stone sculpture of the Tamil poet and philosopher Tiruvalluvar, author of the Thirukkural. It was opened on January 1, 2000 (Millennium) and is located atop a small island near the town of Kanyakumari, where two seas and an ocean meet; the Bay of Bengal, the Arabian Sea, and the Indian Ocean . The statue has a height of 95 feet (29 m) and stands upon a 38 foot (11.5 m) pedestal that represents the 38 chapters of \"virtue\" in the Thirukkural. The statue standing on the pedestal represents \"wealth\" and \"pleasures\", signifying that wealth and love be earned and enjoyed on the foundation of solid virtue.[1]"];
        arrData.append(dict2)
        
        
    }
    
    override func viewWillAppear(animated: Bool)
    {
        super.viewWillAppear(animated)
        
        
        
    }
    
    //MARK: UITableview Delegate and DATASource Methods
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return arrData.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("myCell") as! ListCell
        
        var rowData:NSDictionary = arrData[indexPath.row] as! NSDictionary
        
        cell.lblName?.text = rowData["title"] as? String
        cell.lblDiscription?.text = rowData["description"] as! String
        cell.imgView?.image = UIImage(named:rowData["image"] as! String)
         let urlString = rowData["image"] as! String
        cell.selectionStyle=UITableViewCellSelectionStyle.None
        cell.contentView.backgroundColor?=UIColor.redColor()
        
        var image = self.imageCache[urlString]
        if (image == nil)
        {
            var imgURL: NSURL = NSURL(string: urlString)!
            // Download an NSData representation of the image at the URL
            let request: NSURLRequest = NSURLRequest(URL: imgURL)
            NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue(), completionHandler: {(response: NSURLResponse!,data: NSData!,error: NSError!) -> Void in
                if error == nil {
                    image = UIImage(data: data)
                    
                    // Store the image in to our cache
                    self.imageCache[urlString] = image
                    dispatch_async(dispatch_get_main_queue(),
                        {
                        if let cellToUpdate = tableView.cellForRowAtIndexPath(indexPath) {
                            cell.imgView?.image = image
                        }
                    })
                }
                else {
                    println("Error: \(error.localizedDescription)")
                }
            })
        }
        else
        {
            dispatch_async(dispatch_get_main_queue(), {
                if let cellToUpdate = tableView.cellForRowAtIndexPath(indexPath) {
                    cell.imgView?.image = image
                }
            })
        }
        
        return cell
    }

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        var data: NSDictionary = arrData[indexPath.row] as! NSDictionary
        println(data["title"])
        
    let DetailVC = self.storyboard?.instantiateViewControllerWithIdentifier("Details") as! DetailsViewController
        
        DetailVC.strTitle=data["title"] as! String
        DetailVC.strDescription=data["description"] as! String
        self.navigationController!.pushViewController(DetailVC, animated: true)

    }
    
    //MARK: UIButton Action 
    
    @IBAction func btnBackClick(sender:UIButton)
    {
        self.navigationController!.popViewControllerAnimated(true)
    }
    
}

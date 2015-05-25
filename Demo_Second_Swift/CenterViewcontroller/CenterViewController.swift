//
//  CenterViewController.swift
//  Demo_Second_Swift
//
//  Created by Tops on 02/03/15.
//  Copyright (c) 2015 Tops. All rights reserved.
//

import UIKit

@objc
protocol CenterViewControllerDelegate{
    optional func toggleLeftPanel()
    optional func toggleRightPanel()
    optional func collapseSidePanels()
}

class CenterViewController: UIViewController
{

    @IBOutlet weak private var imgview: UIImageView?
    
    var delegate: CenterViewControllerDelegate?
    override func viewDidLoad()
    {
        super.viewDidLoad()

    }

}

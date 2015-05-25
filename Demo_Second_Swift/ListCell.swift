//
//  ListCell.swift
//  Demo_Second_Swift
//
//  Created by Tops on 16/02/15.
//  Copyright (c) 2015 Tops. All rights reserved.
//

import UIKit

class ListCell: UITableViewCell
{
    @IBOutlet var imgView:UIImageView?
    @IBOutlet var lblName:UILabel?
    @IBOutlet var lblDiscription:UILabel?
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

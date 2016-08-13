//
//  CustomCellTableViewCell.swift
//  MyContacts
//
//  Created by Moises on 8/6/16.
//  Copyright © 2016 Moises. All rights reserved.
//

import UIKit

class CustomCellTableViewCell: UITableViewCell{

    @IBOutlet weak var imageContact: UIView!
    @IBOutlet weak var nameContact: UILabel!
    @IBOutlet weak var phoneContact: UILabel!
    @IBOutlet weak var emailContact: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

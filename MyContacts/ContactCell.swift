//
//  ContactCell.swift
//  MyContacts
//
//  Created by Moises on 8/13/16.
//  Copyright © 2016 Moises. All rights reserved.
//

import UIKit

class ContactCell: UITableViewCell {

    @IBOutlet weak var imageContact: UIImageView!
    @IBOutlet weak var nameContact: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

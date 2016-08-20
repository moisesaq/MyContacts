//
//  Contact.swift
//  MyContacts
//
//  Created by Moises on 8/20/16.
//  Copyright © 2016 Moises. All rights reserved.
//

import Foundation

class Contact{
    var name: String = ""
    var lastName: String = ""
    var phone: Int = 0
    var email: String = ""
    var pathImage: String = ""
    
    init(name: String, lastName: String, phone: Int, email: String, pathImage: String){
        self.name = name
        self.lastName = lastName
        self.phone = phone
        self.email = email
        self.pathImage = pathImage
    }
    
    func getFullName() -> String{
        return "\(name) \(lastName)"
    }
}
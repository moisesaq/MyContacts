//
//  ViewController.swift
//  MyContacts
//
//  Created by Moises on 8/6/16.
//  Copyright © 2016 Moises. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    let delegate: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    

    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var phone: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var save: UIButton!
    
    var listContacts = [Contact]()
    var itemReceived = "empty"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Item received \(itemReceived)")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func saveContact(sender: AnyObject) {
        let textName = name.text!
        let textLastName = lastName.text!
        let numberPhone = phone.text!
        let textEmail = emailTF.text!
        if(textName != "" && textLastName != "" && numberPhone != "" && textEmail != ""){
            
            let contact = Contact(name: textName, lastName: textLastName, phone: Int(numberPhone)!, email: textEmail, pathImage: "bart")
            
            let context: NSManagedObjectContext = delegate.managedObjectContext
            let newContact = NSEntityDescription.insertNewObjectForEntityForName("Contact", inManagedObjectContext: context)
            newContact.setValue(textName, forKey: "name")
            newContact.setValue(textLastName, forKey: "lastname")
            newContact.setValue(Int(numberPhone)!, forKey: "phone")
            newContact.setValue(textEmail, forKey: "email")
            newContact.setValue("bart", forKey: "pathImage")
            
            do{
                try context.save()
                addContact(contact)
                clearField()
            }catch{
                print("No saved")
            }
            
            
        }else{
            showMessage("Name is empty")
        }
    }
    
    func clearField(){
        name.text = ""
        lastName.text = ""
        phone.text = ""
        emailTF.text = ""
    }
    
    func addContact(contact: Contact){
        listContacts.append(contact)
        print(listContacts)
    }
    
    func showMessage(message: String){
        let alert = UIAlertController(title: "Message", message: message, preferredStyle: UIAlertControllerStyle.ActionSheet)
        let action = UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default, handler: nil)
        
        alert.addAction(action)
        self.presentViewController(alert, animated: true, completion: nil);
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "toListContact"){
            let listContactController: ListContactController = segue.destinationViewController as! ListContactController
            listContactController.listData = listContacts
        }else if(segue.identifier == "listTest"){
            
        }
        
    }
}


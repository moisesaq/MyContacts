//
//  ViewController.swift
//  MyContacts
//
//  Created by Moises on 8/6/16.
//  Copyright © 2016 Moises. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var save: UIButton!
    
    var listContacts = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func saveContact(sender: AnyObject) {
        let c = name.text!
        if(c != ""){
            addContact(c)
        }else{
            showMessage("Name is empty")
        }
    }
    
    func addContact(contact: String){
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
        let listContactController: ListContactController = segue.destinationViewController as! ListContactController
        listContactController.listData = listContacts
    }
}


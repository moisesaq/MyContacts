    //
//  ListContactViewController.swift
//  MyContacts
//
//  Created by Moises on 8/6/16.
//  Copyright © 2016 Moises. All rights reserved.
//

import UIKit
import CoreData

class ListContactController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    let delegate: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    
    @IBOutlet weak var contactTableView: UITableView!
    var listData = [Contact]()
    //var listData: [String] = ["data1", "data2"]
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listData.count
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        /*let row = indexPath.row
        let section = indexPath
         
        print("row \(row)")
        print("section \(section)")*/
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        /*let cell: UITableViewCell = self.contactTableView.dequeueReusableCellWithIdentifier("cell")! as UITableViewCell
        cell.textLabel?.text = listData[indexPath.row]*/
        
        let cell: CustomCellTableViewCell = self.contactTableView.dequeueReusableCellWithIdentifier("cell") as! CustomCellTableViewCell
        if(cell.nameContact == nil){
            print("cell name nulllllll")
        }
        let contact = listData[indexPath.item];
        cell.imageContact.image = UIImage(named: contact.pathImage)
        cell.nameContact?.text = contact.getFullName()
        cell.phoneContact?.text = String(contact.phone)
        cell.emailContact?.text = contact.email
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(listData)
        loadData()
        //contactTableView.registerClass(CustomCellTableViewCell.classForCoder(), forCellReuseIdentifier: "cell")
        //contactTableView.registerNib(UINib(nibName: "CustomCellTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadData(){
        do{
            let request = NSFetchRequest(entityName: "Contact")
            let context: NSManagedObjectContext = delegate.managedObjectContext
            let results = try context.executeFetchRequest(request)
            if(results.count > 0){
                for res in results as! [NSManagedObject]{
                    let phone = String(res.valueForKey("phone"))
                    print(res.valueForKey("name") as? String)
                    print(res.valueForKey("lastname"))
                    print(phone)
                    print(res.valueForKey("email"))
                    print(res.valueForKey("pathImage"))
                    
                    let contact = Contact(name: res.valueForKey("name") as! String,
                                          lastName: String(res.valueForKey("lastname")),
                                          phone: 123,
                                          email: String(res.valueForKey("email")),
                                          pathImage: String(res.valueForKey("pathImage")))
                    listData.append(contact)
                }
            }
        }catch{
            print("Error in request data base")
        }
        
    }
}

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
    
    let delegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
    
    @IBOutlet weak var contactTableView: UITableView!
    var listData = [Contact]()
    //var listData: [String] = ["data1", "data2"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listData.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        /*let row = indexPath.row
        let section = indexPath
         
        print("row \(row)")
        print("section \(section)")*/
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        /*let cell: UITableViewCell = self.contactTableView.dequeueReusableCellWithIdentifier("cell")! as UITableViewCell
        cell.textLabel?.text = listData[indexPath.row]*/
        
        let cell: CustomCellTableViewCell = self.contactTableView.dequeueReusableCell(withIdentifier: "cell") as! CustomCellTableViewCell
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
            let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Contact")
            let context: NSManagedObjectContext = delegate.managedObjectContext
            let results = try context.fetch(request)
            if(results.count > 0){
                for res in results as! [NSManagedObject]{
                    //let phone = String(describing: res.value(forKey: "phone"))
                    print(res)
                    
                    let contact = Contact(name: res.value(forKey: "name") as! String,
                                          lastName: String(describing: res.value(forKey: "lastname")),
                                          phone: 123,
                                          email: String(describing: res.value(forKey: "email")),
                                          pathImage: String(describing: res.value(forKey: "pathImage")))
                    listData.append(contact)
                }
            }
        }catch{
            print("Error in request data base")
        }
        
    }
}

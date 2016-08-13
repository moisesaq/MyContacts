    //
//  ListContactViewController.swift
//  MyContacts
//
//  Created by Moises on 8/6/16.
//  Copyright © 2016 Moises. All rights reserved.
//

import UIKit

class ListContactController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var contactTableView: UITableView!
    var listData = [String]()
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
        cell.nameContact?.text = listData[indexPath.item]
        cell.emailContact?.text = "test@test.com"
        cell.phoneContact?.text = "12345"
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(listData)
        
        //contactTableView.registerClass(CustomCellTableViewCell.classForCoder(), forCellReuseIdentifier: "cell")
        //contactTableView.registerNib(UINib(nibName: "CustomCellTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

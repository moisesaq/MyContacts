//
//  ListViewController.swift
//  MyContacts
//
//  Created by Moises on 8/13/16.
//  Copyright © 2016 Moises. All rights reserved.
//

import UIKit

class ListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var tableData: [String] = ["homero", "bart"]
    
    var itemSelected = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let nib = UINib(nibName: "UIContactCell", bundle: nil)
        tableView.registerNib(nib, forCellReuseIdentifier: "cell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tableData.count
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("Row \(indexPath) selected!")
        print("Image selected: \(tableData[indexPath.item])")
        itemSelected = tableData[indexPath.item]
        //dismissViewControllerAnimated(<#T##flag: Bool##Bool#>, completion: <#T##(() -> Void)?##(() -> Void)?##() -> Void#>)
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: ContactCell = self.tableView.dequeueReusableCellWithIdentifier("cell") as! ContactCell
        
        cell.nameContact.text = tableData[indexPath.row]
        cell.imageContact.image = UIImage(named: tableData[indexPath.row])
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "toListTest"){
            let viewController: ViewController = segue.destinationViewController as! ViewController
            viewController.itemReceived = itemSelected
            print("Send item \(viewController.itemReceived)")
        }
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

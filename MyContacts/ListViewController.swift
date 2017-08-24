//
//  ListViewController.swift
//  MyContacts
//
//  Created by Moises on 8/13/16.
//  Copyright © 2016 Moises. All rights reserved.
//

import UIKit

class ListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let delegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
    
    @IBOutlet weak var tableView: UITableView!
    var tableData: [String] = ["homero", "bart"]
    
    var itemSelected = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let nib = UINib(nibName: "UIContactCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "cell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tableData.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Row \(indexPath) selected!")
        print("Image selected: \(tableData[indexPath.item])")
        itemSelected = tableData[indexPath.item]
        //dismissViewControllerAnimated(<#T##flag: Bool##Bool#>, completion: <#T##(() -> Void)?##(() -> Void)?##() -> Void#>)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ContactCell = self.tableView.dequeueReusableCell(withIdentifier: "cell") as! ContactCell
        
        cell.nameContact.text = tableData[indexPath.row]
        cell.imageContact.image = UIImage(named: tableData[indexPath.row])
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "toListTest"){
            let viewController: ViewController = segue.destination as! ViewController
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

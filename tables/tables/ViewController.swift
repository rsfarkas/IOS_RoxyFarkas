//
//  ViewController.swift
//  tables
//
//  Created by Roxanne Farkas on 4/13/17.
//  Copyright © 2017 Roxanne Farkas. All rights reserved.
//

import UIKit

var myList = ["banana","apple","peach","kiwi","pear", "orange"]
var myVeggies = ["avo","cuc","tomato","corn","celery","carrot"]

class ViewController: UIViewController , UITableViewDataSource, UITableViewDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        var mySectionTitle = "Default"
        
        if section == 0{
           mySectionTitle = "Fruit"
        } else{
            mySectionTitle = "Veggies"
        }
        
        return mySectionTitle
       
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       // return myList.count
        var myCount = 1
        
        if section == 0{
          myCount = myList.count
        } else{
         myCount = myVeggies.count
        }
        
        return myCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        
        if indexPath.section == 0{
            cell.textLabel?.text = myList[indexPath.row]
            cell.detailTextLabel?.text = "sweet things to eat"
        } else{
            cell.textLabel?.text = myVeggies[indexPath.row]
            cell.detailTextLabel?.text = "salty things to eat"
        }
        
        
        //let mySting = "section: \(indexPath.section) row:\(indexPath.row)"
        //cell.textLabel?.text = myList[indexPath.row]
        return cell 
    }

    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        print("user selected indexpath section \(indexPath.section) and row at \(indexPath.row)")

    }
    
}


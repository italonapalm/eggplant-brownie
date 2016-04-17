//
//  MealsTableViewController.swift
//  eggplant-brownie
//
//  Created by Ítalo Pires on 16/04/16.
//  Copyright © 2016 br.com.pires. All rights reserved.
//

import UIKit

class MealsTableViewController: UITableViewController {
    
    var meals = [Meal(name: "Eggplant brownie", happiness: 5), Meal(name: "Zucchini Muffin", happiness: 3)]

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func add(meal: Meal) {
        meals.append(meal)
        tableView.reloadData()
    }
    
    func sei(meal: Meal) {
        print(meal.name)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "addMeal") {
            let view = segue.destinationViewController as! ViewController
            view.delegate = self

        }
        
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return meals.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)

        // Configure the cell...
        let row = indexPath.row
        let meal = meals[row]
        
        var cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: nil)
        cell.textLabel?.text = meal.name

        return cell
    }
}

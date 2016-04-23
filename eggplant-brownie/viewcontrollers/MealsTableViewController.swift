//
//  MealsTableViewController.swift
//  eggplant-brownie
//
//  Created by Ítalo Pires on 16/04/16.
//  Copyright © 2016 br.com.pires. All rights reserved.
//

import UIKit

class MealsTableViewController: UITableViewController, AddAMealDelegate {
    
    var meals = [Meal(name: "Eggplant brownie", happiness: 5), Meal(name: "Zucchini Muffin", happiness: 3)]

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func add(meal: Meal) {
        meals.append(meal)
        tableView.reloadData()
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
        
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: nil)
        cell.textLabel?.text = meal.name
        
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(MealsTableViewController.showDetails(_:)))
        cell.addGestureRecognizer(longPress)

        return cell
    }
    
    func showDetails(recognizer : UILongPressGestureRecognizer) {
        if recognizer.state == UIGestureRecognizerState.Began {
            let cell = recognizer.view as! UITableViewCell
            let indexPath = tableView.indexPathForCell(cell)
            
            if indexPath == nil {
                return
            }
            
            let row = indexPath!.row
            let meal = meals[row]
            
            RemoveMealController(controller: self).show(meal, handler: {action in
                self.meals.removeAtIndex(row)
                self.tableView.reloadData()
            })
        }
        
    }
    
    
    
    
}

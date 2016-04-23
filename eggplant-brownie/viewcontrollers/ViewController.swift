//
//  ViewController.swift
//  eggplant-brownie
//
//  Created by Ítalo Pires on 14/04/16.
//  Copyright © 2016 br.com.pires. All rights reserved.
//

import UIKit

protocol AddAMealDelegate {
    func add(meal : Meal)
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, AddAnItemDelegate {
    
    @IBOutlet var nameField : UITextField!
    @IBOutlet var happinessField : UITextField!
    var delegate : AddAMealDelegate?
    var items = [Item(name: "Eggplant Brownie", calories: 10),
                 Item(name: "Zucchini Muffin", calories: 10),
                 Item(name: "Cookie", calories: 10),
                 Item(name: "Coconut oil", calories: 500),
                 Item(name: "Chocolate frosting", calories: 1000),
                 Item(name: "Chocolate chip", calories: 1000)]
    var selected = Array<Item>()
    @IBOutlet var tableView : UITableView!

    @IBAction func add() {
        
        if let meal = getMealFromForm() {
            if let meals = delegate {
                meals.add(meal)
                
                if let navigation = self.navigationController {
                    navigation.popViewControllerAnimated(true)
                } else {
                    Alert(controller: self).show("Unexpected error, but the meal was added.")
                }
                return
            }
            
            

        }
        Alert(controller: self).show()
        
    }
    
    func getMealFromForm() -> Meal? {
        if nameField == nil || happinessField == nil {
            return nil
        }
        
        let name = nameField!.text
        let happiness = Int(happinessField.text!)
        if happiness == nil {
            return nil
        }
        
        let meal = Meal(name: name!, happiness: happiness!)
        meal.items = selected
        print("eaten: \(meal.name) \(meal.happiness) \(meal.items)")
        return meal
    }
    
    func tableView(tableView: UITableView,
                        numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(tableView: UITableView,
                   cellForRowAtIndexPath indexPath: NSIndexPath)
        -> UITableViewCell {
            let row = indexPath.row
            let item = items[row]
            let cell = UITableViewCell(style:
                UITableViewCellStyle.Default,reuseIdentifier: nil)
            cell.textLabel!.text = item.name
            return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let cell = tableView.cellForRowAtIndexPath(indexPath)! //Traz celula que usuário selecionou
        
        if (cell.accessoryType == UITableViewCellAccessoryType.None) {
            cell.accessoryType = UITableViewCellAccessoryType.Checkmark //Marca a linha selecionada
            selected.append(items[indexPath.row])
        } else {
            cell.accessoryType = UITableViewCellAccessoryType.None
            
            if let position = selected.indexOf(items[indexPath.row]) {
                selected.removeAtIndex(position)
                print(position)
            }
        }
        
    }
    
    override func viewDidLoad() {
        //style: formato, target: quem deve ser chamado ao clicarmos no botao
        //action: qual ação queremos executar neste objeto que for chamado
        let newItemButton = UIBarButtonItem(title: "new item", style: UIBarButtonItemStyle.Plain, target: self, action: #selector(ViewController.showNewItem))
        
        navigationItem.rightBarButtonItem = newItemButton
    }
    
    @IBAction func showNewItem() {
        let newItem = NewItemViewController(delegate: self)
        if let navigation = navigationController {
            navigation.pushViewController(newItem, animated: true)
        } else {
            Alert(controller: self).show()
        }
        print("new item")
    }
    
    func addNew(item: Item) {
        items.append(item)
        
        if let tableView = tableView {
            tableView.reloadData()
        } else {
            Alert(controller: self).show()
        }
        
        
    }

}

class Alert {
    let controller : UIViewController
    init(controller: UIViewController) {
        self.controller = controller
    }
    
    func show(title: String = "Sorry", message: String = "Unexpected Error.") {
        let details = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        let cancel = UIAlertAction(title: "Understood", style: UIAlertActionStyle.Cancel, handler: nil)
        details.addAction(cancel)
        controller.presentViewController(details, animated: true, completion: nil)
    }
}

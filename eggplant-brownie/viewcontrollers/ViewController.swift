//
//  ViewController.swift
//  eggplant-brownie
//
//  Created by Ítalo Pires on 14/04/16.
//  Copyright © 2016 br.com.pires. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var nameField : UITextField!
    @IBOutlet var happinessField : UITextField!
    var delegate : MealsTableViewController?

    @IBAction func add() {
        
        if nameField == nil || happinessField == nil {
            return
        }
        
        let name = nameField.text!
        let happiness = Int(happinessField.text!)
        
        if happiness == nil {
            return
        }
        
        let meal = Meal(name: name, happiness: happiness!)
        
        print("eaten: \(meal.name) \(meal.happiness)")
        delegate!.add(meal)
        
        if let navigation = self.navigationController {
            navigation.popViewControllerAnimated(true)
        }
        
    }


}


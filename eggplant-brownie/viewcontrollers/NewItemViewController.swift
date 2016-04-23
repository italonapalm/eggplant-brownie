//
//  NewItemViewController.swift
//  eggplant-brownie
//
//  Created by Ítalo Pires on 21/04/16.
//  Copyright © 2016 br.com.pires. All rights reserved.
//

import UIKit

protocol AddAnItemDelegate {
    func addNew(item : Item)
}

class NewItemViewController: UIViewController {
    @IBOutlet var nameField : UITextField?
    @IBOutlet var caloriesField : UITextField?
    var delegate : AddAnItemDelegate?
    
    init(delegate : AddAnItemDelegate) {
        self.delegate = delegate
        
        super.init(nibName: "NewItemViewController", bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    @IBAction func addNewItem() {
        if nameField == nil || caloriesField == nil {
            return
        }
        
        let name = nameField!.text
        let calories = caloriesField!.text
        
        let item = Item(name: name!, calories: Double(calories!)!)
        
        if delegate == nil {
            return
        }
        
        delegate!.addNew(item)
        
        if let navigation = navigationController {
            navigation.popViewControllerAnimated(true)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

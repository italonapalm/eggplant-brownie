//: Playground - noun: a place where people can play

import UIKit

class Meal {
    var name : String
    var happiness : Int
    var items = Array<Item>()
    
    init(name : String, happiness : Int) {
        self.name = name
        self.happiness = happiness
    }
    
    func allCalories() ->Double {
        var total = 0.0
        for i in items {
            total += i.calories
        }
        return total
    }
}

class Item {
    var name : String
    var calories : Double
    init(name : String, calories : Double) {
        self.name = name
        self.calories = calories
    }
}

let brownie = Meal(name: "egg", happiness: 5)
let item1 = Item(name: "brownie", calories: 115)
let item2 = Item(name: "vegan", calories: 40)

brownie.items.append(item1)
brownie.items.append(item2)
brownie.allCalories()
//
//  Item.swift
//  eggplant-brownie
//
//  Created by Ítalo Pires on 15/04/16.
//  Copyright © 2016 br.com.pires. All rights reserved.
//

import Foundation

class Item : Equatable {
    let name : String
    let calories : Double

    init(name: String, calories: Double) {
        self.name = name
        self.calories = calories
    }
    
}

func ==(first : Item, second : Item) -> Bool {
    return first.name == second.name && first.calories == second.calories
}
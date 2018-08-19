//
//  Monster.swift
//  Focusmon
//
//  Created by Sunny Ouyang on 7/18/18.
//  Copyright © 2018 Sunny Ouyang. All rights reserved.
//

import Foundation
import UIKit


class Monster {
    
    var name: String
    var description: String
    var averageAtk: Int
    var attack: Int
    var averageHealth: Int
    var health: Int
    var image: UIImage
    var slot: Int
    var enchantmentAtk: Int = 0
    var enchantmentHp: Int = 0
    var successfulEnchants: Int = 0
    
    init(name: String, attack: Int, health: Int, image: UIImage, description: String, averageAtk: Int, averageHealth: Int, slot: Int) {
        self.name = name
        self.attack = attack
        self.averageAtk = averageAtk
        self.health = health
        self.averageHealth = averageHealth
        self.image = image
        self.description = description
        self.slot = slot
    }
    
}

class Draby: Monster {
    
    
    init() {
        super.init(name: "Draby", attack: 15, health: 80, image: #imageLiteral(resourceName: "Gigimon"), description: "Playful and feisty, this baby dragon comes from the highest altitudes of the Sky Mountains.", averageAtk: 15, averageHealth: 80, slot: 7)
        self.name = name
        self.attack = attack
        self.averageAtk = averageAtk
        self.health = health
        self.averageHealth = averageHealth
        self.image = image
        self.description = description
        self.slot = slot
    }
}

class Meko: Monster {
    init() {
        super.init(name: "Meko", attack: 25, health: 125, image: #imageLiteral(resourceName: "Wanyamon"), description: "Peaceful, good natured. This mysterious furball is found in the depths of the Wild Jungle.", averageAtk: 25, averageHealth: 125, slot: 7)
        
        self.name = name
        self.attack = attack
        self.averageAtk = averageAtk
        self.health = health
        self.averageHealth = averageHealth
        self.image = image
        self.description = description
        self.slot = slot
    }
}

class Lolo: Monster {
    
    init() {
        super.init(name: "Jojo", attack: 20, health: 100, image: #imageLiteral(resourceName: "Lopmon"), description: "Sassy and witty. These bunnies love to play around with passerbys.", averageAtk: 20, averageHealth: 100, slot: 7)
        
        self.name = name
        self.attack = attack
        self.averageAtk = averageAtk
        self.health = health
        self.averageHealth = averageHealth
        self.image = image
        self.description = description
        self.slot = slot
    }
    
}

class Coco: Monster {
    
    init() {
        super.init(name: "Coco", attack: 20, health: 100, image: #imageLiteral(resourceName: "cutemon"), description: "Shy and Timid. These music loving bunnies usually keep to themselves but can be extremely lovable.", averageAtk: 20, averageHealth: 100, slot: 7)
        
        self.name = name
        self.attack = attack
        self.averageAtk = averageAtk
        self.health = health
        self.averageHealth = averageHealth
        self.image = image
        self.description = description
        self.slot = slot
    }
    
}

class Agox: Monster {
    
    init() {
        super.init(name: "Agox", attack: 35, health: 60, image: #imageLiteral(resourceName: "Black Agumon"), description: "Wildly aggressive and curious. Do not show fear in the face of these baby dinosaurs...", averageAtk: 35, averageHealth: 60, slot: 7)
        
        self.name = name
        self.attack = attack
        self.averageAtk = averageAtk
        self.health = health
        self.averageHealth = averageHealth
        self.image = image
        self.description = description
        self.slot = slot
    }
    
}

class Monsters {
    
    static func createNewMonster(randomInt: Int) -> Monster {
        var monsters: [Monster] = [Draby(), Draby(), Draby(), Draby(), Draby(), Meko(), Agox(), Agox(), Coco(), Coco(), Coco(), Lolo(), Lolo()]
        let upperValueAtk = 10
        let lowerValueAtk = -10
        let upperValueHealth = 30
        let lowerValueHealth = -30
        
        let atkRange = Int(arc4random_uniform(UInt32(upperValueAtk - lowerValueAtk + 1))) + lowerValueAtk
        let healthRange = Int(arc4random_uniform(UInt32(upperValueHealth - lowerValueHealth + 1))) + lowerValueHealth
        let newMonster = monsters[randomInt]
        newMonster.attack += atkRange
        newMonster.health += healthRange
        
        return newMonster
    }
}

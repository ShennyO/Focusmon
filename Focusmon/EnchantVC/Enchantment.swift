//
//  Enchantment.swift
//  Focusmon
//
//  Created by Sunny Ouyang on 7/28/18.
//  Copyright © 2018 Sunny Ouyang. All rights reserved.
//

import Foundation
import UIKit

enum statType {
    case attack
    case health
}

class Enchantment {
    var name: String
    var successRate: Int
    var price: Int
    var type: statType
    var stats: Int
    var image: UIImage
    var borderColor: UIColor
    
    init(name: String, successRate: Int, stats: Int, image: UIImage, type: statType, borderColor: UIColor, price: Int) {
        self.name = name
        self.successRate = successRate
        self.stats = stats
        self.image = image
        self.type = type
        self.borderColor = borderColor
        self.price = price
    }
}

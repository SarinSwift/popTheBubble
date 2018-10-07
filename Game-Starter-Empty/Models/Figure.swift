//
//  Figure.swift
//  Game-Starter-Empty
//
//  Created by Sarin Swift on 9/25/18.
//  Copyright © 2018 Make School. All rights reserved.
//

import Foundation
import UIKit
import SpriteKit

// box is a subclass of SKSpriteNode
class Box: SKSpriteNode {
//    let name: String
//    let color: String
//    let size: Int
    
    // when you initialize, you have to go through 2 steps; initializing all the properties, and calling the super.init() that isn't a convenience initializer
    init(name: String, color: UIColor, size: CGSize) {
        super.init(texture: nil, color: color, size: size)
        self.name = name
        // wouldn't need a self.color or self.size becasue those come from the super.init()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        // calling the same initializer at 'aDecoder'
        super.init(coder: aDecoder)
    }
}

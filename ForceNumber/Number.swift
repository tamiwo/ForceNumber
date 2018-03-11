//
//  Number.swift
//  ForceNumber
//
//  Created by Ryota on 2018/03/11.
//  Copyright © 2018年 otutama studio. All rights reserved.
//

import SpriteKit

class Number: SKLabelNode{
    private var number:Int = 0{
        didSet{
            self.text = String(number)
        }
    }
    
    override init() {
        super.init()

        fontSize = 100
        text = String(number)
    }
    
    func add(num: Int = 1){
        number += 1
    }
    
    func reset() {
        number = 0
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

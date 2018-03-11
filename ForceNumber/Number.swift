//
//  Number.swift
//  ForceNumber
//
//  Created by Ryota on 2018/03/11.
//  Copyright © 2018年 otutama studio. All rights reserved.
//

import SpriteKit

class Number: SKLabelNode{

    var max: Int = 30
    var isMax = false
    
    private var number:Int = 0{
        didSet{
            self.text = String(number)
        }
    }
    
    convenience init(max: Int){
        self.init()
        self.max = max
    }
    
    override init() {
        super.init()
        
        fontSize = 100
        text = String(number)
    }
    
    func add(num: Int = 1){
        number += 1
        if( number >= max ){
            isMax = true
        }
    }
    
    func reset() {
        number = 0
        isMax = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

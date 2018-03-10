//
//  Button.swift
//  ForceNumber
//
//  Created by Ryota on 2018/03/11.
//  Copyright © 2018年 otutama studio. All rights reserved.
//

import SpriteKit

class Button: SKLabelNode{
    
    init(text:String){
        super.init()
        self.text = text
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

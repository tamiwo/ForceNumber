//
//  Pannel.swift
//  ForceNumber
//
//  Created by Ryota on 2018/03/11.
//  Copyright © 2018年 otutama studio. All rights reserved.
//

import SpriteKit

class Pannel: SKNode {
    
    let size: CGSize
    var backColor: UIColor{
        didSet{
            backGround.fillColor = backColor
        }
    }
    let backGround: SKShapeNode
    
    init(frame :CGRect) {
        size = CGSize(width: frame.midX, height: frame.maxY)
        backGround = SKShapeNode(rect: CGRect(origin: CGPoint.zero, size: size))
        backColor = UIColor.gray
        
        super.init()

        backGround.fillColor = backColor
        backGround.lineWidth = 0
        self.zPosition = 1
        addChild(backGround)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

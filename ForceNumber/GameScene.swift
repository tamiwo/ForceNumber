//
//  GameScene.swift
//  ForceNumber
//
//  Created by Ryota on 2018/03/10.
//  Copyright © 2018年 otutama studio. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var number: Int = 0
    let labelNumber = SKLabelNode()
    
    override func didMove(to view: SKView) {
        labelNumber.fontSize = 100
        labelNumber.name = "number"
        labelNumber.position.x = view.frame.midX
        labelNumber.position.y = view.frame.midY
        labelNumber.text = String(self.number)
        labelNumber.fontColor = UIColor.white
        addChild(labelNumber)
        
        let addButton = Button(label: "+")
        addButton.position.x = view.frame.size.width * 0.8
        addButton.position.y = view.frame.size.height * 0.7
        addButton.touchesBeganAction {
            self.number += 1
            self.labelNumber.text = String(self.number)
        }
        self.addChild(addButton)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first as UITouch? else { return }
        let touchNode:SKNode = self.atPoint(touch.location(in: self))
        
        if let button = touchNode as? Button {
            button.touchesBegan()
        }
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
    }

    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}

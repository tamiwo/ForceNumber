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
    
    let number = Number()
    var touchingButton: Button?
    
    override func didMove(to view: SKView) {
        number.name = "number"
        number.position.x = view.frame.midX
        number.position.y = view.frame.midY
        addChild(number)
        
        let addButton = Button(label: "+")
        addButton.position.x = view.frame.size.width * 0.8
        addButton.position.y = view.frame.size.height * 0.7
        addButton.touchesBeganAction {
            self.number.add()
        }
        self.addChild(addButton)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first as UITouch? else { return }
        let touchNode:SKNode = self.atPoint(touch.location(in: self))
        guard let button = touchNode as? Button else {
            touchingButton = nil
            return
        }
        
        touchingButton = button
        button.touchesBegan()
    
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first as UITouch? else { return }
        let touchNode:SKNode = self.atPoint(touch.location(in: self))
        guard let button = touchNode as? Button else {
            touchingButton = nil
            return
        }
        
        if button != touchingButton {
            button.outFocus()
            touchingButton = button
            button.touchesBegan()
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first as UITouch? else { return }
        let touchNode:SKNode = self.atPoint(touch.location(in: self))
        guard let button = touchNode as? Button else {
            touchingButton = nil
            return
        }
        
        button.touchesEnded()
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
    }

    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}

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
    var pushCount = 0
    var backGround: SKShapeNode!
    
    override func didMove(to view: SKView) {
        backGround = SKShapeNode(rect: CGRect(origin: CGPoint.zero,
                                                  size: CGSize(width: frame.midX,
                                                               height: frame.maxY)))
        backGround.fillColor = UIColor.gray
        backGround.lineWidth = 0
        backGround.zPosition = 1
        addChild(backGround)
        
        number.name = "number"
        number.zPosition = 3
        number.position.x = view.frame.midX
        number.position.y = view.frame.midY
        addChild(number)
        
        let addButton = Button(label: "➕")
        addButton.position.x = backGround.frame.midX
        addButton.position.y = backGround.frame.maxY * 0.2
        addButton.touchesBeganAction {
            self.number.add()
            self.pushCount += 1
            if self.pushCount == 3 {
                if self.backGround.position.x == 0 {
                    self.backGround.position.x = self.frame.midX
                }
                else {
                    self.backGround.position.x = 0
                }
                addButton.outFocus()
                self.pushCount = 0
            }
        }
        backGround.addChild(addButton)
        
        let dummyButton1 = Button(label: "➕")
        dummyButton1.position.x = backGround.frame.midX
        dummyButton1.position.y = backGround.frame.maxY * 0.2
        addChild(dummyButton1)
        let dummyButton2 = Button(label: "➕")
        dummyButton2.position = dummyButton1.position
        dummyButton2.position.x += view.frame.midX
        addChild(dummyButton2)
        
        let resetButton = Button(label: "🔄")
        resetButton.zPosition = 2
        resetButton.position.x = view.frame.size.width * 0.5
        resetButton.position.y = view.frame.size.height * 0.2
        resetButton.touchesEndedAction {
            self.number.reset()
            self.pushCount = 0
        }
        self.addChild(resetButton)
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
        guard let touch = touches.first as UITouch? else {
            touchingButton?.outFocus()
            return
        }
        let touchNode:SKNode = self.atPoint(touch.location(in: self))
        guard let button = touchNode as? Button else {
            touchingButton?.outFocus()
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
        guard let touch = touches.first as UITouch? else {
            touchingButton?.outFocus()
            return
        }
        let touchNode:SKNode = self.atPoint(touch.location(in: self))
        guard let button = touchNode as? Button else {
            touchingButton?.outFocus()
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

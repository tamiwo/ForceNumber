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
    var pannel: Pannel!
    
    override func didMove(to view: SKView) {

        pannel = Pannel(frame: view.frame)
        addChild(pannel)
        
        number.name = "number"
        number.zPosition = 3
        number.position.x = view.frame.midX
        number.position.y = view.frame.midY
        addChild(number)
        
        let addButton = Button(label: "➕")
        addButton.position.x = pannel.size.width * 0.5
        addButton.position.y = pannel.size.height * 0.2
        addButton.touchesBeganAction {
            guard self.number.isMax == false else{ return }
            self.number.add()
            if self.number.isMax == true{
                self.pannel.backColor = UIColor.red
            }
            else{
                self.pushCount += 1
                if self.pushCount == 3 {
                    self.next()
                    addButton.outFocus()
                }
            }
        }
        pannel.addChild(addButton)
        
        let nextButton = Button(label: "🆗")
        nextButton.position.x = addButton.position.x
        nextButton.position.y = pannel.size.height * 0.5
        nextButton.touchesEndedAction {
            guard self.number.isMax == false else { return }
            if self.pushCount > 0{
                self.next()
            }
        }
        pannel.addChild(nextButton)
        
        let dummyButton1 = Button(label: "➕")
        dummyButton1.position = addButton.position
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
            self.pannel.backColor = UIColor.gray
            self.number.reset()
            self.pushCount = 0
        }
        self.addChild(resetButton)
    }
    
    func next(){
        if self.pannel.position.x == 0 {
            self.pannel.position.x = self.frame.midX
        }
        else {
            self.pannel.position.x = 0
        }
        self.pushCount = 0
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

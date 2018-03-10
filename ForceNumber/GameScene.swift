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
    
    override func didMove(to view: SKView) {
        let label = SKLabelNode()
        label.position.x = view.frame.midX
        label.position.y = view.frame.midY
        label.text = "HelloWorld"
        label.fontColor = UIColor.white
        addChild(label)
    }
    
    
    func touchDown(atPoint pos : CGPoint) {
    }
    
    func touchMoved(toPoint pos : CGPoint) {
    }
    
    func touchUp(atPoint pos : CGPoint) {
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
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

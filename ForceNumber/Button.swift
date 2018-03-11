//
//  Button.swift
//  ForceNumber
//
//  Created by Ryota on 2018/03/11.
//  Copyright © 2018年 otutama studio. All rights reserved.
//

import SpriteKit

class Button: SKLabelNode{
    
    private var beganAction: (() -> Void)?
    private var endedAction: (() -> Void)?

    init(label:String){
        super.init()
        text = label
        fontSize = 60
    }
    
    func touchesBeganAction(action: @escaping () -> Void){
        beganAction = action
    }
    
    func touchesEndedAction(action: @escaping () -> Void){
        endedAction = action
    }

    func touchesBegan() {
        inFocus()
        beganAction?()
    }
    
    func touchesEnded() {
        outFocus()
        endedAction?()
    }
    
    func inFocus(){
        xScale = 1.2
        yScale = 1.2
    }
    
    func outFocus(){
        xScale = 1.0
        yScale = 1.0
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

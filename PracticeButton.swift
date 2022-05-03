//
//  PracticeButton.swift
//  Mindful
//
//  Created by Felipe Gameleira on 19/04/22.
//

import Foundation
import SpriteKit
import SwiftUI

class PracticeButton: SKShapeNode {
    let practice: Practice
    var width: CGFloat
    var height: CGFloat
    var origin: CGPoint
    var label = SKLabelNode()
    var radius: CGFloat
    var textSize: Double
    var opacity = 0.3
    let hint: String
    
    init(practice: Practice, size: CGSize, radius: CGFloat = 35, origin: CGPoint = CGPoint(x: 0, y: 0),textSize: Double = 40, hint: String){
        self.practice = practice
        self.width = size.width
        self.height = size.height
        self.origin = origin
        self.radius = radius
        self.textSize = textSize
        self.hint = hint
        
        self.label.text = self.practice.name
        self.label.position = CGPoint(x: self.width/2, y: self.height/2 - self.label.frame.maxY/2)
        self.label.fontName = "Verdana"
        self.label.fontColor = .white
        self.label.fontSize = textSize
        super.init()
        self.path = CGPath(roundedRect: CGRect(x: 0, y: 0, width: width, height: height), cornerWidth: radius, cornerHeight: radius, transform: nil)
        self.fillColor = self.practice.color
        self.alpha = self.practice.isComplete ? 1 : opacity

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

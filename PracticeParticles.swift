//
//  PracticeParticles.swift
//  Mindful
//
//  Created by Felipe Gameleira on 22/04/22.
//

import Foundation
import SpriteKit

class practiceParticle: SKEmitterNode{
    let practice: Practice
    
    init(fileName: String, practice: Practice, position: CGPoint, scale: Double) {
        self.practice = practice
        super.init(fileNamed: fileName)!
        self.position = position
                self.setScale(scale)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

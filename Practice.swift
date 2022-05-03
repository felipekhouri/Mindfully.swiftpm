//
//  PracticeNode.swift
//  Mindful
//
//  Created by Felipe Gameleira on 19/04/22.
//

import Foundation
import SpriteKit

class Practice {
    let name: String
    let desc: String
    var color: UIColor
    let audioName: String
    var isComplete = false

    init(name: String, description: String, color: UIColor, audio: String) {
        
        self.audioName = audio
        self.name = name
        self.desc = description
        self.color = color

    }
}

//
//  NavButton.swift
//  Mindful
//
//  Created by Felipe Gameleira on 21/04/22.
//

import Foundation
import SwiftUI

struct NavButton: ButtonStyle {
    
    var label: String
    var color: Color
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
        Text(label).font(.system(size: 50, weight: .bold, design: .default))
            .padding()
            .frame(width: 200, height: 100)
            .background(RoundedRectangle(cornerRadius: 35).fill(color))
            .foregroundColor(.white)
            .scaleEffect(configuration.isPressed ? 1.2 : 1)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}

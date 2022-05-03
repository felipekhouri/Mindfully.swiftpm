//
//  IntroView.swift
//  Mindful
//
//  Created by Felipe Gameleira on 21/04/22.
//

import SwiftUI

struct IntroView: View {
    
    @State var practicesView = false
    
    @Binding var introView: Bool
    var body: some View {
        ZStack{
            Image("MenuIMG")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
            VStack{
                Spacer()
                Text("What is Mindfulness?")
                    .font(.custom("Verdana", size: 65))
                    .fontWeight(.heavy)
                    .foregroundColor(Color(hue: 1.0, saturation: 0.0, brightness: 0.258))
                    .multilineTextAlignment(.center)
                    .padding([.top, .leading, .trailing], 50.0)
                Spacer()
                    
                Text("**Mindfulness** is the practice of acknowledging your feelings and thoughts without judging them.")
                    .font(.custom("Verdana", size: 45))
                    .fontWeight(.regular)
                    .foregroundColor(Color(hue: 1.0, saturation: 0.0, brightness: 0.258))
                    .multilineTextAlignment(.center)
                    .padding([.leading, .bottom, .trailing], 50.0)
                
                Text("**Practicing** mindful exercises helps you drain your attention away from negative and stressful thoughts.")
                    .font(.custom("Verdana", size: 45))
                    .fontWeight(.regular)
                    .foregroundColor(Color(hue: 1.0, saturation: 0.0, brightness: 0.258))
                    .multilineTextAlignment(.center)
                    .padding([.top, .leading, .trailing], 50.0)
                
                Spacer()
                Text("We can practice minfulness anywhere, at any time!")
                    .font(.custom("Verdana", size: 40))
                    .fontWeight(.bold)
                    .foregroundColor(Color(hue: 1.0, saturation: 0.0, brightness: 0.258))
                    .multilineTextAlignment(.center)
                    .padding([.leading, .bottom, .trailing], 50.0)
                HStack{
                    Button(action: {
                        introView.toggle()
                    }, label: {
                    }).buttonStyle(NavButton(label: "PREV", color: .gray))
                    Spacer()
                    Button(action: {
                        practicesView.toggle()
                    }, label: {
                    })
                    .fullScreenCover(isPresented: $practicesView) {
                        PracticesView(practicesView: $practicesView)
                    }.buttonStyle(NavButton(label: "NEXT", color: .gray))
                }
            }.padding()
        }
    }
}

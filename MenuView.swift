//
//  MenuView.swift
//  Mindful
//
//  Created by Felipe Gameleira on 24/04/22.
//

import SwiftUI

struct MenuView: View {
    
    @State var introView = false
    var body: some View {
        ZStack{
            Image("IntroIMG")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
            VStack{
                Spacer()
                Button(action: {
                    introView.toggle()
                }, label: {
                })
                .fullScreenCover(isPresented: $introView) {
                    IntroView(introView: $introView)
                }.buttonStyle(NavButton(label: "START", color: .blue))
            }.padding(50)
        }
    }
}

//struct MenuView_Previews: PreviewProvider {
//    static var previews: some View {
//        MenuView()
//    }
//}

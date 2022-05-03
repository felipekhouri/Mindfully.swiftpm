//
//  PracticesView.swift
//  Mindful
//
//  Created by Felipe Gameleira on 24/04/22.
//

import SwiftUI

struct PracticesView: View {
    
    @State var prepView:Bool = false
    
    @Binding var practicesView:Bool
    
    var body: some View {
        ZStack{
            Image("MenuIMG")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
            VStack{
                Text("There are lots of mindful exercises, such as:")
                    .font(.custom("Verdana", size: 55))
                    .fontWeight(.bold)
                    .foregroundColor(Color(hue: 1.0, saturation: 0.0, brightness: 0.258))
                    .multilineTextAlignment(.center)
                    .padding(.all, 75.0)
                Spacer()
                HStack{
                    Text("😮‍💨")
                        .font(.custom("Verdana", size: 150))
                        .multilineTextAlignment(.trailing)
                        .padding(.horizontal, 50.0)
                    Spacer()
                    VStack{
                        HStack{
                            Text("Breathing")
                                .font(.custom("Verdana", size: 55))
                                .fontWeight(.heavy)
                                .foregroundColor(Color(hue: 1.0, saturation: 0.0, brightness: 0.258))
                                .multilineTextAlignment(.leading)
                                .padding(.leading, 50.0)
                            Spacer()
                        }
                        HStack{
                            Text("Simple guided breathing techniques.")
                                .font(.custom("Verdana", size: 35))
                                .fontWeight(.regular)
                                .foregroundColor(Color(hue: 1.0, saturation: 0.0, brightness: 0.258))
                                .multilineTextAlignment(.leading)
                                .padding(.horizontal, 50.0)
                            Spacer()
                        }
                    }
                    
                }
                Spacer()
                HStack{
                    Text("👤")
                        .font(.custom("Verdana", size: 150))
                        .multilineTextAlignment(.trailing)
                        .padding(.horizontal, 50.0)
                    Spacer()
                    VStack{
                        HStack{
                            Text("Body Scan")
                                .font(.custom("Verdana", size: 55))
                                .fontWeight(.heavy)
                                .foregroundColor(Color(hue: 1.0, saturation: 0.0, brightness: 0.258))
                                .multilineTextAlignment(.leading)
                                .padding(.leading, 50.0)
                            Spacer()
                        }
                        HStack{
                            Text("Bringing attention to the body, noticing and witnessing physical sensations.")
                                .font(.custom("Verdana", size: 35))
                                .fontWeight(.regular)
                                .foregroundColor(Color(hue: 1.0, saturation: 0.0, brightness: 0.258))
                                .multilineTextAlignment(.leading)
                                .padding(.leading, 50.0)
                            Spacer()
                        }
                        
                    }
                }
                Spacer()
                HStack{
                    Text("💡")
                        .font(.custom("Verdana", size: 150))
                        .multilineTextAlignment(.trailing)
                        .padding(.horizontal, 50.0)
                    Spacer()
                    VStack{
                        HStack{
                            Text("Visualization")
                                .font(.custom("Verdana", size: 55))
                                .fontWeight(.heavy)
                                .foregroundColor(Color(hue: 1.0, saturation: 0.0, brightness: 0.258))
                                .multilineTextAlignment(.leading)
                                .padding(.leading, 50.0)
                            Spacer()
                        }
                        HStack{
                            Text("Using your imagination to visualze things can be very powerful when practiced effortlessly.")
                                .font(.custom("Verdana", size: 35))
                                .fontWeight(.regular)
                                .foregroundColor(Color(hue: 1.0, saturation: 0.0, brightness: 0.258))
                                .multilineTextAlignment(.leading)
                                .padding(.leading, 50.0)
                            Spacer()
                        }
                        
                    }
                    
                }
                Spacer()
                HStack{
                    Text("👁")
                        .font(.custom("Verdana", size: 150))
                        .fontWeight(.bold)
                        .foregroundColor(Color(hue: 1.0, saturation: 0.0, brightness: 0.258))
                        .multilineTextAlignment(.leading)
                        .padding(.horizontal, 50.0)
                    Spacer()
                    VStack{
                        HStack{
                            Text("Focus")
                                .font(.custom("Verdana", size: 55))
                                .fontWeight(.heavy)
                                .foregroundColor(Color(hue: 1.0, saturation: 0.0, brightness: 0.258))
                                .multilineTextAlignment(.leading)
                                .padding(.horizontal, 50.0)
                            Spacer()
                        }
                        HStack{
                            Text("Placing the attention on one thing at a time, recognizing distractions while being aware.")
                                .font(.custom("Verdana", size: 35))
                                .fontWeight(.regular)
                                .foregroundColor(Color(hue: 1.0, saturation: 0.0, brightness: 0.258))
                                .multilineTextAlignment(.leading)
                                .padding(.horizontal, 50.0)
                            Spacer()
                        }
                    }
                }
                HStack{
                    Button(action: {
                        practicesView.toggle()
                    }, label: {
                    })
                    .buttonStyle(NavButton(label: "PREV", color: .gray))
                    Spacer()
                    Button(action: {
                        prepView.toggle()
                    }, label: {
                    }).fullScreenCover(isPresented: $prepView) {
                        PrepView(prepView: $prepView)
                    }
                    .buttonStyle(NavButton(label: "NEXT", color: .gray))
                }
            }.padding()
        }
    }
}



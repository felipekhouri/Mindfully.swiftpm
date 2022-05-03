import SwiftUI


struct PrepView: View {
    let columnLayout = Array(repeating: GridItem(), count: 2)
    
    @State var selectedColor: Color = .red
    
    @State var gameView = false
    
    @Binding var prepView: Bool
    var body: some View {
        ZStack{
            Image("MenuIMG")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
            VStack {
                Spacer()
                Text("So why don't we take a moment to practice some guided mindful exercises? It will be fun!")
                    .font(.custom("Verdana", size: 55))
                    .fontWeight(.bold)
                    .foregroundColor(Color(hue: 1.0, saturation: 0.0, brightness: 0.258))
                    .multilineTextAlignment(.center)
                    .padding(.all, 75.0)
                Spacer()
                Text("Hit PLAY when you're ready!")
                    .font(.custom("Verdana", size: 55))
                    .fontWeight(.bold)
                    .foregroundColor(Color(hue: 1.0, saturation: 0.0, brightness: 0.258))
                    .multilineTextAlignment(.center)
                    .padding(.all, 75.0)
                
                Spacer()
                HStack{
                    Button(action: {
                        prepView.toggle()
                    }, label: {
                    })
                    .buttonStyle(NavButton(label: "PREV", color: .gray))
                    Spacer()
                    Button(action: {
                        gameView.toggle()
                    }, label: {
                    }).fullScreenCover(isPresented: $gameView) {
                        GameSceneView(gameView: $gameView)
                    }
                    .buttonStyle(NavButton(label: "PLAY", color: .green))
                    
                    
                }
            }
            .padding(50)
        }
    }
}


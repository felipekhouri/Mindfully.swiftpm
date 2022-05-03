
import SwiftUI
import SpriteKit
import Foundation


class GameScene: SKScene {
    
    var theme = SKAudioNode(fileNamed: "Mindful Song")
    
    var tutorial = true
    
    lazy var tutorialScreen = SKShapeNode(rectOf: CGSize(width: self.frame.width, height: self.frame.height))
    
    let cameraNode = SKCameraNode()
    
    var inPractice = false

    let buttonSpace: Float = 30
    
    lazy var buttonSize = CGSize(width: self.frame.maxX/2 - CGFloat(buttonSpace), height: 100)
    
    lazy var buttonsOrigin: CGPoint = CGPoint(x: 0, y: self.frame.minY + 100)

    // Cria as práticas
    var breathing = Practice(name: "Breathe",
                             description: "Guided breathing practice",
                             color: .purple, audio: "Breathing.m4a")
    var bodyScan = Practice(name: "Scan",
                             description: "Guided body scan practice",
                            color: .green, audio: "Body Scan.m4a")
    var focus = Practice(name: "Focus",
                         description: "Guided focus practice",
                         color: .blue, audio: "Focus.m4a")
    var visualization = Practice(name: "Visualize",
                             description: "Guided visualization practice",
                                 color: .orange, audio: "Visualization.m4a")
    
    lazy var allPractices:[Practice] = [bodyScan, focus, visualization, breathing]
    
    
    //Cria os botões das práticas
    lazy var breathingButton = PracticeButton(practice: breathing, size: buttonSize, hint: "☁️")
    lazy var bodyScanButton = PracticeButton(practice: bodyScan, size: buttonSize, hint: "🍃")
    lazy var focusButton = PracticeButton(practice: focus, size: buttonSize, hint: "🫧")
    lazy var visualizationButton = PracticeButton(practice: visualization, size: buttonSize, hint: "🔥")

    // Array de botões de práticas
    lazy var allButtons:[PracticeButton] = [ bodyScanButton, focusButton, visualizationButton, breathingButton]
    
    
    // Mostra os botões na cena
    func displayButtons(buttons: [PracticeButton], origin: CGPoint, size: CGSize, space: Float){
        let buttonCount = buttons.count
        var coordX = Float(origin.x) - Float(size.width) * 2 - space * 1.5
        
        
        for i in 0...buttonCount-1{
            buttons[i].origin.x = CGFloat(coordX)
            buttons[i].position = CGPoint(x: CGFloat(coordX), y: origin.y)
            self.addChild(buttons[i])
            buttons[i].addChild(buttons[i].label)
            print("Loaded-> ",buttons[i].practice.name,"\nButton size width-> ",buttonSize.width)
            coordX += Float(size.width) + space
        }
    }
    

    func ReplaceButton(button: PracticeButton){
        let buttonR = PracticeButton(practice: button.practice, size: CGSize(width: button.width, height: button.height), radius: button.radius, origin: button.origin, textSize: button.textSize,hint: button.hint)
        
        buttonR.position = button.position
        
        button.removeAllChildren()
        button.removeFromParent()
        self.addChild(buttonR)
        buttonR.addChild(buttonR.label)
    }
    
    func PracticeZoom(click: CGPoint,time: Double,scale: Double){
        
        let zoomIN = SKAction.group([SKAction.scale(to: scale, duration: 1),SKAction.move(to: click, duration: 1)])
        zoomIN.timingMode = .easeInEaseOut
        
        let zoomOut = SKAction.group([SKAction.scale(to: 1, duration: 1),
                                      SKAction.move(to: CGPoint(x: 0, y: 0), duration: 1),
                                      SKAction.run {
                                          self.inPractice.toggle()
                                      }])
        zoomOut.timingMode = .easeInEaseOut
        
        let sequence = SKAction.sequence([
            SKAction.run {
                self.inPractice.toggle()
            },
            zoomIN
            ,
            SKAction.wait(forDuration: time),
            zoomOut
        ])
        cameraNode.run(sequence)
    }
    
    func displayTutorial(){
        tutorialScreen.fillColor = .black
        tutorialScreen.alpha = 0.8
        tutorialScreen.zPosition = 1
        let textAux = "Try finding a place to focus and start a practice by clicking it. \n\nWhenever you find it the practice will start\n\n\nClick on the practice button on the bottom to reveal a hint to find it\n\n\n\nClick anywhere to continue"
        let text = NSMutableAttributedString(string: textAux)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        let range = NSRange(location: 0, length: textAux.count)
        text.addAttribute(.paragraphStyle, value: paragraphStyle, range: range)
        text.addAttribute(.foregroundColor, value: UIColor.white, range: range)
        text.addAttribute(.font, value: UIFont(name: "Verdana", size: 40.0) as Any, range: range)
        
        let currentNode = SKLabelNode()
        currentNode.attributedText = text
        currentNode.fontName = "Verdana"
        currentNode.preferredMaxLayoutWidth = self.frame.width
        currentNode.position.y -= self.frame.maxY/2
        tutorialScreen.addChild(currentNode)
        currentNode.lineBreakMode = .byWordWrapping
        currentNode.numberOfLines = 2
        currentNode.zPosition = 2
        addChild(tutorialScreen)
    }
    
    //Background
    lazy var backgroundImage: SKSpriteNode = {
        let node = SKSpriteNode(imageNamed: "LowPolyIsland-AMPM")
        node.position = CGPoint(x: 0, y: 0)
        node.zPosition = -1
        node.size.width = frame.size.width + 200
        node.size.height = frame.size.height + 200
        return node
    }()

    // Cria partículas
    
    lazy var campfireParticle: SKEmitterNode = {
        let node = SKEmitterNode(fileNamed: "Fire.sks")!
        node.name = "2"
        node.setScale(0.6)
        node.position = CGPoint(x: self.frame.width*0.4-(self.frame.width/2), y: (self.frame.height*0.437)-(self.frame.height/2))

        return node
    }()
    lazy var cloudsParticle: SKEmitterNode = {
        let node = SKEmitterNode(fileNamed: "Clouds.sks")!
        node.name = "3"
        node.setScale(3)
        node.position = CGPoint(x: self.frame.minX - 50,y: self.frame.maxY - 120)
        return node
    }()
    lazy var bubblesParticle: SKEmitterNode = {
        let node = SKEmitterNode(fileNamed: "Bubbles.sks")!
        node.name = "1"
        node.run(SKAction.rotate(toAngle: -1.9, duration: 0))
        node.setScale(0.17)
        node.position = CGPoint(x: self.frame.width*0.72-(self.frame.width/2), y: (self.frame.height*0.45)-(self.frame.height/2))
        return node
    }()
    lazy var leavesParticle: SKEmitterNode = {
        let node = SKEmitterNode(fileNamed: "Leaves.sks")!
        node.name = "0"
        node.setScale(0.3)
        node.position = CGPoint(x: self.frame.width*0.20-(self.frame.width/2), y: (self.frame.height*0.54)-(self.frame.height/2))
        return node
    }()
    
    
    
    override func didMove(to view: SKView) {
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        self.scaleMode = .aspectFill
        addChild(backgroundImage)
        addChild(theme)
        addChild(campfireParticle)
        addChild(cloudsParticle)
        addChild(bubblesParticle)
        addChild(leavesParticle)
        addChild(cameraNode)
        camera = cameraNode
        displayTutorial()
        displayButtons(buttons: allButtons, origin: buttonsOrigin, size: buttonSize,space: buttonSpace)
    }
    
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if tutorial == true{
            tutorialScreen.removeFromParent()
            tutorial = false
        }
        else{
            guard let touch = touches.first else {
                print("tem touche nenhum aqui")
                return
            }
            let location = touch.location(in: self)
            
            let node = nodes(at: location).first
            
            switch node{
            case is SKEmitterNode:
                if !inPractice {
                    PracticeZoom(click: location,time: 50,scale: 0.2)
                    
                    self.run(SKAction.sequence([SKAction.group([SKAction.playSoundFileNamed(allPractices[Int((node?.name)!) ?? 0].audioName, waitForCompletion: false), SKAction.run {
                        self.theme.run(SKAction.changeVolume(to: 0.2, duration: 2))
                    }]),SKAction.wait(forDuration: 50),SKAction.run {
                        self.theme.run(SKAction.changeVolume(to: 1, duration: 2))
                    }]))
                    allPractices[Int((node?.name)!) ?? 0].isComplete = true
                    ReplaceButton(button: allButtons[Int((node?.name)!) ?? 0])
                    
                    
                    
                }
                
            case is PracticeButton:
                if let button = node as? PracticeButton{
                    let hint = SKLabelNode(text: button.hint)
                    hint.position.x = button.position.x + button.frame.width/2
                    hint.position.y = button.position.y + button.height * 1.5
                    hint.fontSize = 50
                    self.run(SKAction.sequence([SKAction.run {
                        self.addChild(hint)
                    },SKAction.wait(forDuration: 2),SKAction.run {
                        hint.removeFromParent()
                    }]))
                }
            case is SKLabelNode:
                if let label = node as? SKLabelNode{
                    if let button = label.parent as? PracticeButton{
                        let hint = SKLabelNode(text: button.hint)
                        hint.fontSize = 50
                        hint.position.x = button.position.x + button.frame.width/2
                        hint.position.y = button.position.y + button.height * 1.5
                        self.run(SKAction.sequence([SKAction.run {
                            self.addChild(hint)
                        },SKAction.wait(forDuration: 2),SKAction.run {
                            hint.removeFromParent()
                        }]))
                    }
                }
                    
                
                
            default:
                return
                
            }
            
        }
    }
}
struct GameSceneView: View {
    
    @Binding var gameView: Bool
    
    var gameScene: SKScene {
        let scene = GameScene()
        scene.size = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        return scene
    }
    
    var body: some View {
        ZStack {
            SpriteView(scene: gameScene)
            VStack {
                HStack {
                    Button(action: {
                        gameView.toggle()
                    }, label: {
                        
                        Text("MENU")
                            .foregroundColor(Color.white)
                            .cornerRadius(15)
                            .font(.custom("Verdana Bold", size: 50))
                        
                        
                        
                    }).padding()
                    Spacer()
                }
                Spacer()
            }
            Spacer()
        }
    }
}

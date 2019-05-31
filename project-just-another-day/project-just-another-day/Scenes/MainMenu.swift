//
//  MainMenu.swift
//  project-just-another-day
//
//  Created by Alex Au on 27/5/19.
//  Copyright © 2019 Group-168. All rights reserved.
//

import Foundation
import SpriteKit

var game = ChoiceController()

class MainMenu: SKScene {
    
    var startButton = SKLabelNode()
    var exitButton = SKLabelNode()
    var mainmenuBg = SKSpriteNode()
    var mainemnuBgFrames: [SKTexture] = []
    
    
    
    override func didMove(to view: SKView) {
        startButton = self.childNode(withName: Button.MENU_START_BUTTON) as! SKLabelNode
        exitButton = self.childNode(withName: Button.MENU_EXIT_BUTTON) as! SKLabelNode
        mainmenuBg = self.childNode(withName: "mainmenuBg") as! SKSpriteNode
        createBackdrop()
        animateBackdrop()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            let touchedLocation = self.atPoint(location)
    
            switch touchedLocation.name {
            case startButton.name:
                switchScene()
            case exitButton.name:
                exit(1)
            default:
                break
            }
        }
    }
    
    func createBackdrop() {
        let mainmenuAtlas = SKTextureAtlas(named: "MainMenuBg")
        var menuFrames: [SKTexture] = []
        
        let noOfFrames = mainmenuAtlas.textureNames.count
        print("\(noOfFrames)")
        for i in 1...noOfFrames {
            let menuTextureNames = "menu\(i)"
            print(i)
            menuFrames.append(mainmenuAtlas.textureNamed(menuTextureNames))
        }
        mainemnuBgFrames = menuFrames
        
        //let firstFrameTxt = mainemnuBgFrames[0]
        //mainmenuBg = SKSpriteNode(texture: firstFrameTxt)
    }
    
    func animateBackdrop() {
        mainmenuBg.run(SKAction.repeatForever(
            SKAction.animate(with: mainemnuBgFrames, timePerFrame: 0.05, resize: false, restore: true)))
    }
    
    func switchScene() {
        if let view = self.view {
            if let preludeScene = SKScene(fileNamed: Scene.SCENARIO_MENU) {
                preludeScene.scaleMode = .aspectFill
                view.presentScene(preludeScene)
            }
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}




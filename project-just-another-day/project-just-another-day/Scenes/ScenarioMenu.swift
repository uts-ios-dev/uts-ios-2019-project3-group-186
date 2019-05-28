//
//  ScenarioMenu.swift
//  project-just-another-day
//
//  Created by Alex Au on 29/5/19.
//  Copyright © 2019 Group-168. All rights reserved.
//

import Foundation
import SpriteKit

class ScenarioMenu: SKScene {
   
    var timeManagement = SKLabelNode()
    var courtesy = SKLabelNode()
    var backButton = SKLabelNode()
    
    override func didMove(to view: SKView) {
        timeManagement = self.childNode(withName: Scenario.TIME_MANAGEMENT) as! SKLabelNode
        courtesy = self.childNode(withName: Scenario.COURTESY) as! SKLabelNode
        backButton = self.childNode(withName: Button.BACK_TO_MAIN_MENU_BUTTON) as! SKLabelNode
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            let touchedLocation = self.atPoint(location)
            
            switch touchedLocation.name {
            case timeManagement.name:
                switchToTimeManagementScenario()
            case courtesy.name:
                switchToCourtesyScenario()
            case backButton.name:
                switchToMainMenuScene()
            default:
                break
            }
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
    
    func switchToTimeManagementScenario() {
        if let view = self.view {
            if let preludeScene = SKScene(fileNamed: Scene.PRELUDE_SCENE) {
                preludeScene.scaleMode = .aspectFill
                view.presentScene(preludeScene)
            }
        }
    }
    
    func switchToCourtesyScenario() {
        if let view = self.view {
            
        }
    }
    
    func switchToMainMenuScene() {
        if let view = self.view {
            if let mainMenuScene = SKScene(fileNamed: Scene.MAIN_MENU) {
                mainMenuScene.scaleMode = .aspectFill
                view.presentScene(mainMenuScene)
            }
        }
    }
}

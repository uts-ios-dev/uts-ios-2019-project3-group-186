//
//  Prelude.swift
//  project-just-another-day
//
//  Created by Alex Au on 27/5/19.
//  Copyright © 2019 Group-168. All rights reserved.
//

import Foundation
import SpriteKit

class Prelude: SKScene { //Scene to introduce the user to the scenario / context
    
    var startButton = SKLabelNode()
    var backButton = SKLabelNode()
    
    override func didMove(to view: SKView) {
        startButton = self.childNode(withName: Button.START_BUTTON) as! SKLabelNode
        backButton = self.childNode(withName: Button.BACK_TO_SCENARIO_MENU_BUTTON) as! SKLabelNode
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            let touchedLocation = self.atPoint(location)
           
            switch touchedLocation.name {
            case startButton.name:
                switchScene()
            case backButton.name:
                switchToScenarioMenuScene()
            default:
                break
            }
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
    
    func switchScene() {
        if let view = self.view {
            if let morningScene = SKScene(fileNamed: Scene.MORNING_SCENE) {
                morningScene.scaleMode = .aspectFill
                view.presentScene(morningScene)
            }
        }
    }
    
    func switchToScenarioMenuScene() {
        if let view = self.view {
            if let scenarioScene = SKScene(fileNamed: Scene.SCENARIO_MENU) {
                scenarioScene.scaleMode = .aspectFill
                view.presentScene(scenarioScene)
            }
        }
    }
}

//
//  Result.swift
//  project-just-another-day
//
//  Created by Alex Au on 27/5/19.
//  Copyright © 2019 Group-168. All rights reserved.
//

import Foundation
import SpriteKit

class Result: SKScene {
    
    var mainMenuButton = SKLabelNode()
    
    override func didMove(to view: SKView) {
        mainMenuButton = self.childNode(withName: Button.MAIN_MENU_BUTTON) as! SKLabelNode
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            let touchedLocation = self.atPoint(location)
            
            switch touchedLocation.name {
            case mainMenuButton.name:
                switchScene()
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
            if let mainMenuScene = SKScene(fileNamed: Scene.MAIN_MENU) {
                mainMenuScene.scaleMode = .aspectFill
                view.presentScene(mainMenuScene)
            }
        }
    }
    
    //have a func that has a switch case where if the user scores within a certain range:
    //e.g. 85 - 100, comment on their good sense of judgement on managing time, etc.. and their circumstances
}

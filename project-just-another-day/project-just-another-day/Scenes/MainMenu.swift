//
//  MainMenu.swift
//  project-just-another-day
//
//  Created by Alex Au on 27/5/19.
//  Copyright © 2019 Group-168. All rights reserved.
//

import Foundation
import SpriteKit

class MainMenu: SKScene {
    
    var title: SKLabelNode!
    var startButton: SKLabelNode!
    var exitButton: SKLabelNode!
    
    override func didMove(to view: SKView) {
       
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            let touchedLocation = self.atPoint(location)
    
            switch touchedLocation.name {
            case Button.MENU_START_BUTTON:
                let preludeScene = Prelude(size: self.size)
                preludeScene.scaleMode = .aspectFit
                self.view?.presentScene(preludeScene)
            case Button.MENU_EXIT_BUTTON:
                exit(1)
            default:
                break
            }
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
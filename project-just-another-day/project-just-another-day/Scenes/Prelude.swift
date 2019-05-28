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
    override func didMove(to view: SKView) {
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            let touchedLocation = self.atPoint(location)
            print("you touched screen in prelude")
            switch touchedLocation.name {
            case Button.START_BUTTON:
                print("you touched start")
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
            if let morningScene = SKScene(fileNamed: "Morning") {
                print("loading morning scene")
                morningScene.scaleMode = .aspectFill
                view.presentScene(morningScene)
            }
        }
    }
}

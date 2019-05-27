//
//  Night.swift
//  project-just-another-day
//
//  Created by Alex Au on 27/5/19.
//  Copyright © 2019 Group-168. All rights reserved.
//

import Foundation
import SpriteKit

class Night: SKScene {
    override func didMove(to view: SKView) {

    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            let touchedLocation = self.atPoint(location)
            
            switch touchedLocation.name {
            case Interactable.BED:
                //do something
                switchScene()
            case Interactable.LAPTOP:
                switchScene()
            case Interactable.NIGHT_PHONE:
                switchScene()
            case Interactable.NIGHT_SNACKS:
                switchScene()
            case Interactable.NIGHT_TEXTBOOK:
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
        let resultScene = Result(fileNamed: Scene.RESULT_SCENE)
        resultScene?.scaleMode = .aspectFit
        self.scene?.view?.presentScene(resultScene)
    }
}

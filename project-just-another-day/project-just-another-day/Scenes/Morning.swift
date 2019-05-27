//
//  Morning.swift
//  project-just-another-day
//
//  Created by Alex Au on 27/5/19.
//  Copyright © 2019 Group-168. All rights reserved.
//

import Foundation
import SpriteKit

class Morning: SKScene { //7am?
    override func didMove(to view: SKView) {

    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            let touchedLocation = self.atPoint(location)
            
            switch touchedLocation.name {
            case Interactable.BACKPACK:
                switchScene()
            case Interactable.MORNING_ALARM:
                switchScene()
            case Interactable.MORNING_PHONE:
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
        let schoolScene = School(fileNamed: Scene.SCHOOL_SCENE)
        schoolScene?.scaleMode = .aspectFit
        self.scene?.view?.presentScene(schoolScene)
    }
}

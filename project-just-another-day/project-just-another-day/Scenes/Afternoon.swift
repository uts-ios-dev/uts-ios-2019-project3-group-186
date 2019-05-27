//
//  Afternoon.swift
//  project-just-another-day
//
//  Created by Alex Au on 27/5/19.
//  Copyright © 2019 Group-168. All rights reserved.
//

import Foundation
import SpriteKit

class Afternoon: SKScene {
    override func didMove(to view: SKView) {
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            let touchedLocation = self.atPoint(location)
            
            switch touchedLocation.name {
            case Interactable.KITCHEN_TABLE:
                //do something
                switchScene()
            case Interactable.LIVING_ROOM_DOOR:
                switchScene()
            case Interactable.LIVING_ROOM_TEXTBOOK:
                switchScene()
            case Interactable.SOFA:
                switchScene()
            case Interactable.SPORT_EQUIPMENT:
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
        let nightScene = Night(fileNamed: Scene.NIGHT_SCENE)
        nightScene?.scaleMode = .aspectFit
        self.scene?.view?.presentScene(nightScene)
    }
}

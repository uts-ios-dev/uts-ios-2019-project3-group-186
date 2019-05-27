//
//  School.swift
//  project-just-another-day
//
//  Created by Alex Au on 27/5/19.
//  Copyright © 2019 Group-168. All rights reserved.
//

import Foundation
import SpriteKit

class School: SKScene {
    override func didMove(to view: SKView) {
    
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            let touchedLocation = self.atPoint(location)
            
            switch touchedLocation.name {
            case Interactable.BLACKBOARD:
                //do something
                switchScene()
            case Interactable.CLASSROOM_DOOR:
                switchScene()
            case Interactable.CLASSROOM_PHONE:
                switchScene()
            case Interactable.CLASSROOM_SNACKS:
                switchScene()
            case Interactable.CLASSROOM_TEXTBOOK:
                switchScene()
            case Interactable.FRIEND:
                switchScene()
            case Interactable.TEACHER:
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
        let afternoonScene = Afternoon(fileNamed: Scene.AFTERNOON_SCENE)
        afternoonScene?.scaleMode = .aspectFit
        self.scene?.view?.presentScene(afternoonScene)
    }
}

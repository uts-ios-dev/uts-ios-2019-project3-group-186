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
    var timeLabel:SKLabelNode = SKLabelNode()
    
    override func didMove(to view: SKView) {
        timeLabel = self.childNode(withName: Label.TIME) as! SKLabelNode
        game.setTimeRaw(time: 1600)
        timeLabel.text = game.getCurrentTime()
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
        if game.getTimeRaw() >= 1830 {
            switchScene()
        }
    }
    
    func switchScene() {
        if let view = self.view {
            if let nightScene = SKScene(fileNamed: Scene.NIGHT_SCENE) {
                nightScene.scaleMode = .aspectFill
                view.presentScene(nightScene)
            }
        }
    }
}

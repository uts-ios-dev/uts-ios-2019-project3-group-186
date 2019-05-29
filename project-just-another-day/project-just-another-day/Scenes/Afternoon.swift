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
                game.updateTime(addMinutes: 20)
            case Interactable.LIVING_ROOM_DOOR:
                game.updateTime(addMinutes: 60)
            case Interactable.LIVING_ROOM_TEXTBOOK:
                game.updateTime(addMinutes: 60)
                //add points 5?
            case Interactable.SOFA:
                game.updateTime(addMinutes: 30)
                //add points 5?
            case Interactable.SPORT_EQUIPMENT:
                game.updateTime(addMinutes: 45)
                //add points 5?
            default:
                break
            }
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        timeLabel.text = game.getCurrentTime()
        if game.getTimeRaw() >= 1830 {
            print("Dinner Time~")
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

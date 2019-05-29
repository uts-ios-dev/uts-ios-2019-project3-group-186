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
    
    var backpack: SKSpriteNode = SKSpriteNode()
    var morningAlarm: SKSpriteNode = SKSpriteNode()
    var morningPhone: SKSpriteNode = SKSpriteNode()
    var timeLabel:SKLabelNode = SKLabelNode()
    
    public var choiceValue = ChoiceValue(points: 0)
    
    override func didMove(to view: SKView) {
        timeLabel = self.childNode(withName: Label.TIME) as! SKLabelNode
        if let backpackNode: SKSpriteNode = self.childNode(withName: Interactable.BACKPACK) as? SKSpriteNode {
            backpack = backpackNode
            self.addChild(backpack)
        }
        
        if let morningAlarmNode: SKSpriteNode = self.childNode(withName: Interactable.MORNING_ALARM) as? SKSpriteNode {
            morningAlarm = morningAlarmNode
            self.addChild(morningAlarm)
        }
        
        if let morningPhoneNode: SKSpriteNode = self.childNode(withName: Interactable.MORNING_PHONE) as? SKSpriteNode {
            morningPhone = morningPhoneNode
            self.addChild(morningPhone)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        game.updateTime(addMinutes: 5)
        timeLabel.text = game.getCurrentTime()
        for touch in touches {
            let location = touch.location(in: self)
            let touchedLocation = self.atPoint(location)
            print(touchedLocation)
            switch touchedLocation.name {
            case Interactable.BACKPACK:
                choiceValue.points += 10
                //the time updates
                //we store what you pressed
                //
                //save the name of what was pressed into an array[0]
                //switchScene()
            case Interactable.MORNING_ALARM:
                //snooze or ignore (timer?)
                choiceValue.points += 5
                switchScene()
            case Interactable.MORNING_PHONE:
                choiceValue.points += 5
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
            if let schoolScene = SKScene(fileNamed: Scene.CLASS_SCENE) {
                schoolScene.scaleMode = .aspectFill
                view.presentScene(schoolScene)
            }
        }
    }
}

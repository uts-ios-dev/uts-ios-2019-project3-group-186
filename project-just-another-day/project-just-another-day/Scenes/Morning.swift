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
    var alarmPopUp: SKSpriteNode = SKSpriteNode()
    var timeLabel:SKLabelNode = SKLabelNode()
    var snooze: SKLabelNode = SKLabelNode()
    var turnAlarmOff: SKLabelNode = SKLabelNode()
    
    public var choiceValue = ChoiceValue(points: 0)
    var alarmOff: Bool = false
    
    override func didMove(to view: SKView) {
        timeLabel = self.childNode(withName: Label.TIME) as! SKLabelNode
        snooze = self.childNode(withName: Alarm.SNOOZE) as! SKLabelNode
        turnAlarmOff = self.childNode(withName: Alarm.TURN_ALARM_OFF) as! SKLabelNode
        
        snooze.isHidden = true
        turnAlarmOff.isHidden = true
        
        game.setTimeRaw(time: 730)
        timeLabel.text = game.getCurrentTime()
        
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
        
        if let alarmPopUpNode: SKSpriteNode = self.childNode(withName: Alarm.CHOICE) as? SKSpriteNode {
            alarmPopUp = alarmPopUpNode
            alarmPopUp.isHidden = true
            self.addChild(alarmPopUp)
        }
        
        if (choiceValue.points == 10) {
            //keep it at 10
            choiceValue.points = 10
        }
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            let touchedLocation = self.atPoint(location)
            print(touchedLocation)
            switch touchedLocation.name {
            case Interactable.BACKPACK:
                game.updateTime(addMinutes: 30)
                choiceValue.points += 5
                //we store what you pressed
                //
            //save the name of what was pressed into an array[0]
            case Interactable.MORNING_ALARM:
                if (!alarmOff) {
                    hideAlarmChoice(false)
                }
            case Interactable.MORNING_PHONE:
                game.updateTime(addMinutes: 30)
                choiceValue.points += 1
            case "snooze":
                game.updateTime(addMinutes: 20)
                hideAlarmChoice(true)
                print("You've decided to snooze the alarm!")
            case "turnAlarmOff":
                hideAlarmChoice(true)
                //stop this from being interactable
                game.updateTime(addMinutes: 10)
                choiceValue.points += 3
                alarmOff = true
                print("You've decided to turn off the alarm!")
            default:
                hideAlarmChoice(true)
                print(choiceValue.points)
                break
            }
        }
    }
    
    func hideAlarmChoice(_ hide : Bool){
        print("hide the alarm choice? ")
        alarmPopUp.isHidden = hide
        snooze.isHidden = hide
        turnAlarmOff.isHidden = hide
    }
    
    override func update(_ currentTime: TimeInterval) {
        timeLabel.text = game.getCurrentTime()
        if game.getTimeRaw() >= 830 {
            // do something
            // maybe something to say it is time for school?
            switchScene()
        }
    }
    
    func switchScene() {
        if let view = self.view {
            if let schoolScene = SKScene(fileNamed: Scene.CLASS_SCENE) {
                schoolScene.scaleMode = .aspectFill
                print(choiceValue.points)
                view.presentScene(schoolScene)
            }
        }
    }
}

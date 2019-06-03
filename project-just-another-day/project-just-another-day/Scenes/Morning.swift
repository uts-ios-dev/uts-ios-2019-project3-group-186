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
    var backpackFrames: [SKTexture] = []
    
    var morningAlarm: SKSpriteNode = SKSpriteNode()
    var morningAlarmFrames: [SKTexture] = []
    
    var alarmPopUp: SKSpriteNode = SKSpriteNode()
    var alarmSnooze: SKLabelNode = SKLabelNode()
    var turnAlarmOff: SKLabelNode = SKLabelNode()
    
    var phonePopUp: SKSpriteNode = SKSpriteNode()
    var phoneSnapchat: SKLabelNode = SKLabelNode()
    var phoneTimetable: SKLabelNode = SKLabelNode()
    
    var phone: SKSpriteNode = SKSpriteNode()
    var phoneFrames: [SKTexture] = []

    var timeLabel:SKLabelNode = SKLabelNode()
    var actionLabel: SKLabelNode = SKLabelNode()
    
    public var snoozeCounter = 0
    var alarmOff: Bool = false
    
    override func didMove(to view: SKView) {
        timeLabel = self.childNode(withName: Label.TIME) as! SKLabelNode
        actionLabel = self.childNode(withName: Label.ACTION) as! SKLabelNode
        alarmSnooze = self.childNode(withName: Alarm.SNOOZE) as! SKLabelNode
        turnAlarmOff = self.childNode(withName: Alarm.TURN_ALARM_OFF) as! SKLabelNode
        phoneSnapchat = self.childNode(withName: Phone.SNAPCHAT) as! SKLabelNode
        phoneTimetable = self.childNode(withName: Phone.CHECK_TIMETABLE) as! SKLabelNode
        
        backpack.isHidden = false
        actionLabel.isHidden = true

        game.setTimeRaw(time: 730)
        timeLabel.text = game.getCurrentTime()
        
        if let backpackNode = self.childNode(withName: Interactable.BACKPACK) as? SKSpriteNode {
            backpack = backpackNode
            SpriteController.createInteractableSpriteAtlas(atlasName: SpriteAtlas.BACKPACK, interactableFrames: &backpackFrames)
            SpriteController.animateInteractable(interactable: backpack, interactableFrames: backpackFrames, timeInterval: 0.025)
       }

        if let morningAlarmNode: SKSpriteNode = self.childNode(withName: Interactable.MORNING_ALARM) as? SKSpriteNode {
            morningAlarm = morningAlarmNode
            SpriteController.createInteractableSpriteAtlas(atlasName: SpriteAtlas.ALARM, interactableFrames: &morningAlarmFrames)
            SpriteController.animateInteractable(interactable: morningAlarm, interactableFrames: morningAlarmFrames, timeInterval: 0.025)
        }
        
        if let phoneNode: SKSpriteNode = self.childNode(withName: Interactable.MORNING_PHONE) as? SKSpriteNode {
            phone = phoneNode
            SpriteController.createInteractableSpriteAtlas(atlasName: SpriteAtlas.PHONE, interactableFrames: &phoneFrames)
            SpriteController.animateInteractable(interactable: phone, interactableFrames: phoneFrames, timeInterval: 0.025)
        }

        if let alarmPopUpNode: SKSpriteNode = self.childNode(withName: Alarm.CHOICE) as? SKSpriteNode {
            alarmPopUp = alarmPopUpNode
            
        }
        game.hideChoice(alarmPopUp, alarmSnooze, turnAlarmOff, true)
        
        if let phonePopUpNode: SKSpriteNode = self.childNode(withName: Phone.CHOICE) as? SKSpriteNode {
            phonePopUp = phonePopUpNode
        }
        game.hideChoice(phonePopUp, phoneTimetable, phoneSnapchat, true)
    }
    
    override func sceneDidLoad() {
        print("lod")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            let touchedLocation = self.atPoint(location)
            print(touchedLocation.name!)
            switch touchedLocation.name {
            case Interactable.BACKPACK:
                game.updateTime(addMinutes: 30)
                game.addPoints(numberOfPoints: 5, sceneNumber: SceneNumber.MORNING, object: Interactable.BACKPACK)
                game.updateAction(actionLabel, message: "You've decided to pack your bag for school! +30 mins")
            case Interactable.MORNING_ALARM:
                if (!alarmOff) { game.hideChoice(alarmPopUp, alarmSnooze, turnAlarmOff, false) }
            case Interactable.MORNING_PHONE:
                game.hideChoice(phonePopUp, phoneTimetable, phoneSnapchat, false)
            case "snapchat":
                game.updateTime(addMinutes: 30)
                game.addPoints(numberOfPoints: 1, sceneNumber: SceneNumber.MORNING, object: Interactable.MORNING_PHONE)
                game.updateAction(actionLabel, message: "You've decided to check Snapchat! +30 mins")
                game.hideChoice(phonePopUp, phoneTimetable, phoneSnapchat, true)
            case "checkTimetable":
                game.updateTime(addMinutes: 30)
                game.addPoints(numberOfPoints: 1, sceneNumber: SceneNumber.MORNING, object: Interactable.MORNING_PHONE)
                game.updateAction(actionLabel, message: "You've decided to check your timetable on your phone! +30 mins")
                game.hideChoice(phonePopUp, phoneTimetable, phoneSnapchat, true)
            case "snooze":
                snoozeCounter = snoozeCounter + 1
                game.updateTime(addMinutes: 25)
                game.hideChoice(alarmPopUp, alarmSnooze, turnAlarmOff, true)
                game.updateAction(actionLabel, message: "You've decided to snooze the alarm! +25 mins")
            case "turnAlarmOff":
                game.hideChoice(phonePopUp, phoneTimetable, phoneSnapchat, true)
                //stop this from being interactable
                game.updateTime(addMinutes: 10)
                game.addPoints(numberOfPoints: 3, sceneNumber: SceneNumber.MORNING, object: Interactable.MORNING_PHONE)
                morningAlarm.removeAllActions()
                game.updateAction(actionLabel, message: "You've decided to turn off the alarm! +10 mins")
                alarmOff = true
          
            default:
                game.hideChoice(alarmPopUp, alarmSnooze, turnAlarmOff, true)
                game.hideChoice(phonePopUp, phoneTimetable, phoneSnapchat, true)
                break
            }
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        timeLabel.text = game.getCurrentTime()
        if snoozeCounter >= 3 {
            game.addFeedback("You have overslept, then you decided to not study.")
            SceneController.shared.switchScene(sceneName: Scene.RESULT_SCENE, sceneView: self)
        }
        else if game.getTimeRaw() >= 830 {
            SceneController.shared.switchScene(sceneName: Scene.CLASS_SCENE, sceneView: self)
        }
    }    
}

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
        phoneSnapchat = self.childNode(withName: "//snapchat") as! SKLabelNode
        phoneTimetable = self.childNode(withName: "//checkTimetable") as! SKLabelNode
        
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
        hideAlarmChoice(true)
        
        if let phonePopUpNode: SKSpriteNode = self.childNode(withName: "phoneChoice") as? SKSpriteNode {
            phonePopUp = phonePopUpNode
        }
        hidePhoneChoice(true)
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
                if (!alarmOff) { hideAlarmChoice(false) }
            case Interactable.MORNING_PHONE:
                hidePhoneChoice(false)
            case "snapchat":
                game.updateTime(addMinutes: 30)
                game.addPoints(numberOfPoints: 1, sceneNumber: SceneNumber.MORNING, object: Interactable.MORNING_PHONE)
                game.updateAction(actionLabel, message: "You've decided to check Snapchat! +30 mins")
                hidePhoneChoice(true)
            case "checkTimetable":
                game.updateTime(addMinutes: 30)
                game.addPoints(numberOfPoints: 1, sceneNumber: SceneNumber.MORNING, object: Interactable.MORNING_PHONE)
                game.updateAction(actionLabel, message: "You've decided to check your timetable on your phone! +30 mins")
                hidePhoneChoice(true)
            case "snooze":
                snoozeCounter = snoozeCounter + 1
                game.updateTime(addMinutes: 25)
                hideAlarmChoice(true)
                game.updateAction(actionLabel, message: "You've decided to snooze the alarm! +25 mins")
            case "turnAlarmOff":
                hideAlarmChoice(true)
                //stop this from being interactable
                game.updateTime(addMinutes: 10)
                game.addPoints(numberOfPoints: 3, sceneNumber: SceneNumber.MORNING, object: Interactable.MORNING_PHONE)
                morningAlarm.removeAllActions()
                game.updateAction(actionLabel, message: "You've decided to turn off the alarm! +10 mins")
                alarmOff = true
          
            default:
                hideAlarmChoice(true)
                hidePhoneChoice(true)
                break
            }
        }
    }
    
    private func hideAlarmChoice(_ hide : Bool){
        alarmPopUp.isHidden = hide
        alarmSnooze.isHidden = hide
        turnAlarmOff.isHidden = hide
    }
    private func hidePhoneChoice(_ hide : Bool ){
        phonePopUp.isHidden = hide
        phoneSnapchat.isHidden = hide
        phoneTimetable.isHidden = hide
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

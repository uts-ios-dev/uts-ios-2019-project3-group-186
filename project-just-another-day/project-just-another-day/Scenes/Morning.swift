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
    var snooze: SKLabelNode = SKLabelNode()
    var turnAlarmOff: SKLabelNode = SKLabelNode()
    
    var phone: SKSpriteNode = SKSpriteNode()
    var phoneFrames: [SKTexture] = []

    var timeLabel:SKLabelNode = SKLabelNode()
    var actionLabel: SKLabelNode = SKLabelNode()
    
    public var snoozeCounter = 0
    var alarmOff: Bool = false
    
    override func didMove(to view: SKView) {
        timeLabel = self.childNode(withName: Label.TIME) as! SKLabelNode
        snooze = self.childNode(withName: Alarm.SNOOZE) as! SKLabelNode
        turnAlarmOff = self.childNode(withName: Alarm.TURN_ALARM_OFF) as! SKLabelNode
        actionLabel = self.childNode(withName: Label.ACTION) as! SKLabelNode
        
        snooze.isHidden = true
        turnAlarmOff.isHidden = true
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
            alarmPopUp.isHidden = true
        }
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
                actionLabel.alpha = 1.0
                actionLabel.text = "You've decided to pack your bag for school! +30 mins"
                actionLabel.isHidden = false
                actionLabel.run(SKAction.fadeOut(withDuration: 1))
            case Interactable.MORNING_ALARM:
                if (!alarmOff) {
                    hideAlarmChoice(false)
                }
            case Interactable.MORNING_PHONE:
                game.updateTime(addMinutes: 30)
                game.addPoints(numberOfPoints: 1, sceneNumber: SceneNumber.MORNING, object: Interactable.MORNING_PHONE)
                actionLabel.alpha = 1.0
                actionLabel.text = "You've decided to check your phone! +30 mins"
                actionLabel.isHidden = false
                actionLabel.run(SKAction.fadeOut(withDuration: 1))
            case "snooze":
                snoozeCounter = +1
                game.updateTime(addMinutes: 25)
                hideAlarmChoice(true)
                
                actionLabel.alpha = 1.0
                actionLabel.text = "You've decided to snooze the alarm! +25 mins"
                actionLabel.isHidden = false
                actionLabel.run(SKAction.fadeOut(withDuration: 1))
                
            case "turnAlarmOff":
                hideAlarmChoice(true)
                //stop this from being interactable
                game.updateTime(addMinutes: 10)
                game.addPoints(numberOfPoints: 3, sceneNumber: SceneNumber.MORNING, object: Interactable.MORNING_PHONE)
                morningAlarm.removeAllActions()
                alarmOff = true
                
                actionLabel.alpha = 1.0
                actionLabel.text = "You've decided to turn off the alarm! +10 mins"
                actionLabel.isHidden = false
                actionLabel.run(SKAction.fadeOut(withDuration: 1))
                
            default:
                hideAlarmChoice(true)
                break
            }
            print(game.getPoints(sceneNumber: SceneNumber.MORNING))
        }
    }
    
    func hideAlarmChoice(_ hide : Bool){
        alarmPopUp.isHidden = hide
        snooze.isHidden = hide
        turnAlarmOff.isHidden = hide
    }
    
    override func update(_ currentTime: TimeInterval) {
        timeLabel.text = game.getCurrentTime()
        if snoozeCounter >= 3{ endgame()}
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
                view.presentScene(schoolScene)
            }
        }
    }
    func endgame(){
        print("you have overslept")
        if let view = self.view {
            if let resultScene = SKScene(fileNamed: Scene.RESULT_SCENE) {
                resultScene.scaleMode = .aspectFill
                view.presentScene(resultScene)
            }
        }
    }
    
}

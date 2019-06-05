//
//  Class.swift
//  project-just-another-day
//
//  Created by Alex Au, Ling Lau (Yuen) and Natassja Sundara on 27/5/19.
//  Copyright © 2019 Group-168. All rights reserved.
//

import Foundation
import SpriteKit

/*This class handles the backend functionality of the Class Scene and the Class.sks file handles the visual elements of the scene
 */
class Class: SKScene {
    
    var blackboard: SKSpriteNode = SKSpriteNode()
    var classroomDoor: SKSpriteNode = SKSpriteNode()
    var classroomPhone: SKSpriteNode = SKSpriteNode()
    var classroomSnacks: SKSpriteNode = SKSpriteNode()
    var classroomTextbook: SKSpriteNode = SKSpriteNode()
    var friend: SKSpriteNode = SKSpriteNode()
    var teacher: SKSpriteNode = SKSpriteNode()
    var teacherFrames: [SKTexture] = []
    var classroomDoorFrames: [SKTexture] = []
    var classroomPhoneFrames: [SKTexture] = []
    var classroomSnacksFrames: [SKTexture] = []
    var classroomTextbookFrames: [SKTexture] = []
    var friendFrames: [SKTexture] = []
    var blackboardFrames: [SKTexture] = []
    var timeLabel: SKLabelNode = SKLabelNode()
    var actionLabel: SKLabelNode = SKLabelNode()
    var hadLunch = false
    
    var doorPopUp: SKSpriteNode = SKSpriteNode()
    var doorToilet: SKLabelNode = SKLabelNode()
    var doorCanteen: SKLabelNode = SKLabelNode()
    
    var phonePopUp: SKSpriteNode = SKSpriteNode()
    var phoneYoutube: SKLabelNode = SKLabelNode()
    var phoneCalculator: SKLabelNode = SKLabelNode()
    
     //This function connects the functionality to the label and interactable nodes created from the Class.sks file and also setup the animation for the interactables
    override func didMove(to view: SKView) {
        timeLabel = self.childNode(withName: Label.TIME) as! SKLabelNode
        actionLabel = self.childNode(withName: Label.ACTION) as! SKLabelNode
        doorToilet = self.childNode(withName: Door.TOILET_BREAK) as! SKLabelNode
        doorCanteen = self.childNode(withName: Door.CANTEEN) as! SKLabelNode
        phoneYoutube = self.childNode(withName: Phone.WATCH_YOUTUBE) as! SKLabelNode
        phoneCalculator = self.childNode(withName: Phone.ONLINE_CALCULATOR) as! SKLabelNode
        actionLabel.isHidden = true
        game.setTimeRaw(time: 900)
     
        if let blackboardNode: SKSpriteNode = self.childNode(withName: Interactable.BLACKBOARD) as? SKSpriteNode {
            blackboard = blackboardNode
            SpriteController.createInteractableSpriteAtlas(atlasName: SpriteAtlas.BLACKBOARD, interactableFrames: &blackboardFrames)
            SpriteController.animateInteractable(interactable: blackboard, interactableFrames: blackboardFrames, timeInterval: 0.25)
        }
        
        if let classroomDoorNode: SKSpriteNode = self.childNode(withName: Interactable.CLASSROOM_DOOR) as? SKSpriteNode {
            classroomDoor = classroomDoorNode
            SpriteController.createInteractableSpriteAtlas(atlasName: SpriteAtlas.CLASSROOM_DOOR, interactableFrames: &classroomDoorFrames)
             SpriteController.animateInteractable(interactable: classroomDoor, interactableFrames: classroomDoorFrames, timeInterval: 0.25)
        }
        
        if let classroomPhoneNode: SKSpriteNode = self.childNode(withName: Interactable.CLASSROOM_PHONE) as? SKSpriteNode {
            classroomPhone = classroomPhoneNode
             SpriteController.createInteractableSpriteAtlas(atlasName: SpriteAtlas.PHONE, interactableFrames: &classroomPhoneFrames)
             SpriteController.animateInteractable(interactable: classroomPhone, interactableFrames: classroomPhoneFrames, timeInterval: 0.25)
        }
        
        if let classroomSnacksNode: SKSpriteNode = self.childNode(withName: Interactable.CLASSROOM_SNACKS) as? SKSpriteNode {
            classroomSnacks = classroomSnacksNode
             SpriteController.createInteractableSpriteAtlas(atlasName: SpriteAtlas.CLASSROOM_SNACKS, interactableFrames: &classroomSnacksFrames)
             SpriteController.animateInteractable(interactable: classroomSnacks, interactableFrames: classroomSnacksFrames, timeInterval: 0.25)
        }
        
        
        if let classroomTextbookNode: SKSpriteNode = self.childNode(withName: Interactable.CLASSROOM_TEXTBOOK) as? SKSpriteNode {
            classroomTextbook = classroomTextbookNode
             SpriteController.createInteractableSpriteAtlas(atlasName: SpriteAtlas.CLASSROOM_TEXTBOOK, interactableFrames: &classroomTextbookFrames)
            SpriteController.animateInteractable(interactable: classroomTextbook, interactableFrames: classroomTextbookFrames, timeInterval: 0.25)
        }
        
        if let friendNode: SKSpriteNode = self.childNode(withName: Interactable.FRIEND) as? SKSpriteNode {
            friend = friendNode
             SpriteController.createInteractableSpriteAtlas(atlasName: SpriteAtlas.FRIEND, interactableFrames: &friendFrames)
             SpriteController.animateInteractable(interactable: friend, interactableFrames: friendFrames, timeInterval: 0.25)
        }
        
        if let teacherNode: SKSpriteNode = self.childNode(withName: Interactable.TEACHER) as? SKSpriteNode {
            teacher = teacherNode
             SpriteController.createInteractableSpriteAtlas(atlasName: SpriteAtlas.TEACHER, interactableFrames: &teacherFrames)
             SpriteController.animateInteractable(interactable: teacher, interactableFrames: teacherFrames, timeInterval: 0.25)
        }
        
        if let doorPopUpNode: SKSpriteNode = self.childNode(withName: Door.CHOICE) as? SKSpriteNode {
            doorPopUp = doorPopUpNode
        }
        if let phonePopUpNode: SKSpriteNode = self.childNode(withName: Phone.CHOICE) as? SKSpriteNode {
            phonePopUp = phonePopUpNode
        }
        game.hideChoice(doorPopUp, doorCanteen, doorToilet, true)
        game.hideChoice(phonePopUp, phoneCalculator, phoneYoutube, true)
    }
    //This function handles the touch events when the user touches on an interactable
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            let touchedLocation = self.atPoint(location)
            
            switch touchedLocation.name {
            case Interactable.BLACKBOARD:
                game.updateTime(addMinutes: 100)
                game.addPoints(numberOfPoints: 15, sceneNumber: SceneNumber.CLASS, object: Interactable.BLACKBOARD)
                game.updateAction(actionLabel, message: "You've decided to copy exam notes from the blackboard! +100 mins")
                AudioController.shared.playAudio(audioName: AudioNams.ButtonNm)
            case Interactable.CLASSROOM_DOOR:
                game.hideChoice(doorPopUp, doorCanteen, doorToilet, false)
                AudioController.shared.playAudio(audioName: AudioNams.ButtonNm)
            case "toiletBreak":
                game.updateTime(addMinutes: 35)
                game.addPoints(numberOfPoints: 5, sceneNumber: SceneNumber.CLASS, object: Interactable.CLASSROOM_DOOR)
                  game.updateAction(actionLabel, message: "You've decided to go outside for a toilet break! + 35 mins")
                game.hideChoice(doorPopUp, doorCanteen, doorToilet, true)
                AudioController.shared.playAudio(audioName: AudioNams.ButtonNm)
            case "goCanteen":
                game.updateTime(addMinutes: 35)
                game.addPoints(numberOfPoints: 5, sceneNumber: SceneNumber.CLASS, object: Interactable.CLASSROOM_DOOR)
                game.updateAction(actionLabel, message: "You've decided to go outside for a snack break! + 35 mins")
                game.hideChoice(doorPopUp, doorCanteen, doorToilet, true)
                AudioController.shared.playAudio(audioName: AudioNams.ButtonNm)
            case Interactable.CLASSROOM_PHONE:
                game.hideChoice(phonePopUp, phoneCalculator, phoneYoutube, false)
                AudioController.shared.playAudio(audioName: AudioNams.ButtonNm)
            case "watchYoutube":
                game.updateTime(addMinutes: 20)
                game.updateAction(actionLabel, message: "You've decided to watch Youtube during class! +20 mins")
                game.hideChoice(phonePopUp, phoneCalculator, phoneYoutube, true)
                AudioController.shared.playAudio(audioName: AudioNams.ButtonNm)
            case "onlineCalculator":
                game.updateTime(addMinutes: 20)
                game.addPoints(numberOfPoints: 3, sceneNumber: SceneNumber.CLASS, object: Interactable.CLASSROOM_PHONE)
                game.updateAction(actionLabel, message: "You've decided to use your phone calculator! +20 mins")
                game.hideChoice(phonePopUp, phoneCalculator, phoneYoutube, true)
                AudioController.shared.playAudio(audioName: AudioNams.ButtonNm)
            case Interactable.CLASSROOM_SNACKS:
                game.updateTime(addMinutes: 25)
                game.addPoints(numberOfPoints: 1, sceneNumber: SceneNumber.CLASS, object: Interactable.CLASSROOM_SNACKS)
                game.updateAction(actionLabel, message: "You've decided to eat your snacks during class! +25 mins")
                AudioController.shared.playAudio(audioName: AudioNams.ButtonNm)
            case Interactable.CLASSROOM_TEXTBOOK:
                game.updateTime(addMinutes: 100)
                game.addPoints(numberOfPoints: 15, sceneNumber: SceneNumber.CLASS, object: Interactable.CLASSROOM_TEXTBOOK)
                game.updateAction(actionLabel, message: "You've decided to read from your textbook! +25 mins")
                AudioController.shared.playAudio(audioName: AudioNams.ButtonNm)
            case Interactable.FRIEND:
                game.updateTime(addMinutes: 100)
                game.addPoints(numberOfPoints: 3, sceneNumber: SceneNumber.CLASS, object: Interactable.FRIEND)
                game.updateAction(actionLabel, message: "You've decided to play Pokemon Go with your friend! +100 mins")
                AudioController.shared.playAudio(audioName: AudioNams.ButtonNm)
            case Interactable.TEACHER:
                game.updateTime(addMinutes: 100)
                game.addPoints(numberOfPoints: 15, sceneNumber: SceneNumber.CLASS, object: Interactable.TEACHER)
                game.updateAction(actionLabel, message: "You've decided to ask the teacher for exam tips! +100 mins")
                AudioController.shared.playAudio(audioName: AudioNams.ButtonNm)
            default:
                game.hideChoice(doorPopUp, doorCanteen, doorToilet, true)
                game.hideChoice(phonePopUp, phoneCalculator, phoneYoutube, true)
                AudioController.shared.playAudio(audioName: AudioNams.ButtonNm)
                break
            }
        }
    }
    //This function runs every frame of the game and updates the scene time and checks if the time reaches the time limit switch to the Afternoon scene
    override func update(_ currentTime: TimeInterval) {
        timeLabel.text = game.getCurrentTime()
        if game.getTimeRaw() >= 1500 {
            SceneController.shared.switchScene(sceneName: Scene.AFTERNOON_SCENE, sceneView: self)
            print("school finished")
        }
    }

}

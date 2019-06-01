//
//  Class.swift
//  project-just-another-day
//
//  Created by Alex Au on 27/5/19.
//  Copyright © 2019 Group-168. All rights reserved.
//

import Foundation
import SpriteKit

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
    var timeLabel:SKLabelNode = SKLabelNode()
    var hadLunch = false
    
    override func didMove(to view: SKView) {
        timeLabel = self.childNode(withName: Label.TIME) as! SKLabelNode
        game.setTimeRaw(time: 900)
     

        if let blackboardNode: SKSpriteNode = self.childNode(withName: Interactable.BLACKBOARD) as? SKSpriteNode {
            blackboard = blackboardNode
        }
        
        if let classroomDoorNode: SKSpriteNode = self.childNode(withName: Interactable.CLASSROOM_DOOR) as? SKSpriteNode {
            classroomDoor = classroomDoorNode
            SpriteController.createInteractableSpriteAtlas(atlasName: SpriteAtlas.CLASSROOM_DOOR, interactableFrames: &classroomDoorFrames)
             SpriteController.animateInteractable(interactable: classroomDoor, interactableFrames: classroomDoorFrames, timeInterval: 0.025)
        }
        
        
        if let classroomPhoneNode: SKSpriteNode = self.childNode(withName: Interactable.CLASSROOM_PHONE) as? SKSpriteNode {
            classroomPhone = classroomPhoneNode
             SpriteController.createInteractableSpriteAtlas(atlasName: SpriteAtlas.PHONE, interactableFrames: &classroomPhoneFrames)
             SpriteController.animateInteractable(interactable: classroomPhone, interactableFrames: classroomPhoneFrames, timeInterval: 0.025)
        }
        
        
        if let classroomSnacksNode: SKSpriteNode = self.childNode(withName: Interactable.CLASSROOM_SNACKS) as? SKSpriteNode {
            classroomSnacks = classroomSnacksNode
             SpriteController.createInteractableSpriteAtlas(atlasName: SpriteAtlas.CLASSROOM_SNACKS, interactableFrames: &classroomSnacksFrames)
             SpriteController.animateInteractable(interactable: classroomSnacks, interactableFrames: classroomSnacksFrames, timeInterval: 0.025)
        }
        
        
        if let classroomTextbookNode: SKSpriteNode = self.childNode(withName: Interactable.CLASSROOM_TEXTBOOK) as? SKSpriteNode {
            classroomTextbook = classroomTextbookNode
             SpriteController.createInteractableSpriteAtlas(atlasName: SpriteAtlas.CLASSROOM_TEXTBOOK, interactableFrames: &classroomTextbookFrames)
            SpriteController.animateInteractable(interactable: classroomTextbook, interactableFrames: classroomTextbookFrames, timeInterval: 0.025)
        }
        
        if let friendNode: SKSpriteNode = self.childNode(withName: Interactable.FRIEND) as? SKSpriteNode {
            friend = friendNode
             SpriteController.createInteractableSpriteAtlas(atlasName: SpriteAtlas.FRIEND, interactableFrames: &friendFrames)
             SpriteController.animateInteractable(interactable: friend, interactableFrames: friendFrames, timeInterval: 0.025)
        }
        
        if let teacherNode: SKSpriteNode = self.childNode(withName: Interactable.TEACHER) as? SKSpriteNode {
            teacher = teacherNode
             SpriteController.createInteractableSpriteAtlas(atlasName: SpriteAtlas.TEACHER, interactableFrames: &teacherFrames)
             SpriteController.animateInteractable(interactable: teacher, interactableFrames: teacherFrames, timeInterval: 0.025)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            let touchedLocation = self.atPoint(location)
            
            switch touchedLocation.name {
            case Interactable.BLACKBOARD:
                game.updateTime(addMinutes: 100)
                // add points
            case Interactable.CLASSROOM_DOOR:
                game.updateTime(addMinutes: 35)
            case Interactable.CLASSROOM_PHONE:
                game.updateTime(addMinutes: 20)
            case Interactable.CLASSROOM_SNACKS:
                game.updateTime(addMinutes: 25)
            case Interactable.CLASSROOM_TEXTBOOK:
                game.updateTime(addMinutes: 100)
                // add points
            case Interactable.FRIEND:
                game.updateTime(addMinutes: 100)
            case Interactable.TEACHER:
                game.updateTime(addMinutes: 100)
                // add points
            default:
                break
            }
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        timeLabel.text = game.getCurrentTime()
        if (!hadLunch && game.getTimeRaw() >= 1200){
            //lunch time~
            game.updateTime(addMinutes: 60)
            hadLunch = true
            print("lunch time")
        }
        
        if game.getTimeRaw() >= 1500 {
            // TODO
            // tranisition to afterschool?
            switchScene()
            print("school finished")
        }
    }
    
    func switchScene() {
        if let view = self.view {
            if let afternoonScene = SKScene(fileNamed: Scene.AFTERNOON_SCENE) {
                afternoonScene.scaleMode = .aspectFill
                view.presentScene(afternoonScene)
            }
        }
    }
}

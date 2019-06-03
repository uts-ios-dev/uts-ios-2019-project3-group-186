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
    var blackboardFrames: [SKTexture] = []
    var timeLabel: SKLabelNode = SKLabelNode()
    var actionLabel: SKLabelNode = SKLabelNode()
    var hadLunch = false
    
    override func didMove(to view: SKView) {
        timeLabel = self.childNode(withName: Label.TIME) as! SKLabelNode
        actionLabel = self.childNode(withName: Label.ACTION) as! SKLabelNode
        
        actionLabel.isHidden = true
        
        game.setTimeRaw(time: 900)
     

        if let blackboardNode: SKSpriteNode = self.childNode(withName: Interactable.BLACKBOARD) as? SKSpriteNode {
            blackboard = blackboardNode
            SpriteController.createInteractableSpriteAtlas(atlasName: SpriteAtlas.BLACKBOARD, interactableFrames: &blackboardFrames)
            SpriteController.animateInteractable(interactable: blackboard, interactableFrames: blackboardFrames, timeInterval: 0.025)
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
                game.addPoints(numberOfPoints: 15, sceneNumber: SceneNumber.CLASS, object: Interactable.BLACKBOARD)
                
                actionLabel.alpha = 1.0
                actionLabel.text = "You've decided to copy exam notes from the blackboard! +100 mins"
                actionLabel.isHidden = false
                actionLabel.run(SKAction.fadeOut(withDuration: 4))
                
            case Interactable.CLASSROOM_DOOR:
                game.updateTime(addMinutes: 35)
                game.addPoints(numberOfPoints: 5, sceneNumber: SceneNumber.CLASS, object: Interactable.CLASSROOM_DOOR)
                
                actionLabel.alpha = 1.0
                actionLabel.text = "You've decided to go outside for a toilet break! + 35 mins"
                actionLabel.isHidden = false
                actionLabel.run(SKAction.fadeOut(withDuration: 4))
                
            case Interactable.CLASSROOM_PHONE:
                game.updateTime(addMinutes: 20)
                game.addPoints(numberOfPoints: 1, sceneNumber: SceneNumber.CLASS, object: Interactable.CLASSROOM_PHONE)
                
                actionLabel.alpha = 1.0
                actionLabel.text = "You've decided to play on your phone during class! +20 mins"
                actionLabel.isHidden = false
                actionLabel.run(SKAction.fadeOut(withDuration: 4))
                
            case Interactable.CLASSROOM_SNACKS:
                game.updateTime(addMinutes: 25)
                game.addPoints(numberOfPoints: 1, sceneNumber: SceneNumber.CLASS, object: Interactable.CLASSROOM_SNACKS)
                
                actionLabel.alpha = 1.0
                actionLabel.text = "You've decided to eat your snacks during class! +25 mins"
                actionLabel.isHidden = false
                actionLabel.run(SKAction.fadeOut(withDuration: 4))
                
            case Interactable.CLASSROOM_TEXTBOOK:
                game.updateTime(addMinutes: 100)
                game.addPoints(numberOfPoints: 15, sceneNumber: SceneNumber.CLASS, object: Interactable.CLASSROOM_TEXTBOOK)
                
                actionLabel.alpha = 1.0
                actionLabel.text = "You've decided to read from your textbook! +25 mins"
                actionLabel.isHidden = false
                actionLabel.run(SKAction.fadeOut(withDuration: 4))
                // add points
            case Interactable.FRIEND:
                game.updateTime(addMinutes: 100)
                game.addPoints(numberOfPoints: 3, sceneNumber: SceneNumber.CLASS, object: Interactable.FRIEND)
                
                actionLabel.alpha = 1.0
                actionLabel.text = "You've decided to play Pokemon Go with your friend! +100 mins"
                actionLabel.isHidden = false
                actionLabel.run(SKAction.fadeOut(withDuration: 4))
            case Interactable.TEACHER:
                game.updateTime(addMinutes: 100)
                game.addPoints(numberOfPoints: 15, sceneNumber: SceneNumber.CLASS, object: Interactable.TEACHER)
                
                actionLabel.alpha = 1.0
                actionLabel.text = "You've decided to ask the teacher for exam tips! +100 mins"
                actionLabel.isHidden = false
                actionLabel.run(SKAction.fadeOut(withDuration: 4))
                // add points
            default:
                break
            }
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        timeLabel.text = game.getCurrentTime()
//        if (!hadLunch && game.getTimeRaw() >= 1200){
//            //lunch time~
//            game.updateTime(addMinutes: 60)
//            hadLunch = true
//            print("lunch time")
//        }
        
        if game.getTimeRaw() >= 1500 {
            // TODO
            // tranisition to afterschool?
            //switchScene()
            SceneController.shared.switchScene(sceneName: Scene.AFTERNOON_SCENE)
            print("school finished")
        }
    }
    
//    func switchScene() {
//        print("Score for Class Scene = " + String(game.getPoints(sceneNumber: SceneNumber.CLASS)))
//        if let view = self.view {
//            if let afternoonScene = SKScene(fileNamed: Scene.AFTERNOON_SCENE) {
//                afternoonScene.scaleMode = .aspectFill
//                view.presentScene(afternoonScene, transition: SKTransition.crossFade(withDuration: 0.5))
//            }
//        }
//    }
}

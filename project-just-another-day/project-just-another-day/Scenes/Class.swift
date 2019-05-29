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
    var timeLabel:SKLabelNode = SKLabelNode()
    var hadLunch = false
    
    override func didMove(to view: SKView) {
        timeLabel = self.childNode(withName: Label.TIME) as! SKLabelNode
        game.setTimeRaw(time: 900)
        

        if let blackboardNode: SKSpriteNode = self.childNode(withName: Interactable.BLACKBOARD) as? SKSpriteNode {
            blackboard = blackboardNode
            self.addChild(blackboard)
        }
        
        if let classroomDoorNode: SKSpriteNode = self.childNode(withName: Interactable.CLASSROOM_DOOR) as? SKSpriteNode {
            classroomDoor = classroomDoorNode
            self.addChild(classroomDoor)
        }
        
        
        if let classroomPhoneNode: SKSpriteNode = self.childNode(withName: Interactable.CLASSROOM_PHONE) as? SKSpriteNode {
            classroomPhone = classroomPhoneNode
            self.addChild(classroomPhone)
        }
        
        
        if let classroomSnacksNode: SKSpriteNode = self.childNode(withName: Interactable.CLASSROOM_SNACKS) as? SKSpriteNode {
            classroomSnacks = classroomSnacksNode
            self.addChild(classroomSnacks)
        }
        
        
        if let classroomTextbookNode: SKSpriteNode = self.childNode(withName: Interactable.CLASSROOM_TEXTBOOK) as? SKSpriteNode {
            classroomTextbook = classroomTextbookNode
            self.addChild(classroomTextbook)
        }
        
        if let friendNode: SKSpriteNode = self.childNode(withName: Interactable.FRIEND) as? SKSpriteNode {
            friend = friendNode
            self.addChild(friend)
        }
        
        if let teacherNode: SKSpriteNode = self.childNode(withName: Interactable.TEACHER) as? SKSpriteNode {
            teacher = teacherNode
            self.addChild(teacher)
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
                game.updateTime(addMinutes: 20)
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

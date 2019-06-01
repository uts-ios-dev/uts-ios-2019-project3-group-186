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
    
    var basketball: SKSpriteNode = SKSpriteNode()
    var basketballFrames: [SKTexture] = []
    var sofa: SKSpriteNode = SKSpriteNode()
    var sofaFrames: [SKTexture] = []
    var food: SKSpriteNode = SKSpriteNode()
    var foodFrames: [SKTexture] = []
    var frontDoor: SKSpriteNode = SKSpriteNode()
    var frontDoorFrames: [SKTexture] = []
    var television: SKSpriteNode = SKSpriteNode()
    var televisionFrames: [SKTexture] = []
    var textbook: SKSpriteNode = SKSpriteNode()
    var textbookFrames: [SKTexture] = []
    
    var timeLabel:SKLabelNode = SKLabelNode()
    
    override func didMove(to view: SKView) {
        timeLabel = self.childNode(withName: Label.TIME) as! SKLabelNode
        game.setTimeRaw(time: 1600)
        timeLabel.text = game.getCurrentTime()
        
        if let basketballNode = self.childNode(withName: Interactable.SPORT_EQUIPMENT) as? SKSpriteNode {
            basketball = basketballNode
            SpriteController.createInteractableSpriteAtlas(atlasName: SpriteAtlas.BASKETBALL, interactableFrames: &basketballFrames)
            SpriteController.animateInteractable(interactable: basketball, interactableFrames:basketballFrames, timeInterval: 0.0025)
        }
        
        if let sofaNode = self.childNode(withName: Interactable.SOFA) as? SKSpriteNode {
            sofa = sofaNode
            SpriteController.createInteractableSpriteAtlas(atlasName: SpriteAtlas.SOFA, interactableFrames: &sofaFrames)
            SpriteController.animateInteractable(interactable: sofa, interactableFrames:sofaFrames, timeInterval: 0.0025)
        }
        
        if let foodNode = self.childNode(withName: Interactable.KITCHEN_TABLE) as? SKSpriteNode {
            food = foodNode
            SpriteController.createInteractableSpriteAtlas(atlasName: SpriteAtlas.FOOD, interactableFrames: &foodFrames)
            SpriteController.animateInteractable(interactable: food, interactableFrames:foodFrames, timeInterval: 0.0025)
        }
        
        if let frontDoorNode = self.childNode(withName: Interactable.LIVING_ROOM_DOOR) as? SKSpriteNode {
            frontDoor = frontDoorNode
            SpriteController.createInteractableSpriteAtlas(atlasName: SpriteAtlas.FRONT_DOOR, interactableFrames: &frontDoorFrames)
            SpriteController.animateInteractable(interactable: frontDoor, interactableFrames:frontDoorFrames, timeInterval: 0.0025)
        }
        
        if let televisionNode = self.childNode(withName: Interactable.LIVING_ROOM_TEXTBOOK) as? SKSpriteNode {
            television = televisionNode
        }
        
        if let textbookNode = self.childNode(withName: Interactable.LIVING_ROOM_TEXTBOOK) as? SKSpriteNode {
            textbook = textbookNode
            SpriteController.createInteractableSpriteAtlas(atlasName: SpriteAtlas.CLASSROOM_TEXTBOOK, interactableFrames: &textbookFrames)
            SpriteController.animateInteractable(interactable: textbook, interactableFrames:textbookFrames, timeInterval: 0.0025)
        }
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            let touchedLocation = self.atPoint(location)
            switch touchedLocation.name {
            case Interactable.KITCHEN_TABLE:
                game.updateTime(addMinutes: 20)
                game.addPoints(numberOfPoints: 1, sceneNumber: SceneNumber.AFTERNOON, object: Interactable.KITCHEN_TABLE)
            case Interactable.LIVING_ROOM_DOOR:
                game.updateTime(addMinutes: 60)
                game.addPoints(numberOfPoints: 2, sceneNumber: SceneNumber.AFTERNOON, object: Interactable.LIVING_ROOM_DOOR)
            case Interactable.LIVING_ROOM_TEXTBOOK:
                game.updateTime(addMinutes: 60)
                game.addPoints(numberOfPoints: 3, sceneNumber: SceneNumber.AFTERNOON, object: Interactable.LIVING_ROOM_TEXTBOOK)
            case Interactable.SOFA:
                game.updateTime(addMinutes: 30)
                game.addPoints(numberOfPoints: 2, sceneNumber: SceneNumber.AFTERNOON, object: Interactable.SOFA)
            case Interactable.SPORT_EQUIPMENT:
                game.updateTime(addMinutes: 90)
                game.addPoints(numberOfPoints: 4, sceneNumber: SceneNumber.AFTERNOON, object: Interactable.SPORT_EQUIPMENT)
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
        print("Score for afternoon Scene= " + String(game.getPoints(sceneNumber: SceneNumber.AFTERNOON)))
        if let view = self.view {
            if let nightScene = SKScene(fileNamed: Scene.NIGHT_SCENE) {
                nightScene.scaleMode = .aspectFill
                view.presentScene(nightScene)
            }
        }
    }
}

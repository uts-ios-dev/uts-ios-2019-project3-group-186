//
//  Afternoon.swift
//  project-just-another-day
//
//  Created by Alex Au, Ling Lau (Yuen) and Natassja Sundara on 27/5/19.
//  Copyright © 2019 Group-168. All rights reserved.
//

import Foundation
import SpriteKit

/*This class handles the backend functionality of the Afternoon Scene and the Afternoon.sks file handles the visual elements of the scene
 */
class Afternoon: SKScene {
    
    var basketball: SKSpriteNode = SKSpriteNode()
    var sofa: SKSpriteNode = SKSpriteNode()
    var food: SKSpriteNode = SKSpriteNode()
    var frontDoor: SKSpriteNode = SKSpriteNode()
    var television: SKSpriteNode = SKSpriteNode()
    var textbook: SKSpriteNode = SKSpriteNode()
   
    var basketballFrames: [SKTexture] = []
    var sofaFrames: [SKTexture] = []
    var foodFrames: [SKTexture] = []
    var frontDoorFrames: [SKTexture] = []
    var televisionFrames: [SKTexture] = []
    var textbookFrames: [SKTexture] = []
    
    var timeLabel: SKLabelNode = SKLabelNode()
    var actionLabel: SKLabelNode = SKLabelNode()
    
    var doorPopUp: SKSpriteNode = SKSpriteNode()
    var maccasRun: SKLabelNode = SKLabelNode()
    var hangout: SKLabelNode = SKLabelNode()
    
    var sofaPopUp: SKSpriteNode = SKSpriteNode()
    var nap: SKLabelNode = SKLabelNode()
    var sleep: SKLabelNode = SKLabelNode()
    
     //This function connects the functionality to the label and interactable nodes created from the Afternoon.sks file and also setup the animation for the interactables
    override func didMove(to view: SKView) {
        timeLabel = self.childNode(withName: Label.TIME) as! SKLabelNode
        actionLabel = self.childNode(withName: Label.ACTION) as! SKLabelNode
        maccasRun = self.childNode(withName: Door.MACCAS_RUN) as! SKLabelNode
        hangout = self.childNode(withName: Door.HANGOUT) as! SKLabelNode
        nap = self.childNode(withName: Sofa.NAP) as! SKLabelNode
        sleep = self.childNode(withName: Sofa.SLEEP) as! SKLabelNode
        
        game.setTimeRaw(time: 1600)
        timeLabel.text = game.getCurrentTime()
        actionLabel.isHidden = true
        
        if let basketballNode = self.childNode(withName: Interactable.SPORT_EQUIPMENT) as? SKSpriteNode {
            basketball = basketballNode
            SpriteController.createInteractableSpriteAtlas(atlasName: SpriteAtlas.BASKETBALL, interactableFrames: &basketballFrames)
            SpriteController.animateInteractable(interactable: basketball, interactableFrames:basketballFrames, timeInterval: 0.25)
        }
        
        if let sofaNode = self.childNode(withName: Interactable.SOFA) as? SKSpriteNode {
            sofa = sofaNode
            SpriteController.createInteractableSpriteAtlas(atlasName: SpriteAtlas.SOFA, interactableFrames: &sofaFrames)
            SpriteController.animateInteractable(interactable: sofa, interactableFrames:sofaFrames, timeInterval: 0.25)
        }
        
        if let foodNode = self.childNode(withName: Interactable.KITCHEN_TABLE) as? SKSpriteNode {
            food = foodNode
            SpriteController.createInteractableSpriteAtlas(atlasName: SpriteAtlas.FOOD, interactableFrames: &foodFrames)
            SpriteController.animateInteractable(interactable: food, interactableFrames:foodFrames, timeInterval: 0.25)
        }
        
        if let frontDoorNode = self.childNode(withName: Interactable.LIVING_ROOM_DOOR) as? SKSpriteNode {
            frontDoor = frontDoorNode
            SpriteController.createInteractableSpriteAtlas(atlasName: SpriteAtlas.FRONT_DOOR, interactableFrames: &frontDoorFrames)
            SpriteController.animateInteractable(interactable: frontDoor, interactableFrames:frontDoorFrames, timeInterval: 0.25)
        }
        
        if let televisionNode = self.childNode(withName: Interactable.LIVING_ROOM_TEXTBOOK) as? SKSpriteNode {
            television = televisionNode
        }
        
        if let textbookNode = self.childNode(withName: Interactable.LIVING_ROOM_TEXTBOOK) as? SKSpriteNode {
            textbook = textbookNode
            SpriteController.createInteractableSpriteAtlas(atlasName: SpriteAtlas.CLASSROOM_TEXTBOOK, interactableFrames: &textbookFrames)
            SpriteController.animateInteractable(interactable: textbook, interactableFrames:textbookFrames, timeInterval: 0.25)
        }
        
        if let doorChoiceNode = self.childNode(withName: Door.CHOICE) as? SKSpriteNode {
            doorPopUp = doorChoiceNode
        }
        
        if let sofaChoiceNode = self.childNode(withName: Sofa.CHOICE) as? SKSpriteNode {
            sofaPopUp = sofaChoiceNode
        }

        game.hideChoice(doorPopUp, maccasRun, hangout, true)
        game.hideChoice(sofaPopUp, nap, sleep, true)
    }
    
    //This function handles the touch events when the user touches on an interactable
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            let touchedLocation = self.atPoint(location)
            switch touchedLocation.name {
            case Interactable.KITCHEN_TABLE:
                game.updateTime(addMinutes: 20)
                game.addPoints(numberOfPoints: 1, sceneNumber: SceneNumber.AFTERNOON, object: Interactable.KITCHEN_TABLE)
                game.updateAction(actionLabel, message: "You've decided to grab some food! +20 mins")
                AudioController.shared.playAudio(audioName: AudioNams.ButtonNm)
            case Interactable.LIVING_ROOM_DOOR:
                game.hideChoice(doorPopUp, maccasRun, hangout, false)
                AudioController.shared.playAudio(audioName: AudioNams.ButtonNm)
            case Interactable.LIVING_ROOM_TEXTBOOK:
                game.updateTime(addMinutes: 60)
                game.addPoints(numberOfPoints: 3, sceneNumber: SceneNumber.AFTERNOON, object: Interactable.LIVING_ROOM_TEXTBOOK)
                game.updateAction(actionLabel, message: "You've decided to read your textbook! +60 mins")
                AudioController.shared.playAudio(audioName: AudioNams.ButtonNm)
            case Interactable.SOFA:
                 game.hideChoice(sofaPopUp, nap, sleep, false)
                 AudioController.shared.playAudio(audioName: AudioNams.ButtonNm)
            case Interactable.SPORT_EQUIPMENT:
                game.updateTime(addMinutes: 90)
                game.addPoints(numberOfPoints: 4, sceneNumber: SceneNumber.AFTERNOON, object: Interactable.SPORT_EQUIPMENT)
                game.updateAction(actionLabel, message: "You've decided to go and shoot some hoops! +90 mins")
                AudioController.shared.playAudio(audioName: AudioNams.ButtonNm)
            case "maccasRun":
                game.updateTime(addMinutes: 60)
                game.updateAction(actionLabel, message: "You've decided to go for a Maccas run! +60 mins")
                game.hideChoice(doorPopUp, maccasRun, hangout, true)
                AudioController.shared.playAudio(audioName: AudioNams.ButtonNm)
            case "hangout":
                game.updateTime(addMinutes: 60)
                game.updateAction(actionLabel, message: "You've decided to hangout with your friends! +60 mins")
                game.hideChoice(doorPopUp, maccasRun, hangout, true)
                AudioController.shared.playAudio(audioName: AudioNams.ButtonNm)
            case "nap":
                game.updateTime(addMinutes: 30)
                game.addPoints(numberOfPoints: 2, sceneNumber: SceneNumber.AFTERNOON, object: Interactable.SOFA)
                game.updateAction(actionLabel, message: "You've decided to take a nap! +30 mins")
                game.hideChoice(sofaPopUp, nap, sleep, true)
                AudioController.shared.playAudio(audioName: AudioNams.ButtonNm)
            case "sleep":
                SceneController.shared.switchScene(sceneName: Scene.NIGHT_SCENE, sceneView: self)
                game.hideChoice(sofaPopUp, nap, sleep, true)
                AudioController.shared.playAudio(audioName: AudioNams.ButtonNm)
            default:
                game.hideChoice(doorPopUp, maccasRun, hangout, true)
                game.hideChoice(sofaPopUp, nap, sleep, true)
            }
        }
    }
    //This function runs every frame of the game and updates the scene time and checks if the time reaches the time limit switch to the Night scene
    override func update(_ currentTime: TimeInterval) {
        timeLabel.text = game.getCurrentTime()
        if game.getTimeRaw() >= 1830 {
            print("Dinner Time~")
            SceneController.shared.switchScene(sceneName: Scene.NIGHT_SCENE, sceneView: self)
        }
    }
}

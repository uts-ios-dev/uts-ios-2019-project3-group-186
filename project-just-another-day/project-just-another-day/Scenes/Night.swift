//
//  Night.swift
//  project-just-another-day
//
//  Created by Alex Au on 27/5/19.
//  Copyright © 2019 Group-168. All rights reserved.
//

import Foundation
import SpriteKit

class Night: SKScene {
    
    var bed: SKSpriteNode = SKSpriteNode()
    var bedFrames: [SKTexture] = []
    var laptop: SKSpriteNode = SKSpriteNode()
    var laptopFrames: [SKTexture] = []
    var backpack: SKSpriteNode = SKSpriteNode()
    var backpackFrames: [SKTexture] = []
    var television: SKSpriteNode = SKSpriteNode()
    var televisionFrames: [SKTexture] = []
    
    var actionLabel: SKLabelNode = SKLabelNode()
    var timeLabel: SKLabelNode = SKLabelNode()
    
    var laptopPopUp: SKSpriteNode = SKSpriteNode()
    var watchYoutube: SKLabelNode = SKLabelNode()
    var study: SKLabelNode = SKLabelNode()
    
    var bedPopUp: SKSpriteNode = SKSpriteNode()
    var nap: SKLabelNode = SKLabelNode()
    var sleep: SKLabelNode = SKLabelNode()
    
    override func didMove(to view: SKView) {
        timeLabel = self.childNode(withName: Label.TIME) as! SKLabelNode
        actionLabel = self.childNode(withName: Label.ACTION) as! SKLabelNode
        watchYoutube = self.childNode(withName: Laptop.WATCH_YOUTUBE) as! SKLabelNode
        study = self.childNode(withName: Laptop.STUDY) as! SKLabelNode
        nap = self.childNode(withName: Bed.NAP) as! SKLabelNode
        sleep = self.childNode(withName: Bed.SLEEP) as! SKLabelNode
        
        actionLabel.isHidden = true
        game.setTimeRaw(time: 1930)

        if let bedNode = self.childNode(withName: Interactable.BED) as? SKSpriteNode {
            bed = bedNode
            SpriteController.createInteractableSpriteAtlas(atlasName: SpriteAtlas.BED, interactableFrames: &bedFrames)
            SpriteController.animateInteractable(interactable: bed, interactableFrames:bedFrames, timeInterval: 0.0025)
        }
        
        if let laptopNode = self.childNode(withName: Interactable.LAPTOP) as? SKSpriteNode {
            laptop = laptopNode
            SpriteController.createInteractableSpriteAtlas(atlasName: SpriteAtlas.LAPTOP, interactableFrames: &laptopFrames)
            SpriteController.animateInteractable(interactable: laptop, interactableFrames:laptopFrames, timeInterval: 0.0025)
        }
        
        if let backpackNode = self.childNode(withName: Interactable.NIGHT_BACKPACK) as? SKSpriteNode {
            backpack = backpackNode
            SpriteController.createInteractableSpriteAtlas(atlasName: SpriteAtlas.BACKPACK, interactableFrames: &backpackFrames)
            SpriteController.animateInteractable(interactable: backpack, interactableFrames:backpackFrames, timeInterval: 0.0025)
        }
        
        if let bedNode = self.childNode(withName: Interactable.BED) as? SKSpriteNode {
            bed = bedNode
            SpriteController.createInteractableSpriteAtlas(atlasName: SpriteAtlas.BED, interactableFrames: &bedFrames)
            SpriteController.animateInteractable(interactable: bed, interactableFrames:bedFrames, timeInterval: 0.0025)
        }
        
        if let televisionNode = self.childNode(withName: Interactable.NIGHT_TELEVISION) as? SKSpriteNode {
            television = televisionNode
            SpriteController.createInteractableSpriteAtlas(atlasName: SpriteAtlas.TV_BED, interactableFrames: &televisionFrames)
            SpriteController.animateInteractable(interactable: television, interactableFrames:televisionFrames, timeInterval: 0.0025)
        }
        
        if let laptopChoiceNode = self.childNode(withName: Laptop.CHOICE) as? SKSpriteNode {
            laptopPopUp = laptopChoiceNode
            
        }
        
        if let bedChoiceNode = self.childNode(withName: Bed.CHOICE) as? SKSpriteNode {
            bedPopUp = bedChoiceNode
        }
        game.hideChoice(laptopPopUp, watchYoutube, study, true)
        game.hideChoice(bedPopUp, nap, sleep, true)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        game.updateTime(addMinutes: 5)
        for touch in touches {
            let location = touch.location(in: self)
            let touchedLocation = self.atPoint(location)
            
            switch touchedLocation.name {
            case Interactable.BED:
                game.addPoints(numberOfPoints: 15, sceneNumber: SceneNumber.NIGHT, object: Interactable.BED)
                print("Bed time~ ZZZzzz")
                game.updateAction(actionLabel, message: "You've decided to go to sleep!")
                AudioController.shared.playAudio(audioName: AudioNams.ButtonNm)
                SceneController.shared.switchScene(sceneName: Scene.RESULT_SCENE, sceneView: self)
                game.hideChoice(bedPopUp, nap, sleep, false)
            case Interactable.LAPTOP:
                game.hideChoice(laptopPopUp, watchYoutube, study, false)
                AudioController.shared.playAudio(audioName: AudioNams.ButtonNm)
            case Interactable.NIGHT_BACKPACK:
                game.updateTime(addMinutes: 20)
                game.addPoints(numberOfPoints: 3, sceneNumber: SceneNumber.NIGHT, object: Interactable.NIGHT_BACKPACK)
                game.updateAction(actionLabel, message: "You've decided to pack your bag for tomorrow! +20 mins")
                AudioController.shared.playAudio(audioName: AudioNams.ButtonNm)
            case Interactable.NIGHT_TELEVISION:
                game.updateTime(addMinutes: 20)
                game.updateAction(actionLabel, message: "You've decided to Netflix and chill! +20 mins")
                AudioController.shared.playAudio(audioName: AudioNams.ButtonNm)
            case "watchYoutube":
                game.updateTime(addMinutes: 30)
                game.updateAction(actionLabel, message: "You've decided to watch some Youtube videos! +30 mins")
                AudioController.shared.playAudio(audioName: AudioNams.ButtonNm)
            case "study":
                game.updateTime(addMinutes: 60)
                game.addPoints(numberOfPoints: 5, sceneNumber: SceneNumber.NIGHT, object: Interactable.LAPTOP)
                game.updateAction(actionLabel, message: "You've decided to study some more! +60 mins")
                AudioController.shared.playAudio(audioName: AudioNams.ButtonNm)
            case "nap":
                game.updateTime(addMinutes: 30)
                game.updateAction(actionLabel, message: "You've decided to take a nap! +30 mins")
                AudioController.shared.playAudio(audioName: AudioNams.ButtonNm)
            case "sleep":
                game.addPoints(numberOfPoints: 15, sceneNumber: SceneNumber.NIGHT, object: Interactable.BED)
                SceneController.shared.switchScene(sceneName: Scene.RESULT_SCENE, sceneView: self)
                AudioController.shared.playAudio(audioName: AudioNams.ButtonNm)
            default:
                break
            }
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        timeLabel.text = game.getCurrentTime()
        if game.getTimeRaw() >= 2300 {
            print("Bed time~ ZZZzzz")
            SceneController.shared.switchScene(sceneName: Scene.RESULT_SCENE,sceneView: self)
        }
    }
}

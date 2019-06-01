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
    
    override func didMove(to view: SKView) {
        timeLabel = self.childNode(withName: Label.TIME) as! SKLabelNode
        actionLabel = self.childNode(withName: Label.ACTION) as! SKLabelNode
        
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
            SpriteController.createInteractableSpriteAtlas(atlasName: SpriteAtlas.TELEVISION, interactableFrames: &televisionFrames)
            SpriteController.animateInteractable(interactable: television, interactableFrames:televisionFrames, timeInterval: 0.0025)
        }
        
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
                //do something
                actionLabel.alpha = 1.0
                actionLabel.text = "You've decided to go to sleep!"
                actionLabel.isHidden = false
                actionLabel.run(SKAction.fadeOut(withDuration: 3))
                switchScene()
            case Interactable.LAPTOP:
                game.updateTime(addMinutes: 45)
                game.addPoints(numberOfPoints: 6, sceneNumber: SceneNumber.NIGHT, object: Interactable.LAPTOP)
                actionLabel.alpha = 1.0
                actionLabel.text = "You've decided to go on your laptop! +45 mins"
                actionLabel.isHidden = false
                actionLabel.run(SKAction.fadeOut(withDuration: 3))
            case Interactable.NIGHT_BACKPACK:
                game.updateTime(addMinutes: 20)
                game.addPoints(numberOfPoints: 3, sceneNumber: SceneNumber.NIGHT, object: Interactable.NIGHT_BACKPACK)
                actionLabel.alpha = 1.0
                actionLabel.text = "You've decided to pack your bag for tomorrow! +20 mins"
                actionLabel.isHidden = false
                actionLabel.run(SKAction.fadeOut(withDuration: 3))
            case Interactable.NIGHT_TELEVISION:
                game.updateTime(addMinutes: 20)
                actionLabel.alpha = 1.0
                actionLabel.text = "You've decided to Netflix and chill! +20 mins"
                actionLabel.isHidden = false
                actionLabel.run(SKAction.fadeOut(withDuration: 3))
            case Interactable.NIGHT_TEXTBOOK:
                game.updateTime(addMinutes: 60)
                game.addPoints(numberOfPoints: 7, sceneNumber: SceneNumber.NIGHT, object: Interactable.NIGHT_TEXTBOOK)
                actionLabel.alpha = 1.0
                actionLabel.text = "You've decided to revise from your textbook! +60 mins"
                actionLabel.isHidden = false
                actionLabel.run(SKAction.fadeOut(withDuration: 3))
            default:
                break
            }
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        timeLabel.text = game.getCurrentTime()
        if game.getTimeRaw() >= 2300 {
            print("Bed time~ ZZZzzz")
            switchScene()
        }
    }
    
    func switchScene() {
        print(game.getPoints(sceneNumber: SceneNumber.NIGHT))
        if let view = self.view {
            if let resultScene = SKScene(fileNamed: Scene.RESULT_SCENE) {
                resultScene.scaleMode = .aspectFill
                view.presentScene(resultScene)
            }
        }
    }
}

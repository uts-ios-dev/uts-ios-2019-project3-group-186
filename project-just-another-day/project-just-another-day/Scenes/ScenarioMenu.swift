//
//  ScenarioMenu.swift
//  project-just-another-day
//
//  Created by Alex Au on 29/5/19.
//  Copyright © 2019 Group-168. All rights reserved.
//

import Foundation
import SpriteKit

class ScenarioMenu: SKScene {
   
    var timeManagement = SKLabelNode()
    var courtesy = SKLabelNode()
    var backButton = SKLabelNode()
    var scenarioBg = SKSpriteNode()
    var scenarioBgFrames: [SKTexture] = []
    var menuaudio = MainMenu()
    var feedbackLabel = SKLabelNode()
    
    override func didMove(to view: SKView) {
        timeManagement = self.childNode(withName: Scenario.TIME_MANAGEMENT) as! SKLabelNode
        courtesy = self.childNode(withName: Scenario.COURTESY) as! SKLabelNode
        backButton = self.childNode(withName: Button.BACK_TO_MAIN_MENU_BUTTON) as! SKLabelNode
        feedbackLabel = self.childNode(withName: Label.FEEDBACK ) as! SKLabelNode
        
        if let scenarioNode = self.childNode(withName: Interactable.SCENARIO) as? SKSpriteNode {
         scenarioBg = scenarioNode
         SpriteController.createInteractableSpriteAtlas(atlasName: SpriteAtlas.SCENARIO, interactableFrames: &scenarioBgFrames)
         SpriteController.animateInteractable(interactable: scenarioBg, interactableFrames: scenarioBgFrames, timeInterval: 0.025)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            let touchedLocation = self.atPoint(location)
            
            switch touchedLocation.name {
            case timeManagement.name:
                AudioController.shared.playAudio(audioName: AudioNams.ButtonNm)
                SceneController.shared.switchScene(sceneName: Scene.PRELUDE_SCENE, sceneView: self)
            case courtesy.name:
                AudioController.shared.playAudio(audioName: AudioNams.ButtonNm)
                feedbackLabel.text = "Coming soon"
                feedbackLabel.alpha = 1
                feedbackLabel.run(SKAction.sequence([SKAction.wait(forDuration: 1.0),
                                   SKAction.fadeOut(withDuration: 1)]))
            case backButton.name:
                AudioController.shared.playAudio(audioName: AudioNams.ButtonNm)
                SceneController.shared.switchScene(sceneName: Scene.MAIN_MENU, sceneView: self)
                menuaudio.backgroundFx?.setVolume(0, fadeDuration: 5)
            default:
                break
            }
        }
    }
    
    func createBackdrop(){
        let scenarioAtlas = SKTextureAtlas(named: "ScenarioBg")
        var scenarioFrames: [SKTexture] = []
        
        let noOfFrames = scenarioAtlas.textureNames.count
        for i in 1...noOfFrames {
            let scenarioTextureNames = "scenario\(i)"
            scenarioFrames.append(scenarioAtlas.textureNamed(scenarioTextureNames))
        }
        scenarioBgFrames = scenarioFrames
    }
    
    func animateBackdrop() {
        scenarioBg.run(SKAction.repeatForever(
            SKAction.animate(with: scenarioBgFrames, timePerFrame: 0.05, resize: false, restore: true)))
    }
}

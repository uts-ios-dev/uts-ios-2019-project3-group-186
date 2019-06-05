//
//  ScenarioMenu.swift
//  project-just-another-day
//
//  Created by Alex Au, Ling Lau (Yuen) and Natassja Sundara on 27/5/19.
//  Copyright © 2019 Group-168. All rights reserved.
//

import Foundation
import SpriteKit

/*This class handles the backend functionality of the Scenario Menu scene and the ScenarioMenu.sks file handles the visual elements of the scene
 */
class ScenarioMenu: SKScene {
   
    var timeManagement = SKLabelNode()
    var courtesy = SKLabelNode()
    var backButton = SKLabelNode()
    var scenarioBg = SKSpriteNode()
    var scenarioBgFrames: [SKTexture] = []
    var menuaudio = MainMenu()
    var feedbackLabel = SKLabelNode()
    
    //This function connects the functionality to the label and sprite nodes created from the ScenarioMenu.sks file and sets up the animation for the background image
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
    /*This function handles the touch events when the user touches on a node.
     
      For extensibility, a new case can simply be added into this class and into the Scenario Menu for future scenarios such as Cyber-bullying, Mental Health, Seeking Career opportunities and etc. As there are more scenarios, the list will utilise an UI scroll view controller (under the UIKit framework) so the user can access to all the playable scenarios.
    */
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
            default:
                break
            }
        }
    }
}

//
//  Prelude.swift
//  project-just-another-day
//
//  Created by Alex Au on 27/5/19.
//  Copyright © 2019 Group-168. All rights reserved.
//

import Foundation
import SpriteKit

//This class handles the backend functionality of the Prelude Scene and the Prelude.sks file handles the visual elements of the scene
class Prelude: SKScene {
    
    var startButton = SKLabelNode()
    var backButton = SKLabelNode()
    
    //This function connects the functionality to the label nodes created from the Prelude.sks file
    override func didMove(to view: SKView) {
        startButton = self.childNode(withName: Button.START_BUTTON) as! SKLabelNode
        backButton = self.childNode(withName: Button.BACK_TO_SCENARIO_MENU_BUTTON) as! SKLabelNode
    }
    //This function handles the touch events when the user touches on a node
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            let touchedLocation = self.atPoint(location)
           
            switch touchedLocation.name {
            case startButton.name:
                AudioController.shared.playAudio(audioName: AudioNams.ButtonNm)
                SceneController.shared.switchScene(sceneName: Scene.MORNING_SCENE, sceneView: self)
            case backButton.name:
                AudioController.shared.playAudio(audioName: AudioNams.ButtonNm)
                SceneController.shared.switchScene(sceneName: Scene.SCENARIO_MENU, sceneView: self)
            default:
                break
            }
        }
    }
}

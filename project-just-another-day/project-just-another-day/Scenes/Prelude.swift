//
//  Prelude.swift
//  project-just-another-day
//
//  Created by Alex Au on 27/5/19.
//  Copyright © 2019 Group-168. All rights reserved.
//

import Foundation
import SpriteKit

class Prelude: SKScene { //Scene to introduce the user to the scenario / context
    
    var startButton = SKLabelNode()
    var backButton = SKLabelNode()
    
    override func didMove(to view: SKView) {
        startButton = self.childNode(withName: Button.START_BUTTON) as! SKLabelNode
        backButton = self.childNode(withName: Button.BACK_TO_SCENARIO_MENU_BUTTON) as! SKLabelNode
    }
    
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

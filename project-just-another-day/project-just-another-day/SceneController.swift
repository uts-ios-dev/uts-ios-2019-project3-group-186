//
//  SceneController.swift
//  project-just-another-day
//
//  Created by Alex Au on 3/6/19.
//  Copyright © 2019 Group-168. All rights reserved.
//

import Foundation
import SpriteKit

//This class handles the scene transitioning for each scene
class SceneController: SKScene {
    
    static let shared = SceneController()
    //This function takes in the name of the next scene and the SKScene view that will be switching from the current scene to the next scene
    public func switchScene(sceneName: String, sceneView: SKScene) {
        if let view = sceneView.view {
            if let sceneToSwitch = SKScene(fileNamed: sceneName) {
                sceneToSwitch.scaleMode = .aspectFill
                view.presentScene(sceneToSwitch, transition: SKTransition.crossFade(withDuration: 0.8))
            }
        }
    }
}

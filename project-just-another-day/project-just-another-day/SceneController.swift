//
//  SceneController.swift
//  project-just-another-day
//
//  Created by Alex Au on 3/6/19.
//  Copyright © 2019 Group-168. All rights reserved.
//

import Foundation
import SpriteKit

class SceneController: SKScene {
    
    static let shared = SceneController()
    
    public func switchScene(sceneName: String) {
        if let view = self.view {
            if let sceneToSwitch = SKScene(fileNamed: sceneName) {
                sceneToSwitch.scaleMode = .aspectFill
                view.presentScene(sceneToSwitch, transition: SKTransition.crossFade(withDuration: 0.5))
            }
        }
    
    }
}

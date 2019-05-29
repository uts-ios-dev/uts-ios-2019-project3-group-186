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
    var timeLabel:SKLabelNode = SKLabelNode()
    
    override func didMove(to view: SKView) {
        timeLabel = self.childNode(withName: Label.TIME) as! SKLabelNode
        game.setTimeRaw(time: 1930)
        timeLabel.text = game.getCurrentTime()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            let touchedLocation = self.atPoint(location)
            
            switch touchedLocation.name {
            case Interactable.BED:
                //do something
                switchScene()
            case Interactable.LAPTOP:
                switchScene()
            case Interactable.NIGHT_PHONE:
                switchScene()
            case Interactable.NIGHT_SNACKS:
                switchScene()
            case Interactable.NIGHT_TEXTBOOK:
                switchScene()
            default:
                break
            }
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        if game.getTimeRaw() >= 2300 {
            switchScene()
        }
    }
    
    func switchScene() {
        if let view = self.view {
            if let resultScene = SKScene(fileNamed: Scene.RESULT_SCENE) {
                resultScene.scaleMode = .aspectFill
                view.presentScene(resultScene)
            }
        }
    }
}

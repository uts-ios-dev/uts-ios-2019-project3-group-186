//
//  Result.swift
//  project-just-another-day
//
//  Created by Alex Au on 27/5/19.
//  Copyright © 2019 Group-168. All rights reserved.
//

import Foundation
import SpriteKit

class Result: SKScene {
    
    var mainMenuButton = SKLabelNode()
    var resultsBg = SKSpriteNode()
    var resultBgFrames: [SKTexture] = []
    
    var resultLabelTotal = SKLabelNode()
    var resultLabel1 = SKLabelNode()
    var resultLabel2 = SKLabelNode()
    var resultLabel3 = SKLabelNode()
    var resultLabel4 = SKLabelNode()
    
    override func didMove(to view: SKView) {
        mainMenuButton = self.childNode(withName: Button.MAIN_MENU_BUTTON) as! SKLabelNode
        
        resultLabelTotal = self.childNode(withName: "resultScoreTotal") as! SKLabelNode
        resultLabel1 = self.childNode(withName: "resultScore1") as! SKLabelNode
        resultLabel2 = self.childNode(withName: "resultScore2") as! SKLabelNode
        resultLabel3 = self.childNode(withName: "resultScore3") as! SKLabelNode
        resultLabel4 = self.childNode(withName: "resultScore4") as! SKLabelNode
        loadScores()
        
        if let resultNode = self.childNode(withName: Interactable.RESULTS) as? SKSpriteNode {
            resultsBg = resultNode
            SpriteController.createInteractableSpriteAtlas(atlasName: SpriteAtlas.RESULTS, interactableFrames: &resultBgFrames)
            SpriteController.animateInteractable(interactable: resultsBg, interactableFrames: resultBgFrames, timeInterval: 0.1)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            let touchedLocation = self.atPoint(location)
            
            switch touchedLocation.name {
            case mainMenuButton.name:
                switchScene()
            default:
                break
            }
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
    
    func switchScene() {
        if let view = self.view {
            if let mainMenuScene = SKScene(fileNamed: Scene.MAIN_MENU) {
                mainMenuScene.scaleMode = .aspectFill
                view.presentScene(mainMenuScene, transition: SKTransition.crossFade(withDuration: 0.5))
            }
        }
    }
    
    func loadScores(){
        let score  = game.getScore()
        
        resultLabel1.text = "Morning Scene = " + String(score[SceneNumber.MORNING]) + "/10"
        resultLabel2.text = "School Scene = " + String(score[SceneNumber.CLASS]) + "/50"
        resultLabel3.text = "After School Scene = " + String(score[SceneNumber.AFTERNOON]) + "/10"
        resultLabel4.text = "Night Scene = " + String(score[SceneNumber.NIGHT]) + "/30"
        
        let totalScore = score[SceneNumber.MORNING] + score[SceneNumber.CLASS] + score[SceneNumber.AFTERNOON] + score[SceneNumber.NIGHT]
        resultLabelTotal.text = ("Score = " + String(totalScore) + "/ 100")
        
        
    }
    
    //have a func that has a switch case where if the user scores within a certain range:
    //e.g. 85 - 100, comment on their good sense of judgement on managing time, etc.. and their circumstances
}

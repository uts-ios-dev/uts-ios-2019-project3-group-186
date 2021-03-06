//
//  Result.swift
//  project-just-another-day
//
//  Created by Alex Au, Ling Lau (Yuen) and Natassja Sundara on 27/5/19.
//  Copyright © 2019 Group-168. All rights reserved.
//

import Foundation
import SpriteKit

/*This class handles the backend functionality of the Result Scene and the Result.sks file handles the visual elements of the scene
 */
class Result: SKScene {
    
    var mainMenuButton = SKLabelNode()
    var resultsBg = SKSpriteNode()
    var resultBgFrames: [SKTexture] = []
    
    var resultLabelTotal = SKLabelNode()
    var resultLabel1 = SKLabelNode()
    var resultLabel2 = SKLabelNode()
    var resultLabel3 = SKLabelNode()
    var resultLabel4 = SKLabelNode()
    var feedback = SKLabelNode()
    
    //This function connects the functionality to the label nodes created from the Result.sks file and also setup the animation for the background image as well as load up the resulting scores from the user's choices
    override func didMove(to view: SKView) {
        mainMenuButton = self.childNode(withName: Button.MAIN_MENU_BUTTON) as! SKLabelNode
        resultLabelTotal = self.childNode(withName: "resultScoreTotal") as! SKLabelNode
        resultLabel1 = self.childNode(withName: "resultScore1") as! SKLabelNode
        resultLabel2 = self.childNode(withName: "resultScore2") as! SKLabelNode
        resultLabel3 = self.childNode(withName: "resultScore3") as! SKLabelNode
        resultLabel4 = self.childNode(withName: "resultScore4") as! SKLabelNode
        loadScores()
        
        feedback = self.childNode(withName: Label.FEEDBACK) as! SKLabelNode
        feedback.text = game.getFeedback()
        
        if let resultNode = self.childNode(withName: Interactable.RESULTS) as? SKSpriteNode {
            resultsBg = resultNode
            SpriteController.createInteractableSpriteAtlas(atlasName: SpriteAtlas.RESULTS, interactableFrames: &resultBgFrames)
            SpriteController.animateInteractable(interactable: resultsBg, interactableFrames: resultBgFrames, timeInterval: 0.1)
        }
    }
    //This function handles the touch events when the user touches on an interactable
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            let touchedLocation = self.atPoint(location)
            
            switch touchedLocation.name {
            case mainMenuButton.name:
                AudioController.shared.playAudio(audioName: AudioNams.ButtonNm)
                SceneController.shared.switchScene(sceneName: Scene.MAIN_MENU, sceneView: self)
            default:
                break
            }
        }
    }

    /* This function grabs the players scores throughout the gameplay and displays them on the Results scene.
     
     For extensibility, the results (with more time) can also display a path listing all the prior decisions made by the player during the game, to highlight where they have done well or poorly, in turn helping with future decision making when playing the scenario again. Many adventure story games showcase a butterfly effect of outcomes (action and consequence) which we could not implement due to time.
     
     The results can also be extended upon by adding each players score for each scenario to a database, and showcasing in the results other high scoring players - allowing players to compare their scores to others.
    */
    func loadScores(){
        let score  = game.getScore()
        
        resultLabel1.text = "Morning Scene = " + String(score[SceneNumber.MORNING]) + "/10"
        resultLabel2.text = "School Scene = " + String(score[SceneNumber.CLASS]) + "/50"
        resultLabel3.text = "After School Scene = " + String(score[SceneNumber.AFTERNOON]) + "/10"
        resultLabel4.text = "Night Scene = " + String(score[SceneNumber.NIGHT]) + "/30"
        
        let totalScore = score[SceneNumber.MORNING] + score[SceneNumber.CLASS] + score[SceneNumber.AFTERNOON] + score[SceneNumber.NIGHT]

        resultLabelTotal.text = ("Score = " + String(totalScore) + "/ 100")
    }
}

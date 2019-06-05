//
//  MainMenu.swift
//  project-just-another-day
//
//  Created by Alex Au, Ling Lau (Yuen) and Natassja Sundara on 27/5/19.
//  Copyright © 2019 Group-168. All rights reserved.
//

import Foundation
import SpriteKit
import AVFoundation

var game = ChoiceController()
public var backgroundFX: SKAudioNode!

/* This class handles the backend functionality of the Main Menu Scene and the MainMenu.sks file handles the visual elements of the scene
 */
class MainMenu: SKScene {
    
    var startButton = SKLabelNode()
    var exitButton = SKLabelNode()
    var mainmenuBg: SKSpriteNode = SKSpriteNode()
    var mainemnuBgFrames: [SKTexture] = []
    
    //This function connects all the nodes created from the MainMenu.sks file and also setup the animation of the background image
    override func didMove(to view: SKView) {
        startButton = self.childNode(withName: Button.MENU_START_BUTTON) as! SKLabelNode
        exitButton = self.childNode(withName: Button.MENU_EXIT_BUTTON) as! SKLabelNode
        if let mainMenuNode = self.childNode(withName: Interactable.MAINMENU) as? SKSpriteNode {
            mainmenuBg = mainMenuNode
            SpriteController.createInteractableSpriteAtlas(atlasName: SpriteAtlas.MAINMENU, interactableFrames: &mainemnuBgFrames)
            SpriteController.animateInteractable(interactable: mainmenuBg, interactableFrames: mainemnuBgFrames, timeInterval: 0.025)
        }
    }
    
    //This function handles the background music audio after the scene loads
    override func sceneDidLoad() {
        super.sceneDidLoad()
        let action: SKAction = SKAction.playSoundFileNamed("music1.mp3", waitForCompletion: true)
        self.run(action, withKey:"backgroundFX")
    }
    //This function handles the touch events when the user touches on an interactable
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            let touchedLocation = self.atPoint(location)
            
            switch touchedLocation.name {
            case startButton.name:
                AudioController.shared.playAudio(audioName: AudioNams.ButtonNm)
                SceneController.shared.switchScene(sceneName: Scene.SCENARIO_MENU, sceneView: self)
            case exitButton.name:
                exit(1)
            default:
                break
            }
        }
    }
}




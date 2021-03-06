//
//  GameViewController.swift
//  project-just-another-day
//
//  Created by Alex Au on 27/5/19.
//  Copyright © 2019 Group-168. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

// This class is the main view controller loading the Main Menu scene to begin the application.
class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        if let view = self.view as! SKView? {
            if let mainMenuScene = SKScene(fileNamed: "MainMenu") {
                // Set the scale mode to scale to fit the window
                mainMenuScene.scaleMode = .aspectFill
                // Present the scene
                view.presentScene(mainMenuScene)
                view.ignoresSiblingOrder = true
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}

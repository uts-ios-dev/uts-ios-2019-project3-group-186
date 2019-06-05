//
//  SpriteController.swift
//  project-just-another-day
//
//  Created by Alex Au on 1/6/19.
//  Copyright © 2019 Group-168. All rights reserved.
//

import Foundation
import SpriteKit

//This classs handles the animation of the sprite nodes (Interactables) and backgrounds (Main menu, scenario menu and results scene) and creating the sprite atlas for each node
class SpriteController {
    //This function makes the sprite atlas (folder) for the interactable sprite by getting and storing all the individual images (frames) of the sprite into the atlas
    static func createInteractableSpriteAtlas(atlasName: String, interactableFrames: inout [SKTexture]) {
        let spriteAtlas = SKTextureAtlas(named: atlasName)
        var spriteFrames: [SKTexture] = []
        
        let noOfFrames = spriteAtlas.textureNames.count
        for i in 1...noOfFrames {
            let spriteTextureNames = atlasName + "\(i)"
            spriteFrames.append(spriteAtlas.textureNamed(spriteTextureNames))
        }
        interactableFrames = spriteFrames
    }
    //This function animates the interactable sprite by inputting the sprite atlas and specifying the interval between each frame (to be faster or slower)
    static func animateInteractable(interactable: SKSpriteNode, interactableFrames: [SKTexture], timeInterval: Double) {
        interactable.run(SKAction.repeatForever(
            SKAction.animate(with: interactableFrames, timePerFrame: timeInterval, resize: false, restore: true)))
    }
    
}

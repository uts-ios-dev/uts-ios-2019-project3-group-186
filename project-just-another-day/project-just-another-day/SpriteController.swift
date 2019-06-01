//
//  SpriteController.swift
//  project-just-another-day
//
//  Created by Alex Au on 1/6/19.
//  Copyright © 2019 Group-168. All rights reserved.
//

import Foundation
import SpriteKit

class SpriteController {
    
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
    
    static func animateInteractable(interactable: SKSpriteNode, interactableFrames: [SKTexture], timeInterval: Double) {
        interactable.run(SKAction.repeatForever(
            SKAction.animate(with: interactableFrames, timePerFrame: 0.5, resize: false, restore: true)))
    }
    
}

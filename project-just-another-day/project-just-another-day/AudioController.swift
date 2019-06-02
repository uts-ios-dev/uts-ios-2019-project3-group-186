//
//  AudioController.swift
//  project-just-another-day
//
//  Created by Nate on 2/6/19.
//  Copyright © 2019 Group-168. All rights reserved.
//

import Foundation
import AVFoundation

class AudioController {

    static func playAudio(audioFX: AVAudioPlayer, audioName: String) {
        let audio = Bundle.main.url(forResource: audioName, withExtension: "mp3")
        
        do {
            let audioFX = try AVAudioPlayer(contentsOf: audio!)
            audioFX.play()
            print("audio playing: \(audioName)")
        }
        catch {
            print(error.localizedDescription)
            
        }
    }
}



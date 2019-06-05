//
//  AudioController.swift
//  project-just-another-day
//
//  Created by Nate on 2/6/19.
//  Copyright © 2019 Group-168. All rights reserved.
//

import Foundation
import AVFoundation

//This class handles the audio played for the application
class AudioController {
    static let shared = AudioController()
    public var backgroundAudioPlayer: AVAudioPlayer?
    
    //This funcction play audio by utilising the AVFoundation framework. The function finds the audio file name with the file extension specified. The background audio player takes in the audio file name and if there is an existing audio file, play the audio if not, print out an error.
    public func playAudio(audioName: String) {
        let audio = Bundle.main.url(forResource: audioName, withExtension: "mp3")
        var error: NSError? = nil
        do {
            backgroundAudioPlayer = try AVAudioPlayer(contentsOf: audio!)
            backgroundAudioPlayer?.prepareToPlay()
            backgroundAudioPlayer!.play()
        }
        catch let audioPlayerError as NSError {
            error = audioPlayerError
            backgroundAudioPlayer = nil
            print("Cannot create an audio player: \(String(describing: error))")
        }
    }
    
}



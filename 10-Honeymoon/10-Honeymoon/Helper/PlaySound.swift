//
//  PlaySound.swift
//  10-Honeymoon
//
//  Created by solgo on 29/11/2022.
//

import AVFoundation


var audioPlayer : AVAudioPlayer?

func playSound(sound: String, type: String) {
    if let path = Bundle.main.path(forResource: sound, ofType: type) {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            audioPlayer?.play()
        }catch {
            print("ERROR: could not find and play the sound file")
        }
    }
}

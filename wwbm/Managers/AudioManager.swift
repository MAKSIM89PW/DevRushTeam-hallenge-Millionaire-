//
//  AudioManager.swift
//  wwbm
//
//  Created by dsm 5e on 29.02.2024.
//

import Foundation
import AVKit

class AudioManager {
        
    static let shared = AudioManager()
    private init() {}
    
    var player: AVAudioPlayer?
    
    enum SoundOption: String {
        case choiseAnswer = "choiceAnswer"
        case failureAnswer = "failureAnswer"
        case final = "final"
        case startTime = "startTime.mp3"
        case successAnswer = "successAnswer"
    }
    
    func playSound(sound: SoundOption) {
        guard let url = Bundle.main.url(forResource: sound.rawValue, withExtension: ".mp3") else {
            print("incorrect")
            return
        }
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
            print("play sound")
        } catch let error {
            print("Ошибка воспроизведения. \(error.localizedDescription)")
        }
    }
    
    func stopSound() {
        player?.stop()
    }
}

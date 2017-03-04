//
//  SoundManager.swift
//  SheepCounter
//
//  Created by Roxanne Farkas on 3/2/17.
//  Copyright © 2017 newschool. All rights reserved.
//

import Foundation
import AVFoundation

class SoundManager {
    static let instance = SoundManager()
    
    var player = AVAudioPlayer()
    
    
    func play(soundFile: String){
        guard let url = Bundle.main.url(forResource: soundFile, withExtension: "mp3") else {
            return
        }
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            
            player.prepareToPlay()
            player.play()
        } catch let error{
            print(error.localizedDescription)
        }
    }
}

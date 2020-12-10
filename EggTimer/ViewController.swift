//
//  ViewController.swift
//  EggTimer
//
//  Created by Dayton on 11/12/20.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var cookProgress: UIProgressView!
    
    
    var audioPlayer: AVAudioPlayer!
    
    
    var eggTimes: [String: Int] = ["Soft": 3, "Medium": 4, "Hard": 7]
    var timer = Timer()
    var totalTime = 0
    var timePassed = 0
  
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        
        
        timer.invalidate()
        let hardness = sender.currentTitle!
        totalTime = eggTimes[hardness]!
        
        cookProgress.progress = 0.0
        timePassed = 0
        titleLabel.text = hardness
        
        
        
         
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    
    }
    @objc func updateTimer(){
        
        if timePassed < totalTime {
            
            timePassed += 1
            let percentage = Float(timePassed) / Float(totalTime)
            
            cookProgress.progress = percentage
            
            
            
            print(timePassed)
            
        }else{
            timer.invalidate()
            titleLabel.text = "DONE!"
            playSound()
        }
    }
    
    func playSound(){
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        audioPlayer = try! AVAudioPlayer(contentsOf: url!)
        audioPlayer.play()
    }
    
}

//
//  ViewController.swift
//  Egg Timer
//
//  Created by RANGA REDDY NUKALA on 27/02/20.
//  Copyright © 2020 RANGA REDDY NUKALA. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var buzzer: AVAudioPlayer!
    
    @IBOutlet weak var timemessage: UILabel!
    
    @IBOutlet weak var progessBar: UIProgressView!
    
    let eggTimes = ["Soft":3,"Medium":4,"Hard":7]

    var totalTime = 0
    var secondsPassed = 0
    
    var timer = Timer()
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        timer.invalidate()
        
        let hardness = sender.currentTitle!
        
         totalTime = eggTimes[hardness]!
        
        progessBar.progress = 0.0
        secondsPassed = 0
        timemessage.text = hardness
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer),userInfo: nil ,repeats: true)
           
         }
    @objc func updateTimer(){
        if secondsPassed < totalTime {
            
            secondsPassed += 1
            
           let percentageProgress = Float(secondsPassed)/Float(totalTime)
            
            progessBar.progress = percentageProgress
            
                
        }
        else {
            timer.invalidate()
           playSound()
            timemessage.text = "Time is Up !!! ⌛️"
            
      
    }
  

    }
    func playSound() {
          let url = Bundle.main.url(forResource:"alarm_sound" , withExtension: ".mp3")
          buzzer = try! AVAudioPlayer(contentsOf: url!)
          buzzer.play()
      }
       
  
}

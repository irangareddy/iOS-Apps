//
//  ViewController.swift
//  Starbucks
//
//  Created by RANGA REDDY NUKALA on 29/02/20.
//  Copyright © 2020 RANGA REDDY NUKALA. All rights reserved.
//

/*

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}
*/


import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var buzzer: AVAudioPlayer!
    
    @IBOutlet weak var timemessage: UILabel!
    
    @IBOutlet weak var progessBar: UIProgressView!
    
    let eggTimes = ["small":3,"medium":4,"large":7]

    var totalTime = 0
    var secondsPassed = 0
    
    var timer = Timer()
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        timer.invalidate()
        
        let hardness = sender.currentTitle!
        
         totalTime = eggTimes[hardness]!
        
        progessBar.progress = 0.0
        secondsPassed = 0
        timemessage.text = "You choosen " + hardness
        
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
            timemessage.text = "Your Coffee is Ready 👍"
            
      
    }
  

    }
    func playSound() {
          let url = Bundle.main.url(forResource:"starbucks" , withExtension: ".mp3")
          buzzer = try! AVAudioPlayer(contentsOf: url!)
          buzzer.play()
      }
       
  
}


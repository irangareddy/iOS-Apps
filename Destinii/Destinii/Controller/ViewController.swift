//
//  ViewController.swift
//  Destinii
//
//  Created by RANGA REDDY NUKALA on 19/03/20.
//  Copyright © 2020 RANGA REDDY NUKALA. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var storyLabel: UILabel!
    
    @IBOutlet weak var choice1Button: UIButton!
    
    @IBOutlet weak var choice2Button: UIButton!
    
    var storyBrain = StoryBrain()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
        
    }

    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        storyBrain.nextStory(userChoice: sender.currentTitle!)
        
        updateUI()
                
    }
    
    
    func updateUI() {
        storyLabel.text = storyBrain.getStory()
        choice1Button.setTitle(storyBrain.getChoice1(), for: .normal)
        choice2Button.setTitle(storyBrain.getChoice2(), for: .normal)
    }
    
}


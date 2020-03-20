//
//  ViewController.swift
//  MCQ
//
//  Created by RANGA REDDY NUKALA on 18/03/20.
//  Copyright © 2020 RANGA REDDY NUKALA. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var scoreLabel: UILabel!
    
    @IBOutlet var qTextLabel: UILabel!
    
    @IBOutlet var choice1: UIButton!
    
    @IBOutlet var choice2: UIButton!
    
    @IBOutlet var choice3: UIButton!
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    
    
    
    
    
    var quizBrain = QuizBrain()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        updateUI()
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
           
           let userAnswer = sender.currentTitle!
           let answer = quizBrain.checkAnswer(userAnswer)
           
           
           if answer {
               sender.backgroundColor = UIColor.green
           }else {
               sender.backgroundColor = UIColor.red
           }
           
           
           quizBrain.nextQuestion()
           
           Timer.scheduledTimer(timeInterval: 0.2, target: self , selector: #selector(updateUI), userInfo: nil, repeats: false)
           
       }

    
    @objc func updateUI() {
        
        
        
        qTextLabel.text = quizBrain.getQuestionText()
        progressBar.progress = quizBrain.getProgress()
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        
        let choices = quizBrain.setChoices()
        choice1.setTitle(choices[0], for: .normal)
        choice2.setTitle(choices[1], for: .normal)
        choice3.setTitle(choices[2], for: .normal)
        
        choice1.backgroundColor = UIColor.clear
        choice2.backgroundColor = UIColor.clear
        choice3.backgroundColor = UIColor.clear
        
    }
    
}


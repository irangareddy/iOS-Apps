//
//  ViewController.swift
//  Guess
//
//  Created by RANGA REDDY NUKALA on 19/02/20.
//  Copyright © 2020 RANGA REDDY NUKALA. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var inputNumber: UITextField!
    var guessedNumber : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        guessedNumber = Int.random(in: 1...50)
        
    }
    
    @IBAction func guessButtonPressed(_ sender: Any) {
        
        if let number = Int(inputNumber.text!){
            
            
            
            if guessedNumber>number {
                showToast(message: "The number greater than you enterd!!!🙆‍♂️")
            }
            else if guessedNumber<number {
                showToast(message: "The number lesser than you enterd!!!🙆‍♂️")
            }
            else {
                showToast(message: "You got me Buddy 👊🏻")
                viewDidLoad()
            }
          
        }
        else {
            
            showToast(message: "That doesn't look a number 👎🏻")
        }
    }
    
}
extension UIViewController {
    func showToast(message: String){
        guard let window = UIApplication.shared.keyWindow else {
            return
        }
        
        let toastLbl = UILabel()
        toastLbl.text = message
        toastLbl.textAlignment = .center
        toastLbl.font = UIFont.systemFont(ofSize: 16)
        toastLbl.textColor = UIColor.white
        toastLbl.backgroundColor = UIColor.black.withAlphaComponent(0.7)
        toastLbl.numberOfLines = 0
        
        
        let textSize = toastLbl.intrinsicContentSize
        let labelHeight = ( textSize.width / window.frame.width ) * 30
        let labelWidth = min(textSize.width, window.frame.width - 40)
        let adjustedHeight = max(labelHeight, textSize.height + 20)
        
        toastLbl.frame = CGRect(x: 20, y: (window.frame.height - 90 ) - adjustedHeight, width: labelWidth + 20, height: adjustedHeight)
        toastLbl.center.x = window.center.x
        toastLbl.layer.cornerRadius = 10
        toastLbl.layer.masksToBounds = true
        
        window.addSubview(toastLbl)
        
        UIView.animate(withDuration: 4.0, animations: {
            toastLbl.alpha = 0
        }) { (_) in
            toastLbl.removeFromSuperview()
        }
    }
}


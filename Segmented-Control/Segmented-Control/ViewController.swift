//
//  ViewController.swift
//  Segmented-Control
//
//  Created by RANGA REDDY NUKALA on 23/03/20.
//  Copyright © 2020 RANGA REDDY NUKALA. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var cardImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func suitDidChange(_ sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex {
        case 0:
            cardImageView.image = UIImage(named: "Spade")!
            break
        case 1:
            cardImageView.image = UIImage(named: "Heart")!
            break
        case 2:
            cardImageView.image = UIImage(named: "Club")!
            break
        case 3:
            cardImageView.image = UIImage(named: "Diamond")!
            break
        default:
            cardImageView.image = UIImage(named: "CardBack")!
            break
        }
    }
    
}


//
//  InterestCollectionViewCell.swift
//  Carousel Effect
//
//  Created by RANGA REDDY NUKALA on 14/04/20.
//  Copyright © 2020 RANGA REDDY NUKALA. All rights reserved.
//

import UIKit


class InterestCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var featuredImageView: UIImageView!
    @IBOutlet weak var backgroundColorView: UIView!
    @IBOutlet weak var interestTitleLabel: UILabel!
   
    var interest: Interest! {
        didSet {
            self.updateUI()
        }
    }
    
    func updateUI() {
        if  let interest = interest {
            featuredImageView.image = interest.fearturedImage
            backgroundColorView.backgroundColor = interest.color
            interestTitleLabel.text = interest.title
        } else {
            featuredImageView.image = nil
            backgroundColorView.backgroundColor = nil
            interestTitleLabel.text = nil
        }
        
        backgroundColorView.layer.cornerRadius = 10.0
        backgroundColorView.layer.masksToBounds = true
        featuredImageView.layer.cornerRadius = 10.0
        featuredImageView.layer.masksToBounds = true
        
    }

}
  

    
    
    

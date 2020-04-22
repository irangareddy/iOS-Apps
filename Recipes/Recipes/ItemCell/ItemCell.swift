//
//  ItemCell.swift
//  Grid View
//
//  Created by RANGA REDDY NUKALA on 18/04/20.
//  Copyright © 2020 RANGA REDDY NUKALA. All rights reserved.
//

import UIKit

class ItemCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var textLabel: UILabel!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.layer.cornerRadius = 8.0
    }
    
    func setData(image: UIImage,text: String) {
        self.imageView.image = image
        self.textLabel.text = text
    }

}

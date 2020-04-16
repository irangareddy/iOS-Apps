//
//  Interest.swift
//  Carousel Effect
//
//  Created by RANGA REDDY NUKALA on 14/04/20.
//  Copyright © 2020 RANGA REDDY NUKALA. All rights reserved.
//

import UIKit

class Interest {

    var title = ""
    var fearturedImage: UIImage
    var color: UIColor
    
    
    init(title:String, fearturedImage: UIImage, color: UIColor){
        self.title = title
        self.fearturedImage = fearturedImage
        self.color = color
    }
    
    static func fetchInterests() -> [Interest] {
        
        return [
            Interest(title: "Chichen Itza", fearturedImage:UIImage(named: "f1")!, color: UIColor(red: 63/255.0, green: 71/255.0, blue: 80/255.0, alpha: 0.8)),
            Interest(title: "Christ the Redeemer", fearturedImage:UIImage(named: "f2")!, color: UIColor(red: 240/255.0, green: 133/255.0, blue: 91/255.0, alpha: 0.8)),
            Interest(title: "Great Pyramid of Giza", fearturedImage:UIImage(named: "f3")!, color: UIColor(red: 105/255.0, green: 80/255.0, blue: 227/255.0, alpha: 0.8)),
            Interest(title: "Taj Mahal", fearturedImage:UIImage(named: "f4")!, color: UIColor(red: 102/255.0, green: 102/255.0, blue: 102/255.0, alpha: 0.8)),
            Interest(title: "Colosseum", fearturedImage:UIImage(named: "f5")!, color: UIColor(red: 245/255.0, green: 62/255.0, blue: 40/255.0, alpha: 0.8)),
            Interest(title: "Machu Picchu", fearturedImage:UIImage(named: "f6")!, color: UIColor(red: 103/255.0, green: 217/255.0, blue: 87/255.0, alpha: 0.8)),
            Interest(title: "Petra", fearturedImage:UIImage(named: "f7")!, color: UIColor(red: 63/255.0, green: 71/255.0, blue: 80/255.0, alpha: 0.8)),
            Interest(title: "Great Wall of China", fearturedImage:UIImage(named: "f8")!, color: UIColor(red: 240/255.0, green: 133/255.0, blue: 91/255.0, alpha: 0.8))
        ]
    }
}



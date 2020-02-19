//
//  ViewController.swift
//  Tesla
//
//  Created by RANGA REDDY NUKALA on 17/02/20.
//  Copyright © 2020 RANGA REDDY NUKALA. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var Viewer: UIImageView!
    @IBOutlet weak var displayName: UILabel!
    
    var fwd = 0
    
    let cars = [#imageLiteral(resourceName: "Tesla Model S"),#imageLiteral(resourceName: "Tesla Model 3"),#imageLiteral(resourceName:"Tesla Model X"),#imageLiteral(resourceName: "Tesla Model Y"),#imageLiteral(resourceName: "CyberTruck")]
    let names = ["MODEL S","MODEL 3","MODEL X","MODEL Y","Cyber Truck"]
    
    
    @IBAction func forwardButton(_ sender: Any) {
        
        if fwd<4
        {
        fwd+=1
        Viewer.image = cars[fwd]
        displayName.text = names[fwd]
        
        } else {
        fwd = 0
        Viewer.image = cars[fwd]
        displayName.text = names[fwd]
        }
        
    }
    
    
    @IBAction func backButton(_ sender: Any) {
        if fwd>0
        {
        fwd-=1
        Viewer.image = cars[fwd]
        displayName.text = names[fwd]
        }
        else {
        fwd = 4
         Viewer.image = cars[fwd]
        displayName.text = names[fwd]
        }
    }
    

    @IBAction func testRideButton(_ sender: Any) {
        showToast(message: "Test Ride Booked")
    }
}
extension UIViewController {
    func showToast(message: String) {
        guard let window = UIApplication.shared.keyWindow else {
            return
        }
        
        let toastLbl = UILabel()
        toastLbl.text = message
        toastLbl.textAlignment = .center
        toastLbl.font = UIFont.systemFont(ofSize: 16)
        toastLbl.textColor = UIColor.white
        toastLbl.backgroundColor = UIColor.black.withAlphaComponent(0.6)
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
        
        UIView.animate(withDuration: 3.0, animations: {
            toastLbl.alpha = 0
        }) { (_) in
            toastLbl.removeFromSuperview()
        }
    }
}



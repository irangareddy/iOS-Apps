//
//  InteretsViewController.swift
//  Carousel Effect
//
//  Created by RANGA REDDY NUKALA on 14/04/20.
//  Copyright © 2020 RANGA REDDY NUKALA. All rights reserved.
//

import UIKit

class InterestsViewController : UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    var interets = Interest.fetchInterests()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
    }
}


// MARK:- UICollectionViewDataSource

extension InterestsViewController: UICollectionViewDataSource
{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return interets.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "InterestCollectionViewCell", for: indexPath) as! InterestCollectionViewCell
        let interest = interets[indexPath.item]
        
        cell.interest = interest
        return cell 
    }

    
}

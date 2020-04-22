//
//  ViewController.swift
//  Grid View
//
//  Created by RANGA REDDY NUKALA on 18/04/20.
//  Copyright © 2020 RANGA REDDY NUKALA. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var recipesData = RecipesData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Set Delegate
        //self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
        // Register Cells
        self.collectionView.register(UINib(nibName: Constants.cellIdentifier, bundle: nil),forCellWithReuseIdentifier: Constants.cellIdentifier)
        
        let width = (view.frame.size.width - 50) / 2
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: width, height: width)
      
        
    }

}

//extension ViewController: UICollectionViewDelegate {
//
//}


extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.recipesData.dataArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
      
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.cellIdentifier , for: indexPath) as! ItemCell
        cell.setData(image: recipesData.dataArray[indexPath.row].image, text: recipesData.dataArray[indexPath.row].text)

        return cell
    }
    
}




//
//  FoodViewController.swift
//  Elisas App
//
//  Created by Matthew Curtner on 6/3/15.
//  Copyright (c) 2015 Matthew Curtner. All rights reserved.
//

import UIKit

class FoodViewController: UICollectionViewController {
    
    var imagesArray = [String]()
    

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        var load = LoadArray()
        imagesArray = load.loadImageIntoArray(folder: "food images")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.delegate = self
        collectionView?.dataSource = self
        
        let width = CGRectGetWidth(collectionView!.frame) / 3
        let layout = collectionViewLayout as! UICollectionViewFlowLayout
        
        layout.itemSize = CGSize(width: width, height: width)
    }
    
    
    // MARK: - UICollectionViewDataSource
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imagesArray.count
    }
    
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> ItemCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("ItemCell", forIndexPath: indexPath) as! ItemCell
        
        var imgName = imagesArray[indexPath.row]
        cell.imgView.image = UIImage(named: imgName)
        
        return cell
    }

}

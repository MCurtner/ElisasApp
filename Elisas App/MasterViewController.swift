//
//  MasterViewController.swift
//  Elisas App
//
//  Created by Matthew Curtner on 6/2/15.
//  Copyright (c) 2015 Matthew Curtner. All rights reserved.
//

import UIKit

class MasterViewController: UICollectionViewController {

    var imagesArray: [String]!
    var selectIndex: NSIndexPath!
    
    @IBOutlet weak var imgView: UIImageView!
    
    // MARK: - UIVIewController
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView?.delegate = self
        collectionView?.dataSource = self
        
        let width = CGRectGetWidth(collectionView!.frame) / 3
        let layout = collectionViewLayout as! UICollectionViewFlowLayout
        
        layout.itemSize = CGSize(width: width, height: width)
        
        imagesArray = ["shirt","house","hamburger"]
        
        
    }
    
    // MARK: - UICollectionViewDataSource
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> ItemCell {
        
        var reuseIdentifier:String?
        
        if indexPath.item == 0 {
            reuseIdentifier = "ClothingCell"
        }
        if indexPath.item == 1 {
            reuseIdentifier = "HousingCell"
        }
        if indexPath.item == 2 {
            reuseIdentifier = "FoodCell"
        }
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier!, forIndexPath: indexPath) as! ItemCell
        
        var imgName = imagesArray[indexPath.row]
        cell.imgView.image = UIImage(named: imgName)
        
        return cell
    }
}

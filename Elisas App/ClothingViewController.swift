//
//  ClothingViewController.swift
//  Elisas App
//
//  Created by Matthew Curtner on 6/2/15.
//  Copyright (c) 2015 Matthew Curtner. All rights reserved.
//

import UIKit

class ClothingViewController: UICollectionViewController {
    
    var imagesDictionary:[String:String]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.delegate = self
        collectionView?.dataSource = self
        
        let width = CGRectGetWidth(collectionView!.frame) / 3
        let layout = collectionViewLayout as! UICollectionViewFlowLayout
        
        layout.itemSize = CGSize(width: width, height: width)

    
        imagesDictionary = ["shirt":"Shirt", "pants":"pants"]
        
    }
    
    
    // MARK: - UICollectionViewDataSource
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imagesDictionary.count
    }
    
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> ItemCell {

        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("ItemCell", forIndexPath: indexPath) as! ItemCell
        
        var imgName = imagesDictionary.keys.array[indexPath.row]
        println(imgName)
        cell.imgView.image = UIImage(named: imgName)
        
        return cell
    }
    
    
}

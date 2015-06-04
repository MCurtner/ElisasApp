//
//  FoodViewController.swift
//  Elisas App
//
//  Created by Matthew Curtner on 6/3/15.
//  Copyright (c) 2015 Matthew Curtner. All rights reserved.
//

import UIKit

class FoodViewController: UICollectionViewController {
    
    var foodImages = [AnyObject]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView?.delegate = self
        collectionView?.dataSource = self
        
        let width = CGRectGetWidth(collectionView!.frame) / 3
        let layout = collectionViewLayout as! UICollectionViewFlowLayout
        
        layout.itemSize = CGSize(width: width, height: width)
        

    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        loadImageIntoArray()
        println(foodImages)
    }
    
    
    func loadImageIntoArray() {
        
        let docsPath = NSBundle.mainBundle().resourcePath! + "/food images";
        println(docsPath)
        
        let fileManager = NSFileManager.defaultManager()
        
        var error: NSError?
        let docsArray: [String] = (fileManager.contentsOfDirectoryAtPath(docsPath, error:&error)) as! [String]
            
        for description in docsArray {
            foodImages.append(description)
        }
    }
    
    // MARK: - UICollectionViewDataSource
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return foodImages.count
    }
    
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> ItemCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("ItemCell", forIndexPath: indexPath) as! ItemCell
        
        var imgName: String = foodImages[indexPath.row] as! String
        println(imgName)
        
        cell.imgView.image = UIImage(named: imgName)
        
        return cell
    }

    
}

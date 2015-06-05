//
//  LoadArray.swift
//  Elisas App
//
//  Created by Matthew Curtner on 6/4/15.
//  Copyright (c) 2015 Matthew Curtner. All rights reserved.
//

import Foundation

class LoadArray {
    
    func loadImageIntoArray(#folder: String) -> [String] {
        
        
        var theArray = [String]()
        
        //Get Path to Food Images folder
        let docsPath = NSBundle.mainBundle().resourcePath! + "/" + folder
        println(docsPath)
        
        let fileManager = NSFileManager.defaultManager()
        
        var error: NSError?
        var docsArray: [String] = fileManager.contentsOfDirectoryAtPath(docsPath, error: &error) as! [String]
        //let docsArray: [String] = (fileManager.contentsOfDirectoryAtPath(docsPath, error:&error)) as! [String]
        println(docsArray)
        
        //Iterate through file manager array and store names in imagesArray array
        for name in docsArray {
            
            let theName: String = name
            let stringLength = count(name) // Since swift1.2 `countElements` became `count`
            let substringIndex = stringLength - 4
            
            theArray.append(theName.substringToIndex(advance(name.startIndex, substringIndex)))
        }
        
        println(theArray)
        
        return sorted(theArray, <)
    }
}



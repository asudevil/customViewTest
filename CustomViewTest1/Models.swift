//
//  Models.swift
//  CustomViewTest1
//
//  Created by admin on 6/16/16.
//  Copyright © 2016 CodeWithFelix. All rights reserved.
//

import UIKit

class AppCategory: NSObject {
    
    var name: String?
    var apps: [App]?
    var type: String?
    
    override func setValue(value: AnyObject?, forKey key: String) {
        if key == "apps" {
            
            apps = [App]()
            for dict in value as! [[String: AnyObject]] {
                let app = App()
                app.setValuesForKeysWithDictionary(dict)
                apps?.append(app)
            }
            
        } else {
            super.setValue(value, forKey: key)
        }
    }
    
    static func fetchFeaturedApps(completionHandler: ([AppCategory]) -> ()) {
        
        let urlString = "https://s3.amazonaws.com/spicysuya/CustomizedViewJSON"
        
        NSURLSession.sharedSession().dataTaskWithURL(NSURL(string: urlString)!) { (data, response, error) -> Void in
            
            if error != nil {
                print(error)
                return
            }
            
            do {
                
                let json = try(NSJSONSerialization.JSONObjectWithData(data!, options: .MutableContainers))
                
                var appCategories = [AppCategory]()
                
                for dict in json["categories"] as! [[String: AnyObject]] {
                    let appCategory = AppCategory()
                    appCategory.setValuesForKeysWithDictionary(dict)
                    appCategories.append(appCategory)
                }
                
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    completionHandler(appCategories)
                })
                
            } catch let err {
                print(err)
            }
            }.resume()
    }
}

class App: NSObject {
    
    var id: NSNumber?
    var name: String?
    var category: String?
    var imageName: String?
    var price: NSNumber?
    var size1: NSNumber?
    var size2: NSNumber?
    var size3: NSNumber?
    
}
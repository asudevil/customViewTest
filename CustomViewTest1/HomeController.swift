//
//  HomeController.swift
//  CustomViewTest1
//
//  Created by admin on 6/21/16.
//  Copyright © 2016 CodeWithFelix. All rights reserved.
//

import UIKit

class HomeController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var collectionView: UICollectionView!
    
    private let cellId = "cellId"
    
    var catalog = [Item]()
    var selectedCell = [CatalogCell]()
    var selectedIndex = Int()
    
    let hostname = "yoganinja.myshopify.com"
    let apiKey = "3550fabec3d0bc375beca31e1b895ba6"
    let password = "578dd55eec8acb785ce6641c0173d86a"
    let query = "admin/products.json"
    
    var size = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self

 //       navigationItem.title = "Home"
        collectionView?.backgroundColor = UIColor.whiteColor()
        
        collectionView?.registerClass(NewAppCell.self, forCellWithReuseIdentifier: cellId)
        
        downloadData()
    }

    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return catalog.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
      //  cellSize = 1
        
        let newAttributes = Attributes(inputIndex: indexPath.item)
        newAttributes.imageConstraintText = "H:|-16-[v0]-1-|"
        
//        let rect = CGRect(x: 0, y: 0, width: 100, height: 100)
    
        var cell: NewAppCell //(frame: rect, subViewColor: UIColor.brownColor(), subViewMessage: "Testing\(indexPath.item)")
        
        cell = collectionView.dequeueReusableCellWithReuseIdentifier(cellId, forIndexPath: indexPath) as! NewAppCell
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        print("New Layout size is: \(size)")
        let newSize = 100 * size + 50
        
        return CGSizeMake(view.frame.width, CGFloat(newSize))
        
    }
    
    func downloadData() {
        
        // https://apikey:password@hostname/admin/
        
        let urlString = "https://\(apiKey):\(password)@\(hostname)/\(query)"
        let url = NSURL(string: urlString)!
        let request = NSURLRequest(URL: url)
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithRequest(request){ (data, request, error) -> Void in
            
            if error != nil {
                print(error.debugDescription)
            } else {
                
                do {
                    
                    let dict = try NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments) as? Dictionary<String, AnyObject>
                    
                    if let results = dict!["products"] as? [Dictionary<String, AnyObject>]{
                        
                        for obj in results {
                            let item = Item(itemDict: obj)
                            self.catalog.append(item)
                        }
                        
                        //Main UI thread
                        dispatch_async(dispatch_get_main_queue()) {
                            self.collectionView.reloadData()
                        }
                    }
                } catch {
                    
                }
            }
        }
        task.resume()
    }
}

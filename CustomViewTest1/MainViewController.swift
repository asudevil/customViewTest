//
//  MainViewController.swift
//  CustomViewTest1
//
//  Created by admin on 6/16/16.
//  Copyright © 2016 CodeWithFelix. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    private let cellId = "cellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView?.backgroundColor = UIColor.whiteColor()
        collectionView?.registerClass(AppCell.self, forCellWithReuseIdentifier: cellId)
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell: AppCell
        cell = collectionView.dequeueReusableCellWithReuseIdentifier(cellId, forIndexPath: indexPath) as! AppCell
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        return CGSizeMake(view.frame.width, 230)
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        print("Selected Index is: \(indexPath.item)")

        showAppDetailForApp(indexPath.item)
    }
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 0
    }
    
    func showAppDetailForApp(selectedIndex: Int) {
        
        performSegueWithIdentifier("appDetailsSegue", sender: selectedIndex)
        
//        let layout = UICollectionViewFlowLayout()
//        let appDetailController = AppDetailController(collectionViewLayout: layout)
//        appDetailController.app = app
//        appDetailController.app?.size1 = app.size1
//        
//        print("Inside showAppDetailForApp function.  Size is: \(appDetailController.app?.size1)")
//        
//        navigationController?.pushViewController(appDetailController, animated: true)
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        print("Sender is: \(sender)")
        
        if let homeVC = segue.destinationViewController as? HomeController {
            if let appCellSize = sender{
                homeVC.size = Int(appCellSize as! NSNumber)
                print("PrepareForSegue \(homeVC.size)")
            }
        }
    
    }
}


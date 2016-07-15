//
//  AppCell.swift
//  CustomViewTest1
//
//  Created by admin on 6/16/16.
//  Copyright © 2016 CodeWithFelix. All rights reserved.
//

import UIKit

class AppCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        addSubview(nameLabel)
        addSubview(thumbNailImage)
        addSubview(separatorView)
        
        addConstraintsWithFormat("H:|-16-[v0]-16-|", views: thumbNailImage)
        addConstraintsWithFormat("V:|-16-[v0]-30-|", views: thumbNailImage)
        addConstraintsWithFormat("H:|-16-[v0]-16-|", views: nameLabel)
        addConstraintsWithFormat("V:[v0(20)]-10-|", views: nameLabel)
        addConstraintsWithFormat("H:|[v0]|", views: separatorView)
        addConstraintsWithFormat("V:[v0(1)]|", views: separatorView)

    }

    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Display Store App Name Here"
        label.font = UIFont.systemFontOfSize(20)
        label.numberOfLines = 2
        return label
    }()
    
    let thumbNailImage: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.orangeColor()
        imageView.image = UIImage(named: "shop_icon")
        return imageView
    }()
    
    let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.blueColor()
        return view
    }()

}

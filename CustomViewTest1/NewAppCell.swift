//
//  NewAppCell.swift
//  CustomViewTest1
//
//  Created by admin on 7/1/16.
//  Copyright © 2016 CodeWithFelix. All rights reserved.
//

import UIKit

class NewAppCell: UICollectionViewCell {

    
//    var subViewColor:UIColor
//    var subViewMessage:String
//    
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
        
//        addConstraintsWithFormat(imageConstraintText, views: thumbNailImage)
        addConstraintsWithFormat("V:|-16-[v0]-30-|", views: thumbNailImage)
        addConstraintsWithFormat("H:|-16-[v0]-16-|", views: nameLabel)
        addConstraintsWithFormat("V:[v0(16)]-10-|", views: nameLabel)
        addConstraintsWithFormat("H:|[v0]|", views: separatorView)
        addConstraintsWithFormat("V:[v0(1)]|", views: separatorView)
        
    }
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "These are New App Cells"
        label.font = UIFont.systemFontOfSize(14)
        label.numberOfLines = 2
        return label
    }()
    
    let thumbNailImage: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.grayColor()
        return imageView
    }()
    
    let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.blueColor()
        return view
    }()
    
}

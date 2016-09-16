//
//  SliderKnob.swift
//  STEVE
//
//  Created by Arjun Chib on 9/4/16.
//  Copyright © 2016 Arjun Chib. All rights reserved.
//

import UIKit

class SliderKnob: UIView {
    let body = UIView()
    let ridge = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // Styles
        layer.shadowColor = Color.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 1)
        layer.shadowRadius = 2.0
        layer.shadowOpacity = 0.75
        
        body.backgroundColor = Color.seashell
        body.layer.cornerRadius = 2.0
        body.layer.masksToBounds = true
        
        ridge.backgroundColor = Color.whiteSmoke
        ridge.layer.shadowColor = Color.black.cgColor
        ridge.layer.shadowOffset = CGSize(width: 0, height: 1)
        ridge.layer.shadowRadius = 2.0
        ridge.layer.shadowOpacity = 0.75
        
        // Insert Subviews
        addSubview(body)
        body.addSubview(ridge)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func layout() {
        
        // Make Constraints
        body.snp.makeConstraints { (make) in
            make.edges.equalTo(self).inset(10.0)
        }
        
        ridge.snp.makeConstraints { (make) in
            make.centerY.equalTo(self)
            make.height.equalTo(6)
            make.right.equalTo(0)
            make.left.equalTo(0)
        }
        
        // Shadows
        self.layoutIfNeeded()
        layer.shadowPath = UIBezierPath(roundedRect: body.bounds, cornerRadius: 2.0).cgPath
        layer.shadowOffset = CGSize(width: 10.0, height: 10.0)
    }
}

//
//  SliderTrack.swift
//  STEVE
//
//  Created by Arjun Chib on 9/4/16.
//  Copyright © 2016 Arjun Chib. All rights reserved.
//

import UIKit
import SKInnerShadowLayer

class SliderTrack: UIView {
    let inlet = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // Styles
        backgroundColor = Color.iron
        inlet.backgroundColor = Color.charcoal
        
        // Insert Subviews
        addSubview(inlet)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func layout() {
        // Make Constraints
        inlet.snp_makeConstraints { (make) in
            make.edges.equalTo(self).inset(4.0)
        }
        
        // Inner Shadows
        let innerShadow = SKInnerShadowLayer()
        self.layoutIfNeeded()
        innerShadow.frame = bounds
        innerShadow.innerShadowOffset = CGSize(width: 0, height: 1)
        innerShadow.innerShadowRadius = 1.0
        innerShadow.innerShadowColor = Color.black.CGColor
        innerShadow.innerShadowOpacity = 0.75
        layer.insertSublayer(innerShadow, atIndex: 0)
        
        let inletInnerShadow = SKInnerShadowLayer()
        inlet.layoutIfNeeded()
        inletInnerShadow.frame = inlet.bounds
        inletInnerShadow.innerShadowOffset = CGSize(width: 0, height: 1)
        inletInnerShadow.innerShadowRadius = 5.0
        inletInnerShadow.innerShadowColor = Color.black.CGColor
        inletInnerShadow.innerShadowOpacity = 0.75
        inlet.layer.insertSublayer(inletInnerShadow, atIndex: 0)
    }
}

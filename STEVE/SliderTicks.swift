//
//  SliderTicks.swift
//  STEVE
//
//  Created by Arjun Chib on 9/5/16.
//  Copyright © 2016 Arjun Chib. All rights reserved.
//

import UIKit

class SliderTicks: UIView {
    let numTicks = 9
    var ticks:[UIView] = []
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        for i in 1...numTicks {
            let tick = UIView()
            ticks.append(tick)
            if i == numTicks/2 + numTicks % 2 {
                tick.backgroundColor = Color.salmon
            } else {
                tick.backgroundColor = Color.iron
            }
            addSubview(tick)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func layout() {
        layoutIfNeeded()
        let height = bounds.size.height - 3.0
        
        for i in 0..<numTicks {
            ticks[i].snp.makeConstraints({ (make) in
                make.width.equalTo(self)
                make.height.equalTo(3.0)
                make.top.equalTo(CGFloat(i) * (height / CGFloat(numTicks - 1)))
                make.left.equalTo(0)
            })
        }
    }
}

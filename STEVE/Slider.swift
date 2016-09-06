//
//  Slider.swift
//  STEVE
//
//  Created by Arjun Chib on 9/4/16.
//  Copyright © 2016 Arjun Chib. All rights reserved.
//

import UIKit

enum TicksSide {
    case Left
    case Right
}

class Slider: UIView {
    let track = SliderTrack()
    let knob = SliderKnob()
    let ticks = SliderTicks()
    var ticksSide = TicksSide.Left
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // Gestures
        let pan = UIPanGestureRecognizer(target: self, action: #selector(self.handlePanGesture))
        knob.addGestureRecognizer(pan)
        
        // Insert Subviews
        addSubview(track)
        addSubview(knob)
        addSubview(ticks)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMoveToSuperview() {
        
        // Make Constraints
        snp_makeConstraints { (make) in
            make.width.equalTo(50.0)
            make.height.equalTo(220.0)
        }
        
        track.snp_makeConstraints { (make) in
            make.width.equalTo(13.0)
            make.top.equalTo(23.0)
            make.bottom.equalTo(-23.0)
            make.centerX.equalTo(self)
        }
        
        knob.snp_makeConstraints { (make) in
            make.width.equalTo(self)
            make.height.equalTo(45.0)
            make.centerX.equalTo(self)
            make.centerY.equalTo(self)
        }
        
        ticks.snp_makeConstraints { (make) in
            make.width.equalTo(22.0)
            make.top.equalTo(23.0)
            make.bottom.equalTo(-23.0)
            if (ticksSide == .Left) {
                make.right.equalTo(track.snp_left).offset(-35.0)
            } else {
                make.left.equalTo(track.snp_right).offset(35.0)
            }
        }
        
        track.layout()
        knob.layout()
        ticks.layout()
    }
    
    func handlePanGesture(panGesture: UIPanGestureRecognizer) {
        let translation = panGesture.translationInView(self)
        panGesture.setTranslation(CGPointZero, inView: self)
        
        knob.layoutIfNeeded()
        let newYPos = knob.frame.origin.y + translation.y
        if (newYPos >= bounds.origin.y - knob.frame.height/2 + 23.0 && newYPos < bounds.origin.y + bounds.size.height - knob.frame.height/2 - 23.0) {
            knob.frame = CGRectMake(knob.frame.origin.x, newYPos, knob.frame.size.width, knob.frame.size.height)
        }
    }
}

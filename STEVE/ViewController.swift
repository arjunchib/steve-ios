//
//  ViewController.swift
//  STEVE
//
//  Created by Arjun Chib on 9/3/16.
//  Copyright © 2016 Arjun Chib. All rights reserved.
//

import UIKit
import SnapKit
import AlamofireImage
import Alamofire
import SKInnerShadowLayer

class ViewController: UIViewController, NSURLConnectionDelegate {
    let gradient = CAGradientLayer()
    let videoPlayerFrameView = UIView()
    let videoPlayerView = UIImageView()
    
    override func loadView() {
        super.loadView()
        
        gradient.frame = view.bounds
        gradient.colors = [Color.white.CGColor, Color.offWhite.CGColor]
        view.layer.insertSublayer(gradient, atIndex: 0)
        
        videoPlayerFrameView.backgroundColor = Color.darkGray
        videoPlayerFrameView.clipsToBounds = true
        videoPlayerFrameView.layer.cornerRadius = 8.0
        
        videoPlayerView.image = UIImage(named: "hello")
        
        view.addSubview(videoPlayerFrameView)
        videoPlayerFrameView.addSubview(videoPlayerView)
        
        videoPlayerFrameView.snp_makeConstraints { (make) in
            make.left.equalTo(10)
            make.right.equalTo(-10)
            make.top.equalTo(10)
            make.height.equalTo((screenwidth - 20) / 1.5 + 32)
        }
        
        videoPlayerView.snp_makeConstraints { (make) in
            make.left.equalTo(10)
            make.right.equalTo(-10)
            make.top.equalTo(10)
            make.height.equalTo((screenwidth - 40) / 1.5)
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let innerShadow = SKInnerShadowLayer()
        videoPlayerFrameView.layoutIfNeeded()
        innerShadow.frame = videoPlayerFrameView.bounds
        innerShadow.innerShadowOffset = CGSize(width: 0, height: 1)
        innerShadow.innerShadowRadius = 5.0
        innerShadow.innerShadowColor = Color.black.CGColor
        innerShadow.innerShadowOpacity = 0.5
        videoPlayerFrameView.layer.insertSublayer(innerShadow, atIndex: 0)
        
//        let url = "http://143.215.108.131/stream/video.mjpeg"
//        let request = Alamofire.request(.GET, url)
//        request.responseImage(1.0, inflateResponseImage: false) { (response) in
//            if (response.result.error == nil) {
//                self.videoPlayerView.image = response.result.value
//            } else {
//                print(response.result.error)
//            }
//        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


//
//  ViewController.swift
//  STEVE
//
//  Created by Arjun Chib on 9/3/16.
//  Copyright © 2016 Arjun Chib. All rights reserved.
//

import UIKit
import SnapKit
import Alamofire
import SKInnerShadowLayer
import SocketIO

class ViewController: UIViewController, NSURLConnectionDelegate {
    let gradient = CAGradientLayer()
    
    let videoPlayerFrameView = UIView()
    let videoPlayerView = UIImageView()
    let steveTag = UILabel()
    let sliderLeft = Slider()
    let sliderRight = Slider()
    
    override func loadView() {
        super.loadView()
        
        // Styles
        gradient.frame = view.bounds
        gradient.colors = [Color.desertStorm.cgColor, Color.white.cgColor]
        view.layer.insertSublayer(gradient, at: 0)
        
        videoPlayerFrameView.backgroundColor = Color.balticSea
        videoPlayerFrameView.clipsToBounds = true
        videoPlayerFrameView.layer.cornerRadius = 8.0
        
        steveTag.font = UIFont(name: "Arista 2.0", size: 24.0)
        steveTag.textColor = Color.whiteSmoke
        
        sliderLeft.ticksSide = .Left
        sliderRight.ticksSide = .Right
        
        // Insert Subviews
        view.addSubview(videoPlayerFrameView)
        videoPlayerFrameView.addSubview(videoPlayerView)
    
        view.addSubview(sliderLeft)
        view.addSubview(sliderRight)
        
        // Make Constraints
        videoPlayerFrameView.snp.makeConstraints { (make) in
            make.left.equalTo(10)
            make.right.equalTo(-10)
            make.top.equalTo(10)
            make.height.equalTo((screenwidth - 20) / 1.5 + 32)
        }
        
        videoPlayerView.snp.makeConstraints { (make) in
            make.left.equalTo(10)
            make.right.equalTo(-10)
            make.top.equalTo(10)
            make.height.equalTo((screenwidth - 40) / 1.5)
        }
        
        sliderLeft.snp.makeConstraints { (make) in
            make.centerX.equalTo(view).offset(-60.0)
            make.top.equalTo(videoPlayerFrameView.snp.bottom).offset(15.0)
        }
        
        sliderRight.snp.makeConstraints { (make) in
            make.centerX.equalTo(view).offset(60.0)
            make.top.equalTo(videoPlayerFrameView.snp.bottom).offset(15.0)
        }
        
        // Inner Shadows
        let innerShadow = SKInnerShadowLayer()
        videoPlayerFrameView.layoutIfNeeded()
        innerShadow.frame = videoPlayerFrameView.bounds
        innerShadow.innerShadowOffset = CGSize(width: 0, height: 1)
        innerShadow.innerShadowRadius = 5.0
        innerShadow.innerShadowColor = Color.black.cgColor
        innerShadow.innerShadowOpacity = 0.75
        videoPlayerFrameView.layer.insertSublayer(innerShadow, at: 0)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let socket = SocketIOClient(socketURL: URL(string: "http://143.215.104.197:8006")!)
        
        socket.on("connect") {data, ack in
            print("socket connected")
            socket.emit("100 -100")
        }
        
        socket.connect()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func startVideoStream() {
        let url = "http://143.215.108.131:8080/stream/video.mjpeg"
        let imageData = NSMutableData()
        let startData = String("ffd8").dataFromHexadecimalString()
        
        let request = Alamofire.request(url)
        request.stream { data in
            let subData = data.subdata(in: Range(uncheckedBounds: (lower: 0, upper: 2)))
            if subData == startData {
                let image = UIImage(data: imageData as Data)
                imageData.length = 0
                DispatchQueue.main.async() {
                    self.videoPlayerView.image = image
                }
            }
            imageData.append(data)
        }
    }

}


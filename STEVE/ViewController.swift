//
//  ViewController.swift
//  STEVE
//
//  Created by Arjun Chib on 9/3/16.
//  Copyright © 2016 Arjun Chib. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    let videoPlayerView = UIImageView()
    
    override func loadView() {
        view.addSubview(videoPlayerView)
        
        videoPlayerView.snp_makeConstraints { (make) in
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.height.equalTo(screenwidth / 1.5)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


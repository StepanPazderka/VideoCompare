//
//  ViewController.swift
//  VideoCompare
//
//  Created by Steve on 20/08/2020.
//  Copyright © 2020 Stepan Pazderka. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var left_videoView: UIView!
    
    @IBOutlet weak var right_video: UIView!
    
    var left_videoPlayer: AVPlayer!
    var left_playerLayer: AVPlayerLayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: "https://content.jwplatform.com/manifests/vM7nH0Kl.m3u8")!
//        let url = URL(string: "https://www.radiantmediaplayer.com/media/bbb-360p.mp4")!
        left_videoPlayer = AVPlayer(url: url)
        left_playerLayer = AVPlayerLayer(player: left_videoPlayer)
        
        left_playerLayer.videoGravity = .resize
        left_videoView.layer.addSublayer(left_playerLayer)
//        self.viewDidLayoutSubviews()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        left_videoPlayer.play()
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        left_playerLayer.frame = left_videoView.bounds
    }

}


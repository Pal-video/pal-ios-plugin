//
//  session.swift
//  pal2
//
//  Created by Dimitri Dessus on 16/11/2022.
//

import Foundation
import UIKit
import AVKit
import Pulsator

class VideoBubbleView: UIView {
  private var playerLooper: AVPlayerLooper!
  private var queuePlayer: AVQueuePlayer!
  private var pulsator: Pulsator!
  
  public func draw(circleSize: Double, videoAsset: String) {
    let item = AVPlayerItem(url: URL(string: videoAsset)!)
    self.queuePlayer = AVQueuePlayer(playerItem: item)
    self.playerLooper = AVPlayerLooper(player: queuePlayer, templateItem: item)
    NotificationCenter.default.addObserver(self, selector: #selector(getTime(_:)),name: nil,object: nil)
    
    let playerLayer = AVPlayerLayer(player: self.queuePlayer)
    let circlePath = UIBezierPath(arcCenter: CGPoint(x: circleSize, y: circleSize), radius: CGFloat(circleSize), startAngle: CGFloat(0), endAngle: CGFloat(Double.pi * 2), clockwise: true)
    playerLayer.videoGravity = .resizeAspectFill
    playerLayer.frame = circlePath.bounds
    playerLayer.masksToBounds = true
    playerLayer.cornerRadius = circleSize
    playerLayer.zPosition = 10
    
    self.frame.size = playerLayer.frame.size
    self.layer.addSublayer(playerLayer)
    
    pulsator = Pulsator()
    pulsator.position.x = self.frame.size.width/2
    pulsator.position.y = self.frame.size.height/2
    pulsator.zPosition = 1
    pulsator.radius = 95
    pulsator.numPulse = 2
    self.layer.addSublayer(pulsator)
    
    self.queuePlayer.isMuted = true
    self.queuePlayer.play()
    
  }
  
  @objc func getTime(_ notification: Notification) {
    if ((self.queuePlayer.rate != 0) && (self.queuePlayer.error == nil)) {
      if (!pulsator.isPulsating) {
        pulsator.start()
      }
    }
  }
}

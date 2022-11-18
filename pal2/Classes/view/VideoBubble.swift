//
//  session.swift
//  pal2
//
//  Created by Dimitri Dessus on 16/11/2022.
//

import Foundation
import UIKit
import AVKit

class VideoBubbleView: UIView {
  private var playerLooper: AVPlayerLooper!
  private var queuePlayer: AVQueuePlayer!

  public func draw(parentHeight: Double, videoAsset: String) {
    let circleSize = 50.0
    let padding = 25.0
    
    let item = AVPlayerItem(url: URL(string: videoAsset)!)
    self.queuePlayer = AVQueuePlayer(playerItem: item)
    self.playerLooper = AVPlayerLooper(player: queuePlayer, templateItem: item)
    
    let playerLayer = AVPlayerLayer(player: self.queuePlayer)
    let circlePath = UIBezierPath(arcCenter: CGPoint(x: circleSize, y: circleSize), radius: CGFloat(circleSize), startAngle: CGFloat(0), endAngle: CGFloat(Double.pi * 2), clockwise: true)
    playerLayer.videoGravity = .resizeAspectFill
    playerLayer.frame = circlePath.bounds
    playerLayer.masksToBounds = true
    playerLayer.cornerRadius = circleSize
    
    self.frame.size = playerLayer.frame.size
    self.frame.origin.x = (circleSize / 2)
    self.frame.origin.y = parentHeight - (circleSize * 2 + padding)
    self.layer.addSublayer(playerLayer)
    
    self.queuePlayer.isMuted = true
    self.queuePlayer.play()
  }
}

//
//  session.swift
//  pal2
//
//  Created by Dimitri Dessus on 16/11/2022.
//

import Foundation
import UIKit

//struct SurveyVideoData {
//  let videoAsset: String
//  let userName: String
//  let companyTitle: String
//  let question: String
//  let choices: [Choice]
//  let avatarUrl: String?
//}

struct TalkVideoData {
  let videoAsset: String
  let videoThumbUrl: String
  let userName: String
  let companyTitle: String
  let avatarUrl: String?
}

class PalSdk {
  let kCircleSize = 60.0
  let kBubbleViewTag = 10
  let kVideoViewTag = 15
  
  private var padding = 25.0
  
  private var parentView: UIView!
  private var palView: UIView = UIView()
  private var videoView: VideoView?
  
  private var onVideoEnd: (() -> Void)?
  private var onExpand: (() -> Void)?
  private var onSkip: (() -> Void)?
  
  private var talkVideoData: TalkVideoData?
  
  init() {
    var bottomSafeAreaHeight: CGFloat = 0
    
    if #available(iOS 11.0, *) {
      let window = UIApplication.shared.windows[0]
      let safeFrame = window.safeAreaLayoutGuide.layoutFrame
      bottomSafeAreaHeight = window.frame.maxY - safeFrame.maxY
    }
    
    padding = bottomSafeAreaHeight
  }
  
  public func showVideoOnly(view: UIView, videoAsset: String, videoThumbUrl: String, userName: String, companyTitle: String, avatarUrl: String? = nil, onVideoEnd: (() -> Void)? = nil, onSkip: (() -> Void)? = nil, onExpand: (() -> Void)? = nil) {
    parentView = view
    self.onVideoEnd = onVideoEnd
    self.onSkip = onSkip
    self.onExpand = onExpand
    
    talkVideoData = TalkVideoData(videoAsset: videoAsset, videoThumbUrl: videoThumbUrl, userName: userName, companyTitle: companyTitle, avatarUrl: avatarUrl)
    
    showVideoBubble(view: view, videoAsset: videoThumbUrl)
  }
  
  private func showVideoBubble(view: UIView, videoAsset: String) {
    let bubble = VideoBubbleView()
    bubble.alpha = 0
    bubble.draw(circleSize: kCircleSize, videoAsset: videoAsset)
    bubble.isUserInteractionEnabled = true
    bubble.tag = kBubbleViewTag
    
    let tap = UITapGestureRecognizer(target: self, action: #selector(self.onBubbleTap(_:)))
    bubble.addGestureRecognizer(tap)
    
    palView.layer.cornerRadius = bubble.layer.cornerRadius
    palView.frame.origin.x = (kCircleSize / 2)
    palView.frame.origin.y = view.frame.size.height - (kCircleSize * 2 + padding)
    palView.frame.size = bubble.frame.size
    
    palView.addSubview(bubble)
    view.addSubview(palView)
    
    UIView.animate(withDuration: 1.0, delay: 1, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: [.curveEaseIn], animations: {
      bubble.transform = .identity
      bubble.alpha = 1
      let generator = UIImpactFeedbackGenerator(style: .light)
      generator.impactOccurred()
    }, completion: nil)
  }
  
  @objc func onBubbleTap(_ sender: UITapGestureRecognizer? = nil) {
    let generator = UIImpactFeedbackGenerator(style: .light)
    generator.impactOccurred()
    
    self.onExpand?()
    
    let frameWidth = parentView.frame.size.width * 0.85
    let frameHeight = frameWidth * 16.0/9.0
    let videoFrame = CGRect(x: 0, y: (parentView.frame.size.height - frameHeight) , width: frameWidth, height: frameHeight)
    
    removeView(tag: kBubbleViewTag)
    
    videoView = VideoView()
    videoView!.isUserInteractionEnabled = true
    videoView!.initVideoPlayer(videoAsset: talkVideoData!.videoAsset)
    videoView!.initVideoAuthor(author: talkVideoData!.userName, company: talkVideoData!.companyTitle)
    videoView!.onClose = skipVideo
    videoView!.onVideoEnd = videoViewed
    videoView!.tag = kVideoViewTag
    self.palView.addSubview(videoView!)
    
    UIView.animate(withDuration: 0.4, delay: 0.1, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {
      self.palView.layoutIfNeeded()
      self.palView.frame = videoFrame
      self.palView.layer.cornerRadius = 16.0
      self.palView.layer.masksToBounds = true
      self.videoView!.frame.size = self.palView.frame.size
    })
  }
  
  func skipVideo() -> Void {
    if (self.videoView == nil) {
      return
    }
    
    self.onSkip?()
    self.closeVideoModal()
  }
  
  func videoViewed() -> Void {
    if (self.videoView == nil) {
      return
    }
    
    self.onVideoEnd?()
    self.closeVideoModal()
  }
  
  func closeVideoModal() -> Void {
    UIView.animate(withDuration: 0.4, delay: 0.1, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {
      self.palView.layoutIfNeeded()
      self.palView.frame.origin.x = (self.kCircleSize / 2)
      self.palView.frame.origin.y = self.parentView.frame.size.height - (self.kCircleSize + self.padding)
      self.palView.frame.size = CGSize.zero
      self.videoView!.frame.size = self.palView.frame.size
    }) { (_) in
      self.removeView(tag: self.kVideoViewTag)
    }
  }
  
  func removeView(tag: Int) -> Void {
    if let viewWithTag = palView.viewWithTag(tag) {
      viewWithTag.removeFromSuperview()
    }
  }
}

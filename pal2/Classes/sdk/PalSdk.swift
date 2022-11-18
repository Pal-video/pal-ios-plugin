//
//  session.swift
//  pal2
//
//  Created by Dimitri Dessus on 16/11/2022.
//

import Foundation
import UIKit

class PalSdk {
  private var parentView: UIView!
  
  init() {}
  
  public func showSingleChoiceSurvey(view: UIView, videoAsset: String, userName: String, companyTitle: String, question: String, choices: [Choice], avatarUrl: String? = nil) {
    parentView = view
    showVideoBubble(view: view, videoAsset: videoAsset)
  }
  
  private func showVideoBubble(view: UIView, videoAsset: String) {
    let bubble = VideoBubbleView()
    bubble.draw(parentHeight: view.frame.size.height, videoAsset: videoAsset)
    bubble.isUserInteractionEnabled = true
    let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
    bubble.addGestureRecognizer(tap)
    
    view.addSubview(bubble)
  }
  
  @objc func handleTap(_ sender: UITapGestureRecognizer? = nil) {
    debugPrint("PLS")
    
//    let videoView = VideoView()
//    videoView.frame = CGRect(x: 0, y: 0, width: parentView.frame.size.width - 60, height: parentView.frame.size.height - 60)
//    videoView.backgroundColor = UIColor.red
//    parentView.addSubview(videoView)
  }
}

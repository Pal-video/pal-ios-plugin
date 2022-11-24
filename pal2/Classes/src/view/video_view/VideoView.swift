//
//  VideoView.swift
//  pal2
//
//  Created by Dimitri Dessus on 18/11/2022.
//

import Foundation
import AVKit

class VideoView: UIView {
  @IBOutlet weak var contentView: UIView!
  @IBOutlet weak var videoOwner: UIView!
  @IBOutlet weak var mediaPlayer: UIView!
  @IBOutlet weak var palLogo: UIImageView!
  @IBOutlet weak var closeButton: UIButton!
  @IBOutlet weak var videoRole: UILabel!
  @IBOutlet weak var videoCaster: UILabel!
  @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
  @IBOutlet weak var bottomBanner: UIView!
  @IBOutlet weak var poweredBy: UILabel!
  @IBOutlet weak var duration: UIButton!
  
  private var player: AVPlayer!
  private var avPlayerLayer: AVPlayerLayer!
  private var totalDuration: String!
  
  internal var onClose: (() -> Void)!
  internal var onVideoEnd: (() -> Void)!
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setup()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setup()
  }
  
  @IBAction func onCloseAction(sender: UIButton? = nil) {
    let generator = UIImpactFeedbackGenerator(style: .light)
    generator.impactOccurred()
    
    stopPlayer()
    onClose?()
  }
  
  private func stopPlayer() {
    player.seek(to: CMTime.zero)
    player.pause()
  }
  
  private func setup() {
    contentView = loadViewFromNib()
    contentView.frame = bounds
    contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    contentView.translatesAutoresizingMaskIntoConstraints = true
    contentView.layer.cornerRadius = 16.0
    self.layer.cornerRadius = 16.0
    addSubview(contentView)
    
    initVideoOwnerView()
    
    duration.clipsToBounds = true
    duration.layer.cornerRadius = 13
    duration.backgroundColor = UIColor.black
    duration.titleLabel?.font = UIFont(name: "Inter-Bold", size: 14)
    duration.isUserInteractionEnabled = false
    duration.layer.zPosition = 15
    duration.contentEdgeInsets = UIEdgeInsets(top: 5.0, left: 12.0, bottom: 5.0, right: 12.0)
    
    closeButton.layer.zPosition = 15
    videoOwner.layer.zPosition = 15
    
    bottomBanner.layer.zPosition = 15
    bottomBanner.alpha = 0.9
    
    let tap = UITapGestureRecognizer(target: self, action: #selector(self.onBottomBannerTap(_:)))
    bottomBanner.addGestureRecognizer(tap)
    
    let frameworkBundle = Bundle(for: PalPlugin.self)
    guard let resourcePath = frameworkBundle.path(forResource: "Pal2Ressources", ofType:"bundle"),
          let resourceBundle = Bundle(path: resourcePath)
    else {
      return
    }
    
    palLogo.image = UIImage(named: "logo", in: resourceBundle, compatibleWith: nil)
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    
    self.layoutIfNeeded()
    avPlayerLayer.frame = self.mediaPlayer.frame
  }
  
  @objc func onBottomBannerTap(_ sender: UITapGestureRecognizer? = nil) {
    if let url = URL(string: "https://pal.video/") {
      let generator = UIImpactFeedbackGenerator(style: .light)
      generator.impactOccurred()
      
      UIApplication.shared.open(url)
    }
  }
  
  private func initVideoOwnerView() -> Void {
    // video owner view
    videoOwner.backgroundColor = UIColor.black
    videoOwner.alpha = 0.9
    videoOwner.layer.cornerRadius = 16.0
    
    // video role
    videoRole.font = UIFont(name: "Inter-Regular", size: 15)
    videoRole.alpha = 0.6
    
    // video caster label
    videoCaster.font = UIFont(name: "Inter-Bold", size: 18)
  }
  
  func initVideoPlayer(videoAsset: String) {
    loadingIndicator.startAnimating()
    
    let videoURL = URL(string: videoAsset)
    player = AVPlayer(url: videoURL!)
    avPlayerLayer = AVPlayerLayer(player: player)
    avPlayerLayer.frame = self.mediaPlayer.bounds
    avPlayerLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
    mediaPlayer.layer.addSublayer(avPlayerLayer)
    mediaPlayer.layer.zPosition = 1
    player.play()
    
    // set observers
    player.addObserver(self, forKeyPath: "rate", options: NSKeyValueObservingOptions.new, context: nil)
    NotificationCenter.default.addObserver(self,selector: #selector(getTime(_:)),name: nil,object: nil)
    NotificationCenter.default.addObserver(self, selector:#selector(self.playerDidFinishPlaying(note:)),name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: player.currentItem)
  }
  
  @objc func getTime(_ notification: Notification) {
    let currentTime = player.currentItem?.currentTime().positionalTime
    let totalDuration = player.currentItem?.asset.duration.positionalTime
    DispatchQueue.main.async {
      self.duration.setTitle("\(currentTime ?? "00:00") / \(totalDuration ?? "00:00")", for: .normal)
    }
  }
  
  override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
    if keyPath == "rate" {
      if player.rate > 0 {
        self.loadingIndicator.stopAnimating()
      }
    }
  }
  
  @objc func playerDidFinishPlaying(note: NSNotification) {
    self.onVideoEnd?()
  }
  
  func initVideoAuthor(author: String, company: String) {
    videoCaster.text = author
    videoRole.text = company
  }
  
  private func loadViewFromNib() -> UIView {
    let bundle = Bundle(for: VideoView.self)
    let nib = UINib(nibName: "VideoView", bundle: bundle)
    return nib.instantiate(withOwner: self, options: nil).first as! UIView
  }
}

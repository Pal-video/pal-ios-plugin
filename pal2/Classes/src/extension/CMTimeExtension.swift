//
//  CMTimeExtension.swift
//  pal2
//
//  Created by Dimitri Dessus on 22/11/2022.
//

import Foundation
import AVKit

extension CMTime {
  var roundedSeconds: TimeInterval {
    return seconds.rounded()
  }
  var hours:  Int { return Int(roundedSeconds / 3600) }
  var minute: Int { return Int(roundedSeconds.truncatingRemainder(dividingBy: 3600) / 60) }
  var second: Int { return Int(roundedSeconds.truncatingRemainder(dividingBy: 60)) }
  var positionalTime: String {
    return hours > 0 ?
    String(format: "%d:%02d:%02d",
           hours, minute, second) :
    String(format: "%02d:%02d",
           minute, second)
  }
}

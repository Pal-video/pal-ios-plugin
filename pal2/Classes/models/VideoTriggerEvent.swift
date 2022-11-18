//
//  session.swift
//  pal2
//
//  Created by Dimitri Dessus on 16/11/2022.
//

import Foundation

enum VideoTriggerEvents: CustomStringConvertible {
  case videoSkip, minVideoOpen, videoViewed, answer
  
  var description : String {
    switch self {
    case .videoSkip: return "videoSkip"
    case .minVideoOpen: return "minVideoOpen"
    case .videoViewed: return "videoViewed"
    case .answer: return "answer"
    }
  }
}

class VideoTriggerEvent {
  private let type: VideoTriggerEvents
  private let time: Date
  private let sessionId: String
  private let args: [String: Any]?
  
  init(type: VideoTriggerEvents, time: Date, sessionId: String, args: [String : Any]? = nil) {
    self.type = type
    self.time = time
    self.sessionId = sessionId
    self.args = args
  }
  
  static public func singleChoice(sessionId: String, choiceCode: String) -> VideoTriggerEvent {
    return VideoTriggerEvent(type: VideoTriggerEvents.answer, time: Date(), sessionId: sessionId, args: ["answer" : choiceCode])
  }
  
  static public func videoOpen(sessionId: String) -> VideoTriggerEvent {
    return VideoTriggerEvent(type: VideoTriggerEvents.minVideoOpen, time: Date(), sessionId: sessionId)
  }
  
  static public func videoSkipped(sessionId: String) -> VideoTriggerEvent {
    return VideoTriggerEvent(type: VideoTriggerEvents.videoSkip, time: Date(), sessionId: sessionId)
  }
  
  static public func videoViewed(sessionId: String) -> VideoTriggerEvent {
    return VideoTriggerEvent(type: VideoTriggerEvents.videoViewed, time: Date(), sessionId: sessionId)
  }
  
  public func toMap() -> [String: Any] {
    var dict: [String : Any] = ["time": self.time.timeIntervalSince1970, "type": self.type.description, "sessionId": self.sessionId]
    if (args != nil) {
      dict["attrs"] = args!
    }
    return dict
  }
}

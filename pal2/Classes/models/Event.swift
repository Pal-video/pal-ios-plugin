//
//  session.swift
//  pal2
//
//  Created by Dimitri Dessus on 16/11/2022.
//

import Foundation

enum PalEvents: CustomStringConvertible {
  case login, logout, setScreen, setButtonClick
  
  var description : String {
    switch self {
    case .login: return "login"
    case .logout: return "logout"
    case .setScreen: return "setScreen"
    case .setButtonClick: return "setButtonClick"
    }
  }
}

class PalEvent {
  private let name: String
  private let type: PalEvents
  private let sessionUid: String
  private let attributes: [String: Any?]?
  
  public init(name: String, type: PalEvents, sessionUid: String, attributes: [String : Any?]?) {
    self.name = name
    self.type = type
    self.sessionUid = sessionUid
    self.attributes = attributes
  }
  
  public func toMap() -> [String: Any?] {
    return ["sessionUId": self.sessionUid, "name": self.name, "type": self.type.description, "attrs": attributes]
  }
}

class PalVideoTrigger: Codable {
  let eventLogId: String?
  let videoId: String?
  let creationDate: Int
  let videoUrl: String?
  let videoThumbUrl: String?
  let imgThumbUrl: String?
  let videoSpeakerName: String?
  let videoSpeakerRole: String?
  let survey: Survey?
  
  init(eventLogId: String?, videoId: String?, creationDate: Int, videoUrl: String?, videoThumbUrl: String?, imgThumbUrl: String?, videoSpeakerName: String?, videoSpeakerRole: String?, survey: Survey?) {
    self.eventLogId = eventLogId
    self.videoId = videoId
    self.creationDate = creationDate
    self.videoUrl = videoUrl
    self.videoThumbUrl = videoThumbUrl
    self.imgThumbUrl = imgThumbUrl
    self.videoSpeakerName = videoSpeakerName
    self.videoSpeakerRole = videoSpeakerRole
    self.survey = survey
  }
  
  public var isSurveyType: Bool {
    get {
      return self.survey != nil
    }
  }

  public var isTalkType: Bool {
    get {
      return self.survey == nil
    }
  }
}

struct Survey: Codable {
  var question: String
  // var options: ChoiceItem[]
  // TODO: options
}

struct ChoiceItem: Codable {
  var id: String
  var text: String
}

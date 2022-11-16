//
//  session.swift
//  pal2
//
//  Created by Dimitri Dessus on 16/11/2022.
//

import Foundation

struct PalSession: Codable {
  let uid: String
}

class PalSessionRequest: Codable {
  private var frameworkType: String
  private var platform: String
  
  public init() {
    self.frameworkType = "SWIFT"
    self.platform = "iOS" // TODO: add dynamic macos, ios, ...
  }
  
  public func toMap() -> [String: Any] {
    return ["platform": self.platform, "frameworkType": self.frameworkType]
  }
}

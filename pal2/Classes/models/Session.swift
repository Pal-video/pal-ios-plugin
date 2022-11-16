//
//  session.swift
//  pal2
//
//  Created by Dimitri Dessus on 16/11/2022.
//

import Foundation

class PalSession {
  private var uid: String
  
  public init(uid: String) {
    self.uid = uid
  }
}

class PalSessionRequest {
  private var frameworkType: String
  private var platform: String
  
  public init(frameworkType: String, platform: String) {
    self.frameworkType = frameworkType
    self.platform = platform
  }
}

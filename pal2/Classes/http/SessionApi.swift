//
//  EventApi.swift
//  pal2
//
//  Created by Dimitri Dessus on 16/11/2022.
//

import AFNetworking

class SessionApi {
  private var manager: AFHTTPSessionManager
  private var apiToken: String
  private var userDefaults = UserDefaults.standard
  private var palSession: PalSession?
  
  private var SessionId: String = "sessionId"
  
  public init(manager: AFHTTPSessionManager, apiToken: String) {
    self.manager = manager
    self.apiToken = apiToken
  }
  
  public func initSession() {
    let savedSessionId = userDefaults.string(forKey: SessionId)
    if (savedSessionId != nil && !savedSessionId!.isEmpty) {
      palSession = PalSession(uid: savedSessionId!)
      return;
    }
    
    manager.post("/sessions", parameters: nil, headers: ["": ""]), success: { (operation, responseObject) in
      if let dic = responseObject as? [String: Any], let matches = dic["matches"] as? [[String: Any]] {
        print(matches)
      }
    }
    
    
    userDefaults.set("ID", forKey: SessionId)
  }
  
  
}

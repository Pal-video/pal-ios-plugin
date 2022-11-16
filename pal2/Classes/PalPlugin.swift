//
//  PalPlugin.swift
//  pal2
//
//  Created by Dimitri Dessus on 15/11/2022.
//

import Foundation
import AFNetworking

public class PalPlugin {
  public static let sharedInstance = PalPlugin()
  private var apiToken: String?
  private var serverUrl: String = "https://back.pal.video"
  
  private var sessionApi: SessionApi?
  
  
  public init() {}
  
  public func setup(apiToken: String, serverUrl: String? = nil) {
    self.apiToken = apiToken
    if (serverUrl != nil) {
      self.serverUrl = serverUrl!
    }
    
    let manager = AFHTTPSessionManager(baseURL: URL(string: self.serverUrl))
    manager.requestSerializer = AFJSONRequestSerializer()
    manager.responseSerializer = AFJSONResponseSerializer()
    
    self.sessionApi = SessionApi(
      manager: manager, apiToken: self.apiToken!
    )
  }
  
  public func logCurrentScreen(route: String) throws {
    if (self.sessionApi == nil) {
      // TODO: throw error
      
      return
    }
    
    
  }
}


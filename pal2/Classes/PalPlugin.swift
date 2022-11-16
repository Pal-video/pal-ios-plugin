//
//  PalPlugin.swift
//  pal2
//
//  Created by Dimitri Dessus on 15/11/2022.
//

import Foundation

public class PalPlugin {
  public static let sharedInstance = PalPlugin()
  
  // Http
  private var apiToken: String?
  lazy private var serverUrl: String = "https://back.pal.video"
  
  // Apis
  private var sessionApi: SessionApi?
  private var eventApi: EventApi?
  
  public init() {}
  
  public func setup(apiToken: String, serverUrl: String? = nil) {
    self.apiToken = apiToken
    if (serverUrl != nil) {
      self.serverUrl = serverUrl!
    }
    
    let httpClient = HttpClient(baseUrl: self.serverUrl, apiToken: self.apiToken!)
    
    // initialize all apis
    self.sessionApi = SessionApi(
      httpClient: httpClient
    )
    self.eventApi = EventApi(
      httpClient: httpClient
    )
    self.sessionApi!.initSession()
  }
  
  public func logCurrentScreen(route: String) {
    if (!(self.sessionApi?.hasSession ?? false)) {
      // TODO: throw error
      debugPrint("⚠️ You need to have a session!")
      return
    }
    
    self.eventApi?.logCurrentScreen(session: self.sessionApi!.session, name: route)
  }
}


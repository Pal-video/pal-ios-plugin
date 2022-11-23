//
//  EventApi.swift
//  pal2
//
//  Created by Dimitri Dessus on 16/11/2022.
//

import Foundation

class PalTriggeredEventApi {
  private var httpClient: HttpClient
  
  private var resultEvents: [String: [VideoTriggerEvent]] = [:]
  
  init(httpClient: HttpClient) {
    self.httpClient = httpClient
  }
  
  /// save this event
  /// you have to call [send] to store this in remote server
  public func save(event: VideoTriggerEvent, eventlogId: String? = nil) {
    if (eventlogId == nil || eventlogId!.isEmpty) {
      return;
    }
    
    let list = resultEvents[eventlogId!]
    if (list == nil) {
      resultEvents[eventlogId!] = []
    }
    
    resultEvents[eventlogId!]?.append(event)
  }
  
  /// calls remote server to store all these events related to
  /// [videoTriggerId] the video id
  public func send() {
    if (self.resultEvents.isEmpty) {
      return
    }
    
    self.resultEvents.forEach() {item in
      item.value.forEach { event in
        httpClient.executeQuery(data: event.toMap(), endpoint: "/eventlogs/\(item.key)") { (result: Result<[String: String]?, Error>) in
          switch result {
          case .failure(let error):
            debugPrint("⛔️ Event \(item.key) not sent! (\(error)")
          case .success(_):
            debugPrint("✅ Event \(item.key) sent sucessfully!")
          }
          
          // remove event even if on error ?
          self.resultEvents.removeValue(forKey: item.key)
        }
      }
    }
  }
}

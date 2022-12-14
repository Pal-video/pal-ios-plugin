//
//  EventApi.swift
//  pal2
//
//  Created by Dimitri Dessus on 16/11/2022.
//

import Foundation

class EventApi {
  private var httpClient: HttpClient
  
  public init(httpClient: HttpClient) {
    self.httpClient = httpClient
  }
  
  public func logCurrentScreen(session: PalSession, name: String, completion: @escaping (PalVideoTrigger?) -> Void) {
    let palEvent = PalEvent(name: name, type: PalEvents.setScreen, sessionUid: session.uid, attributes: ["name": name])
    logEvent(event: palEvent) { palVideoTrigger in
      completion(palVideoTrigger)
    }
  }
  
  private func logEvent(event: PalEvent, completion: @escaping (PalVideoTrigger?) -> Void) {
    let parameters = event.toMap()
    httpClient.executeQuery(data: parameters, endpoint: "/eventlogs") { (result: Result<PalVideoTrigger?, Error>) in
      switch result {
      case .failure(let error):
        debugPrint(error)
      case .success(let palVideoTrigger):
        completion(palVideoTrigger)
      }
    }
    
  }
}

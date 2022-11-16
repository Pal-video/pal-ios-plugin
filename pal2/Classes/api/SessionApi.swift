//
//  EventApi.swift
//  pal2
//
//  Created by Dimitri Dessus on 16/11/2022.
//

class SessionApi {
  private var httpClient: HttpClient
  private var userDefaults = UserDefaults.standard
  private var palSession: PalSession?
  
  // Constants
  private var SessionId: String = "sessionId"
  
  public init(httpClient: HttpClient) {
    self.httpClient = httpClient
  }
  
  public func initSession() {
    let savedSessionId = userDefaults.string(forKey: SessionId)
    if (savedSessionId != nil && !savedSessionId!.isEmpty) {
      palSession = PalSession(uid: savedSessionId!)
      //return;
    }
    
    let palSessionRequest = PalSessionRequest()
    do {
      let parameters = palSessionRequest.toMap()
      
      httpClient.executeQuery(data: parameters, endpoint: "/sessions") { (result: Result<PalSession, Error>) in
        switch result{
        case .success(let post):
          print(post.uid)
        case .failure(let error):
          print(error)
        }
      }
      
      
      userDefaults.set("ID", forKey: SessionId)
    } catch {
      return;
    }
  }
  
  
}

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
  
  public var hasSession: Bool {
    get {
      return self.palSession != nil && !self.palSession!.uid.isEmpty
    }
  }
  public var session: PalSession {
    get {
      return self.palSession!
    }
  }
  
  // Constants
  private var SessionId: String = "sessionId"
  
  public init(httpClient: HttpClient) {
    self.httpClient = httpClient
  }
  
  public func initSession(completion: @escaping () -> Void) {
    let savedSessionId = userDefaults.string(forKey: SessionId)
    if (savedSessionId != nil && !savedSessionId!.isEmpty) {
      palSession = PalSession(uid: savedSessionId!)
      debugPrint("Session restored!")
      return;
    }
    
    let palSessionRequest = PalSessionRequest()
    let parameters = palSessionRequest.toMap()
    httpClient.executeQuery(data: parameters, endpoint: "/sessions") { (result: Result<PalSession, Error>) in
      switch result {
      case .failure(let error):
        debugPrint(error)
      case .success(let palSession):
        self.palSession = palSession
        self.userDefaults.set(palSession.uid, forKey: self.SessionId)
        self.userDefaults.synchronize()
        completion()
      }
    }
  }
  
  public func clearSession() {
    userDefaults.removeObject(forKey: self.SessionId)
    userDefaults.synchronize()
  }
}

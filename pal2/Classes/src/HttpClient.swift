//
//  EventApi.swift
//  pal2
//
//  Created by Dimitri Dessus on 16/11/2022.
//

import Alamofire

class HttpClient: NSObject {
  private var requestHeaders = HTTPHeaders()
  private var url: String
  private var apiToken: String
  private var encoding: ParameterEncoding! = JSONEncoding.default
  
  init(baseUrl: String, apiToken: String) {
    self.url = baseUrl
    self.apiToken = apiToken
    
    // adding default headers
    self.requestHeaders.add(name: "Content-Type", value: "application/json; charset=utf-8")
    self.requestHeaders.add(name: "Authorization", value: "Bearer \(self.apiToken)")
    
    debugPrint("🔹 Pal Initialization 🔹")
    debugPrint("🔗 Base Url: \(self.url)")
  }
  
  func executeQuery<T>(data: [String: Any], headers: [String:String] = [:], endpoint: String, method: HTTPMethod = .post, isJSONRequest: Bool = true, completion: @escaping (Result<T, Error>) -> Void) where T: Codable {
    
    // add data
    var requestParameters = Parameters()
    data.forEach{requestParameters.updateValue($0.value, forKey: $0.key)}
    
    headers.forEach({self.requestHeaders.add(name: $0.key, value: $0.value)})
    
    if !isJSONRequest{
      encoding = URLEncoding.default
    }
    
    debugPrint("🔹 Sending Pal request 🔹")
    debugPrint("➡️ Method: \(method.rawValue)")
    debugPrint("➡️ Endpoint: \(endpoint)")
    debugPrint("➡️ JSON Request: \(isJSONRequest)")
    
    AF.request(self.url + endpoint, method: method, parameters: requestParameters, encoding: encoding, headers: self.requestHeaders).responseData(completionHandler: { response in
      switch response.result {
      case .success(let res):
        if let code = response.response?.statusCode {
          switch code {
          case 200...299:
            do {
              debugPrint("✅ Pal request sent successfully")
              debugPrint("🔐 Code: \(code)")
              let body = try JSONDecoder().decode(T.self, from: res.isEmpty ? "{}".data(using: .utf8)! : res)
              debugPrint("🔐 Data: \(body)")
              completion(.success(body))
            } catch let error {
              debugPrint("⛔️ Error when sending Pal request \(String(data: res, encoding: .utf8) ?? "nothing received")")
              completion(.failure(error))
            }
          default:
            let error = NSError(domain: response.debugDescription, code: code, userInfo: response.response?.allHeaderFields as? [String: Any])
            debugPrint("⛔️ Error when sending Pal request \(String(describing: error.description))")
            completion(.failure(error))
          }
        }
      case .failure(let error):
        debugPrint("⛔️ Error when sending Pal request \(String(describing: error.errorDescription))")
        completion(.failure(error))
      }
    })
  }
}

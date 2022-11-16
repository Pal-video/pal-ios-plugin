//
//  PalPlugin.swift
//  pal2
//
//  Created by Dimitri Dessus on 15/11/2022.
//

import Foundation
import Alamofire

public class PalPlugin {
  public static let sharedInstance = PalPlugin()
  private var apiToken: String?
  
  public init() {}
  
  public func setup(apiToken: String, serverUrl: String? = nil) {
    self.apiToken = apiToken
  }
  
  public func logCurrentScreen(route: String) {
    print(apiToken)
    
  }
}


//
//  DateExtension.swift
//  pal2
//
//  Created by Dimitri Dessus on 22/11/2022.
//

import Foundation

extension Date {
  static func ISOStringFromDate(date: Date) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.locale = Locale(identifier: "en_US_POSIX")
    dateFormatter.timeZone = TimeZone(abbreviation: "GMT")
    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
    
    return dateFormatter.string(from: date)
  }
  
  static func dateFromISOString(string: String) -> Date? {
    let dateFormatter = DateFormatter()
    dateFormatter.locale = Locale(identifier: "en_US_POSIX")
    dateFormatter.timeZone = TimeZone.autoupdatingCurrent
    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
    
    return dateFormatter.date(from: string)
  }
}

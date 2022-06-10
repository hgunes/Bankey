//
//  Date+Extension.swift
//  Bankey
//
//  Created by Harun Gunes on 10/06/2022.
//

import Foundation

extension Date {
  static var bankeyDateFormatter: DateFormatter {
    let formatter = DateFormatter()
    formatter.timeZone = TimeZone(abbreviation: "MDT")
    return formatter
  }
  
  var monthDayYearString: String {
    let dateFormatter = Date.bankeyDateFormatter
    dateFormatter.dateFormat = "MMM d, YYYY"
    return dateFormatter.string(from: self)
  }
}

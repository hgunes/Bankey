//
//  Decimal+Extension.swift
//  Bankey
//
//  Created by Harun Gunes on 29/05/2022.
//

import Foundation

extension Decimal {
  var doubleValue : Double {
    return NSDecimalNumber(decimal: self).doubleValue
  }
}

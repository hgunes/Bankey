//
//  CurrencyFormatterTests.swift
//  BankeyUnitTests
//
//  Created by Harun Gunes on 29/05/2022.
//

import XCTest
@testable import Bankey

class CurrencyFormatterTests: XCTestCase {
  
  var formatter: CurrencyFormatter!
  
  override func setUp() {
    super.setUp()
    formatter = CurrencyFormatter()
  }
  
  
  func testBreakDollarsIntoCents() throws {
    let result = formatter.breakIntoDollarsAndCents(999999.23)
    XCTAssertEqual(result.0, "999,999")
    XCTAssertEqual(result.1, "23")
  }
  
  
  func testDollarsFormatted() throws {
    let result = formatter.dollarsFormatted(999999.23)
    XCTAssertEqual(result, "$999,999.23")
  }
  
  
  func testZeroDollarsFormatted() throws {
    let result = formatter.dollarsFormatted(0.00)
    XCTAssertEqual(result, "$0.00")
  }
}

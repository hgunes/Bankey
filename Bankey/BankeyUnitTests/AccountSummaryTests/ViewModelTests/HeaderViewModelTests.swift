//
//  HeaderViewModelTests.swift
//  BankeyUnitTests
//
//  Created by Harun Gunes on 23/06/2022.
//

import XCTest
@testable import Bankey

class HeaderViewModelTests: XCTestCase {
  
  override func setUp() {
    super.setUp()
  }
  
  
  func testHeaderViewModel() throws {
    let date = Date().monthDayYearString
    let account = Account(id: "1", type: .Banking, name: "TEST ACCOUNT", amount: 123.5, createdDateTime: Date())
    
//    let headerVM = HeaderViewModel.
    
  }
}

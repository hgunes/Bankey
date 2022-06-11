//
//  ProfileTests.swift
//  BankeyUnitTests
//
//  Created by Harun Gunes on 11/06/2022.
//

import Foundation
import XCTest

@testable import Bankey

class ProfileTests: XCTestCase {
  
  override func setUp() {
    super.setUp()
  }
  
  
  func testCanParse() throws {
    let json = """
    {
    "id": "1",
    "first_name": "Harun",
    "last_name": "Gunes"
    }
    """
    let data = json.data(using: .utf8)!
    
    let decoder = JSONDecoder()
    decoder.keyDecodingStrategy = .convertFromSnakeCase
    
    let result = try decoder.decode(Profile.self, from: data)
    
    XCTAssertEqual(result.id, "1")
    XCTAssertEqual(result.firstName, "Harun")
    XCTAssertEqual(result.lastName, "Gunes")
  }
}

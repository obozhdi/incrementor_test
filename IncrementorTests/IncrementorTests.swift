//
//  IncrementorTests.swift
//  IncrementorTests
//
//  Created by obozhdi on 15/03/19.
//  Copyright © 2019 obozhdi. All rights reserved.
//

import XCTest

class IncrementorTests: XCTestCase {

  private var incrementor: Incrementor!
  private let defaultMaxValue: Int = 20 //use 20 or 100 or more, but not 2 billion, cos it takes a lot of time to perform

  override func setUp() { super.setUp(); incrementor = Incrementor(maximumValue: defaultMaxValue) }

  override func tearDown() { incrementor = nil; super.tearDown() }

  func testDefaultMaxValue() {
    var expectedValue = 0
    XCTAssertEqual(incrementor.getNumber(), expectedValue)
    for _ in 1...defaultMaxValue {
      expectedValue += 1
      incrementor.incrementNumber()
    }
    XCTAssertEqual(incrementor.getNumber(), expectedValue)
  }

  func testSetMaxValueLessThanZero() {
    incrementor.setMaximumValue(-100)
    var expectedValue = 0
    for _ in 0...defaultMaxValue {
      XCTAssertEqual(incrementor.getNumber(), expectedValue)
      incrementor.incrementNumber()
      expectedValue += 1
    }
  }

  func testSetMaxValueZero() {
    incrementor.setMaximumValue(0)
    let expectedValue = 0
    for _ in 0...1 {
      incrementor.incrementNumber()
      XCTAssertEqual(incrementor.getNumber(), expectedValue)
    }
  }

  func testSetMaxValueMoreThanZero() {
    let maxValue = 100
    incrementor.setMaximumValue(maxValue)
    var expectedValue = 0
    for _ in 1...maxValue {
      XCTAssertEqual(incrementor.getNumber(), expectedValue)
      incrementor.incrementNumber()
      expectedValue += 1
    }
  }

  func testDefaultMaxValueIncrementorOverflow() {
    for _ in 0...defaultMaxValue { incrementor.incrementNumber() }
    XCTAssertEqual(incrementor.getNumber(), 0)
  }

  func testSetMaxValueMoreThanZeroOverflow() {
    incrementor.setMaximumValue(-100)
    for _ in 0...defaultMaxValue { incrementor.incrementNumber() }
    XCTAssertEqual(incrementor.getNumber(), 0)
  }

  func testSetMaxValueLessThanZeroOverflow() {
    let maxValue = 100
    incrementor.setMaximumValue(maxValue)
    for _ in 0...maxValue { incrementor.incrementNumber() }
    XCTAssertEqual(incrementor.getNumber(), 0)
  }

}

//
//  Incrementor.swift
//  Incrementor
//
//  Created by obozhdi on 15/03/19.
//  Copyright © 2019 obozhdi. All rights reserved.
//

import Foundation

class Incrementor {
  
  private var currentValue: Int = 0
  private var maximumValue: Int
  
  init(maximumValue: Int = Int.max) {
    self.maximumValue = maximumValue
  }
  
  func getNumber() -> Int {
    return currentValue
  }
  
  func incrementNumber() -> Void {
    currentValue += 1
    checkOutOfBound()
  }
  
  func setMaximumValue(_ maximumValue: Int) -> Void {
    guard maximumValue >= 0 else {
      return
    }
    
    self.maximumValue = maximumValue
  }
  
  private func checkOutOfBound() {
    if currentValue < 0 || currentValue > maximumValue {
      currentValue = 0
    }
  }
  
}

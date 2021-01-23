//
//  Array+Only.swift
//  Memorize
//
//  Created by Ahmed M. Hassan on 23/01/2021.
//

import Foundation

// MARK: - Array+Only
//
extension Array {
  var only: Element? {
    return count == 1 ? first : nil
  }
}

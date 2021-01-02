//
//  GridStack.swift
//  Memorize
//
//  Created by Ahmed M. Hassan on 02/01/2021.
//

import SwiftUI

struct GridStack<Content: View>: View {
  let rows: Int
  let columns: Int
  let content: (Int) -> Content
  
  var body: some View {
    ScrollView {
      HStack {
        ForEach(0 ..< self.columns, id: \.self) { column in
          VStack {
            ForEach(0 ..< rows, id: \.self) { row in
              let index = indexOf(row: row, column: column)
              self.content(index)
            }
          }
        }
      }
    }
  }
  
  init(rows: Int, columns: Int, @ViewBuilder content: @escaping (Int) -> Content) {
    self.rows = rows
    self.columns = columns
    self.content = content
  }
  
  private func indexOf(row: Int, column: Int) -> Int {
    return row * (rows + 1) + column
  }
}

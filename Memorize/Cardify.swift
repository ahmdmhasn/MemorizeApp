//
//  Cardify.swift
//  Memorize
//
//  Created by Ahmed M. Hassan on 23/01/2021.
//

import SwiftUI

struct Cardify: ViewModifier {
  
  let isFaceUp: Bool
  
  func body(content: Content) -> some View {
    ZStack {
      if isFaceUp {
        RoundedRectangle(cornerRadius: Contants.cornerRadius)
          .fill(Color.white)
        RoundedRectangle(cornerRadius: Contants.cornerRadius)
          .stroke(lineWidth: Contants.lineWidth)
        content
      } else {
        RoundedRectangle(cornerRadius: Contants.cornerRadius)
          .fill()
      }
    }
  }
  
  enum Contants {
    static let cornerRadius = CGFloat(12)
    static let lineWidth = CGFloat(4)
  }
}

extension View {
  
  func cardify(isFaceUp: Bool) -> some View {
    self.modifier(Cardify(isFaceUp: isFaceUp))
  }
}

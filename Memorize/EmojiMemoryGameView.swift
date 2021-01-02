//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Ahmed M. Hassan on 02/01/2021.
//

import SwiftUI

struct EmojiMemoryGameView: View {
  
  @ObservedObject var viewModel: EmojiMemoryGame
  
  var body: some View {
    Grid(items: viewModel.cards) { card in
      CardView(card: card).onTapGesture {
        viewModel.choose(card: card)
      }
    }
    .padding()
    .foregroundColor(.orange)
  }
}

struct CardView: View {
  
  var card: MemoryGame<String>.Card
  
  var body: some View {
    GeometryReader { geometry in
      body(for: geometry.size)
    }
  }
  
  // View builder
  func body(for size: CGSize) -> some View {
    ZStack {
      if card.isFaceUp {
        RoundedRectangle(cornerRadius: Contants.cornerRadius)
          .fill(Color.white)
        RoundedRectangle(cornerRadius: Contants.cornerRadius)
          .stroke(lineWidth: Contants.lineWidth)
        Text(card.content)
      } else {
        if !card.isMatched {
          RoundedRectangle(cornerRadius: Contants.cornerRadius)
            .fill()
        }
      }
    }
    .font(Contants.fontSize(for: size))
  }
  
  enum Contants {
    static let cornerRadius = CGFloat(12)
    static let lineWidth = CGFloat(4)
    static func fontSize(for size: CGSize) -> Font? {
      return Font.system(size: size.height * 0.75)
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    let viewModel = EmojiMemoryGame()
    EmojiMemoryGameView(viewModel: viewModel)
  }
}

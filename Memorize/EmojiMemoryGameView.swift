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
  @ViewBuilder
  func body(for size: CGSize) -> some View {
    if card.isFaceUp || !card.isMatched {
      ZStack {
        PieView(start: 0, end: 110, clockwise: false)
          .padding(4)
          .opacity(0.4)
        Text(card.content)
          .font(Contants.fontSize(for: size))
      }
      .cardify(isFaceUp: card.isFaceUp)
    }
  }
  
  enum Contants {
    static func fontSize(for size: CGSize) -> Font? {
      let size = min(size.height, size.width)
      return Font.system(size: size * 0.75)
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    let viewModel = EmojiMemoryGame()
    viewModel.choose(card: viewModel.cards[0])
    return EmojiMemoryGameView(viewModel: viewModel)
  }
}

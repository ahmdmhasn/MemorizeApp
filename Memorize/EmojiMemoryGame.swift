//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Ahmed M. Hassan on 02/01/2021.
//

import Foundation

class EmojiMemoryGame: ObservableObject {
  
  @Published
  private var model = EmojiMemoryGame.createMemoryGame()
  
  static func createMemoryGame() -> MemoryGame<String> {
    let emojis = ["💀", "🎃", "🍌"]
    return MemoryGame(numberOfPrintCards: emojis.count) { index in
      return emojis[index]
    }
  }
  
  // MARK: - Access to model
  
  var cards: [MemoryGame<String>.Card] {
    return model.cards
  }
  
  // MARK: - Intents
  
  func choose(card: MemoryGame<String>.Card) {
    model.choose(card: card)
  }
}

//
//  MemoryGame.swift
//  Memorize
//
//  Created by Ahmed M. Hassan on 02/01/2021.
//

import Foundation

struct MemoryGame<CardContent> {
  
  var cards: [Card]
  
  mutating func choose(card: Card) {
    if let index = self.index(of: card) {
      cards[index].isFaceUp = !cards[index].isFaceUp
    }
  }
  
  func index(of card: Card) -> Int? {
    return cards.firstIndex { card.id == $0.id }
  }
  
  init(numberOfPrintCards: Int, cardContentFactory: ((Int) -> CardContent)) {
    cards = []
    for index in 0..<numberOfPrintCards {
      let content = cardContentFactory(index)
      cards.append(Card(content: content))
      cards.append(Card(content: content))
    }
  }
  
  struct Card: Identifiable {
    var id: String = UUID().uuidString
    var isFaceUp: Bool = false
    var isMatched: Bool = false
    var content: CardContent
  }
}

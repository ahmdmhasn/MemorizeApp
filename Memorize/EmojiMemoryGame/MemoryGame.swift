//
//  MemoryGame.swift
//  Memorize
//
//  Created by Ahmed M. Hassan on 02/01/2021.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
  
  private(set) var cards: [Card]
  
  var onlyFaceUpCardIndex: Int? {
    get { cards.indices.filter { cards[$0].isFaceUp }.only }
    set { turnAllCardsFaceUp(except: newValue) }
  }
  
  mutating func choose(card: Card) {
    print("Card choosen", card)
    guard let selectedIndex = index(of: card),
          card.isFaceUp == false,
          card.isMatched == false else {
      print("Card is either faced up or choosen!", card)
      return
    }
    
    // If a card is visible
    guard let potentialMatchIndex = onlyFaceUpCardIndex else {
      onlyFaceUpCardIndex = selectedIndex
      return
    }
    
    if cards[potentialMatchIndex].content == cards[selectedIndex].content {
      cards[selectedIndex].isMatched = true
      cards[potentialMatchIndex].isMatched = true
    }
    cards[selectedIndex].isFaceUp = true
  }
  
  func index(of card: Card) -> Int? {
    return cards.firstIndex { card.id == $0.id }
  }
  
  init(numberOfPrintCards: Int, cardContentFactory: ((Int) -> CardContent)) {
    cards = []
    for index in 0..<numberOfPrintCards {
      let content = cardContentFactory(index)
      cards.append(Card(id: index * 2, content: content))
      cards.append(Card(id: index * 2 + 1, content: content))
    }
  }
  
  private mutating func turnAllCardsFaceUp(except selectedIndex: Int?) {
    for index in cards.indices {
      cards[index].isFaceUp = index == selectedIndex
    }
  }
  
  struct Card: Identifiable {
    var id: Int
    var isFaceUp: Bool = false
    var isMatched: Bool = false
    var content: CardContent
  }
}

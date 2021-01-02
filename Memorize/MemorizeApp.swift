//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Ahmed M. Hassan on 02/01/2021.
//

import SwiftUI

@main
struct MemorizeApp: App {
    var body: some Scene {
        WindowGroup {
          let viewModel = EmojiMemoryGame()
          EmojiMemoryGameView(viewModel: viewModel)
        }
    }
}

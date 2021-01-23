//
//  Grid.swift
//  Memorize
//
//  Created by Ahmed M. Hassan on 02/01/2021.
//

import SwiftUI

struct Grid<Item, ItemView>: View where Item: Identifiable, ItemView: View {
  
  var items: [Item]
  var viewForItem: ((Item) -> ItemView)
  private let columns = 3
  private var rows: Int { items.count / columns }
  
  init(items: [Item], viewForItem: @escaping ((Item) -> ItemView)) {
    self.items = items
    self.viewForItem = viewForItem
  }
  
  var body: some View {
    GeometryReader { geometry in
      body(for: geometry.size)
    }
  }
  
  func body(for size: CGSize) -> some View {
    GridStack(rows: rows, columns: columns) { index in
      body(for: items[index], in: size)
    }
  }
  
  func body(for item: Item, in size: CGSize) -> some View {
    let width = size.width / CGFloat(columns)
    return viewForItem(item)
      .frame(width: width, height: width, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
  }
}

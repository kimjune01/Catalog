//
//  CatalogItem.swift
//  SwiftyCatalog
//
//  Created by June Kim on 2024-10-08.
//

import SwiftUI

struct CatalogItem: Identifiable, Hashable {
  static func == (lhs: CatalogItem, rhs: CatalogItem) -> Bool {
    lhs.id == rhs.id
  }
  
  let id: UUID = UUID()
  let title: String
  let systemImage: String
}

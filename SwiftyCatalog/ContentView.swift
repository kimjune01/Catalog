//
//  ContentView.swift
//  SwiftyCatalog
//
//  Created by June Kim on 2024-10-08.
//

import SwiftUI


struct ContentView: View {
  var body: some View {
    NavigationStack {
      CatalogListView(title: "Swifty Catalog", catalogList: masterCatalog).navigationTitle("")
    }
  }
}

#Preview {
    ContentView()
}

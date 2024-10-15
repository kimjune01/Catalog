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
      CatalogListView(title: "SwiftUI Catalog", catalogList: masterCatalog).navigationTitle("")
        .toolbar(content: {
          ToolbarItem(placement: .topBarLeading) {
            NavigationLink(destination: AboutView()) {
              Text("About")
            }
          }
        })
    }
  }
}

#Preview {
    ContentView()
}

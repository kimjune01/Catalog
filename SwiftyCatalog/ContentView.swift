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
          MasterCatalog().navigationTitle("")
      }
    }
}

#Preview {
    ContentView()
}

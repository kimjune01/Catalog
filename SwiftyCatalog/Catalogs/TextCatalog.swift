//
//  ContentView.swift
//  SwiftyCatalog
//
//  Created by June Kim on 2024-10-08.
//

import SwiftUI

struct TextCatalogView: View {
  @State private var selectedElement: CatalogItem? = nil

  let initItems: [CatalogItem] = [
    CatalogItem(title: "Localization", systemImage: "globe"),
    CatalogItem(title: "Verbatim", systemImage: "square.and.pencil"),
    CatalogItem(title: "Date", systemImage: "calendar.circle"),
    CatalogItem(title: "Timer", systemImage: "clock"),
    ]
  
  let fontItems: [CatalogItem] = [
    CatalogItem(title: "Font", systemImage: "abc"),
    CatalogItem(title: "Styling", systemImage: "paintbrush.pointed"),
    CatalogItem(title: "Layout", systemImage: "character.textbox"),
    ]
  
  let a11yItems: [CatalogItem] = [
    CatalogItem(title: "Voiceover", systemImage: "speaker"),
    ]

    var body: some View {
      Text("Text Catalog").bold()
      List {
        Section(header: Text("Creating a Text View")) {
          ForEach(initItems) { item in
            NavigationLink(value: item) {
              Label(item.title, systemImage: item.systemImage)
            }
          }
        }
        Section(header: Text("Appearance")) {
          ForEach(fontItems) { item in
            NavigationLink(value: item) {
              Label(item.title, systemImage: item.systemImage)
            }
          }
        }
        Section(header: Text("Accessibility")) {
          ForEach(a11yItems) { item in
            NavigationLink(value: item) {
              Label(item.title, systemImage: item.systemImage)
            }
          }
        }
      }
      .padding()
    }
}

#Preview {
  TextCatalogView()
}

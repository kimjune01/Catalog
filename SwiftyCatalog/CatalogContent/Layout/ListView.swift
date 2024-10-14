//
//  ListView.swift
//  SwiftyCatalog
//
//  Created by June Kim on 2024-10-11.
//

import SwiftUI

struct ListView: View {
  let animals = ["Bouncy Bunny",
                 "Sassy Squirrel",
                 "Dizzy Duckling",
                 "Fluffy Fox",
                 "Wobbly Wombat"]
  
  @State private var section0Expanded = true
  @State private var section1Expanded = true
  @State private var section2Expanded = true
  
  @ViewBuilder
  func makeList() -> some View {
    List {
      Text("Lists have cells.")
      Text("Scroll on this list to see more.")
      Image("bbb-splash")
        .resizable()
        .aspectRatio(contentMode: .fill)
        .frame(width: 150, height: 150)
        .clipped()
      Text("It can have images.")
      Text("It can have sections.")
      
      Section("Section 0", isExpanded: $section0Expanded) {
        Text("This is a plain section.")
        Text("It does not have a header or footer.")
      }
      Section(isExpanded: $section1Expanded) {
        Text("Section header")
      } header: {
        Text("This section has a header.")
      }
      Section(isExpanded: $section2Expanded) {
        ForEach(animals, id: \.self) { animal in
          Text(animal)
        }
      } header: {
        Text("Section headers can be customized.").fontWeight(.black)
      }
    }
  }
  
  let listHeight: CGFloat = 350
  
  var body: some View {
    ScrollView {
      VStack(spacing: 20) {
        Text("Plain List").font(.headline)
        
        makeList()
          .listStyle(.plain)
          .frame(minWidth: 300, minHeight: listHeight, maxHeight: listHeight)
          .border(.red.opacity(0.5))
          .padding(5)
        Divider()
        
        Text("Grouped List").font(.headline)
        makeList()
          .listStyle(.grouped)
          .frame(minWidth: 300, minHeight: listHeight, maxHeight: listHeight)
          .border(.red.opacity(0.5))
          .padding(5)
        Divider()
        
        Text("Inset Grouped List").font(.headline)
        makeList()
          .listStyle(.insetGrouped)
          .frame(minWidth: 300, minHeight: listHeight, maxHeight: listHeight)
          .border(.red.opacity(0.5))
          .padding(5)
        Divider()
        
        Text("Sidebar").font(.headline)
        Text("Sections can be collapsed and expanded").font(.subheadline)
        makeList()
          .listStyle(.sidebar)
          .frame(minWidth: 300, minHeight: listHeight, maxHeight: listHeight)
          .border(.red.opacity(0.5))
          .padding(5)
        Divider()
        
      }
    }
  }
}

#Preview {
  ListView()
}

//
//  ListView.swift
//  SwiftyCatalog
//
//  Created by June Kim on 2024-10-11.
//

import SwiftUI

struct EditableList<
  Data: RandomAccessCollection & MutableCollection & RangeReplaceableCollection,
  Content: View
>: View where Data.Element: Identifiable {
  @Binding var data: Data
  var content: (Binding<Data.Element>) -> Content
  
  init(_ data: Binding<Data>,
       content: @escaping (Binding<Data.Element>) -> Content) {
    self._data = data
    self.content = content
  }
  
  var body: some View {
    List {
      ForEach($data, content: content)
        .onMove { indexSet, offset in
          data.move(fromOffsets: indexSet, toOffset: offset)
        }
        .onDelete { indexSet in
          data.remove(atOffsets: indexSet)
        }
    }
    .toolbar { EditButton() }
  }
}

struct ListView: View {
  @State private var animals = ["Bouncy Bunny",
                 "Sassy Squirrel",
                 "Dizzy Duckling",
                 "Fluffy Fox",
                 "Wobbly Wombat"]
  @State private var users = ["Glenn", "Malcolm", "Nicola", "Terri"]

  @State private var section0Expanded = true
  @State private var section1Expanded = true
  @State private var section2Expanded = true
  
  @ViewBuilder
  func makeList() -> some View {
    List() {
      Text("Scroll on this list to see more.")
      Image("bbb-splash")
        .resizable()
        .aspectRatio(contentMode: .fill)
        .frame(width: 150, height: 150)
        .clipped()
      
      Section("Section 0", isExpanded: $section0Expanded) {
        Text("This is a plain section.")
        Text("It does not have a header or footer.")
      }
      Section(isExpanded: $section1Expanded) {
        Text("This section has a header.")
      } header: {
        Text("Section header")
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
  
  let listHeight: CGFloat = .infinity
  @State private var listStyleIdx = 0
  let listStyles: [any ListStyle] = [.plain, .grouped, .insetGrouped, .sidebar]
  
  @ViewBuilder
  func makeListStyles() -> some View {
    VStack(spacing: 20) {
      Text("List Styles").font(.headline)
      Picker("Text alignment", selection: $listStyleIdx) {
        Text("Plain").tag(0)
        Text("Grouped").tag(1)
        Text("Inset Grouped").tag(2)
        Text("Sidebar").tag(3)
      }
      .pickerStyle(.segmented)
      switch listStyleIdx {
      case 0:
        makeList()
          .listStyle(.plain)
          .frame(minWidth: 300, minHeight: 400, maxHeight: listHeight)
          .padding(5)
        
      case 1:
        makeList()
          .listStyle(.grouped)
          .frame(minWidth: 300, minHeight: 400, maxHeight: listHeight)
          .padding(5)
      case 2:
        makeList()
          .listStyle(.insetGrouped)
          .frame(minWidth: 300, minHeight: 400, maxHeight: listHeight)
          .padding(5)
        
      case 3:
        makeList()
          .listStyle(.sidebar)
          .frame(minWidth: 300, minHeight: 400, maxHeight: listHeight)
          .padding(5)
        Text("Sections can be collapsed and expanded").font(.subheadline)
      default:
        EmptyView()
      }
      Divider()
    }
  }
  
  @ViewBuilder
  func makeDraggableList() -> some View {
    NavigationStack {
      List {
        ForEach(users, id: \.self) { user in
          Text(user)
        }
        .onMove { indexSet, offset in
          users.move(fromOffsets: indexSet, toOffset: offset)
        }
        .onDelete { indexSet in
          users.remove(atOffsets: indexSet)
        }
      }
      .toolbar {
        EditButton()
      }
      .navigationTitle("People")
    }
  }
  
  var body: some View {
    TabView {
      makeListStyles()
      .tabItem {
        Text("List Styles")
        Image(systemName: "paintbrush.fill").imageScale(.large)
      }
      .tag(0)
      makeDraggableList()
        .tabItem {
          Text("Editable List")
          Image(systemName: "hand.point.up.left.and.text.fill").imageScale(.large)
        }
    }
  }
}

#Preview {
  ListView()
}

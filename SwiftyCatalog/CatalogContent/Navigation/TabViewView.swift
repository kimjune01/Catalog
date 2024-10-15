//
//  TabViewView.swift
//  SwiftyCatalog
//
//  Created by June Kim on 2024-10-11.
//

import SwiftUI

struct TabViewView: View {
  @State private var selectedIndex = 0
  @State private var shouldDisplayIndex = true
    var body: some View {
      ScrollView {
        VStack(spacing: 20) {
          Text("Tab Bar Style").font(.headline)
          TabView(selection: $selectedIndex) {
            Text("Home View")
            .tabItem {
              Text("Home view")
              Image(systemName: "house.fill")
                .renderingMode(.template)
            }
            .tag(0)
            Text("Profile view")
            .tabItem {
              Label("Profile", systemImage: "person.fill")
            }
            .tag(1)
            Text("About view")
            .tabItem {
              Text("About view")
              Image(systemName: "info.circle")
            }
            .badge("12")
            .tag(2)
          }
          .tabViewStyle(.tabBarOnly)
          .block()
          .frame(minWidth: 300, maxWidth: .infinity, minHeight: 400, maxHeight: 500)
          Text("Each tab maintains their state independently.").font(.subheadline)
          Divider()
          
          Text("Page Style").font(.headline)
          TabView(selection: $selectedIndex) {
            Text("Home View")
            .tag(0)
            Text("Profile view")
            .tag(1)
            Text("About view")
            .tag(2)
          }
          .tabViewStyle(.page(indexDisplayMode: shouldDisplayIndex ? .always : .never))
          .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
          .block()
          .frame(minWidth: 300, maxWidth: .infinity, minHeight: 400, maxHeight: 500)
          Toggle("Display index", isOn: $shouldDisplayIndex.animation(.easeInOut))
        }
      }.padding()
    }
}

#Preview {
    TabViewView()
}

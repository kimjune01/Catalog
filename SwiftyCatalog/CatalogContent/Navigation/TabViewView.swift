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
            NavigationStack() {
              Text("Home View")
                .navigationTitle("Home")
              NavigationLink(destination: Text("We're inside")) {
                Text("Go inside")
              }
            }
            .tabItem {
              Text("Home view")
              Image(systemName: "house.fill")
                .renderingMode(.template)
            }
            .tag(0)
            NavigationStack() {
              Text("Profile view")
                .navigationTitle("Profile")
              NavigationLink(destination: Text("Profile detail")) {
                Text("More detail")
              }
            }
            .tabItem {
              Label("Profile", systemImage: "person.fill")
            }
            .tag(1)
            NavigationStack() {
              Text("About view")
                .navigationTitle("About")
              NavigationLink(destination: Text("About detail")) {
                Text("More about detail")
              }
            }
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
            NavigationStack() {
              Text("Home View")
                .navigationTitle("Home")
              NavigationLink(destination: Text("We're inside")) {
                Text("Go inside")
              }
            }
            .tag(0)
            NavigationStack() {
              Text("Profile view")
                .navigationTitle("Profile")
              NavigationLink(destination: Text("Profile detail")) {
                Text("More detail")
              }
            }
            .tag(1)
            NavigationStack() {
              Text("About view")
                .navigationTitle("About")
              NavigationLink(destination: Text("About detail")) {
                Text("More about detail")
              }
            }
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

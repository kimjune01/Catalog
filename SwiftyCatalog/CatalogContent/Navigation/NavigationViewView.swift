

import SwiftUI

struct NavigationViewView: View {
  @State private var displayModeIdx: Int = 0
  let allDisplayModes: [NavigationBarItem.TitleDisplayMode] = [.large, .inline]
  @State private var displayModeToggle: Bool = false
  var body: some View {
    ScrollView {
      VStack {
        NavigationView {
          VStack(spacing: 10) {
            HStack {
              Text("Title display mode: ")
              Picker("Title display mode", selection: $displayModeIdx) {
                Text("Large").tag(0)
                Text("Inline").tag(1)
              }.pickerStyle(.segmented)
            }
            List {
              Text("Let's go somewhere!")
            }
            NavigationLink("Go there") {
              Text("We are here!")
            }
          }
          .navigationBarItems(leading:
                                NavigationLink("Leading Bar Item") {
            Text("Went to Lead").bold()
          },
                              trailing:
                                NavigationLink("Trailing Bar Item") {
            Text("Went to trail").bold()
          }
          )
          .navigationBarTitle(Text("Navigation Title"), displayMode: allDisplayModes[displayModeIdx])
          
        }
        .frame(minWidth: 300, maxWidth: .infinity, minHeight: 300, maxHeight: 400)
        .block()
        Divider()
        Text("Navigation views don't have to be full screen.")
      }
    }
  }
}

#Preview {
  NavigationViewView()
}

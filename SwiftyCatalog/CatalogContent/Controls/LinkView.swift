//
//  LinkView.swift
//  SwiftyCatalog
//
//  Created by June Kim on 2024-10-09.
//

import SwiftUI

struct LinkView: View {
  @State private var greeting = ""
  var body: some View {
    ScrollView {
      VStack(spacing: 20) {
        
        Text("Links point to URLs").font(.headline)
        Link("View Apple's Terms of Service",
             destination: URL(string: "https://www.apple.com/uk/legal/internet-services/itunes/uk/terms.html")!)
        .block()
        Swifty(code:
          """
          Link("View Apple's Terms of Service",
               destination: URL(string: "https://www.apple.com/uk/legal/internet-services/itunes/uk/terms.html")!)
          """
        )
        Divider()
        
        Text("Share Links open a share sheet").font(.headline)
        ShareLink(item: URL(string: "https://developer.apple.com/xcode/swiftui/")!)
        Divider()
        
        Text("Its appearance and behavior can be customized").font(.headline)
        ShareLink(
          item: URL(string: "https://developer.apple.com/sf-symbols/")!,
          subject: Text("Cool App"),
          message: Text("Check it out!"),
          preview: SharePreview(
            "SF Symbols",
            image: "sf-symbols")) {
              Label{Text("Share SF Symbols")} icon: { Image("sf-symbols").scaleEffect(0.6) }
            }
        Divider()
        
        
      }
    }.padding()
  }
}

#Preview {
  LinkView()
}

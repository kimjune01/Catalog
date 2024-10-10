//
//  TextLocalizationView.swift
//  SwiftyCatalog
//
//  Created by June Kim on 2024-10-08.
//

import SwiftUI
import MarkdownUI

struct TextLocalizationView: View {
  var body: some View {
    ScrollView{
      
      VStack(alignment: .leading, spacing: 20) {
        Text("By default, SwiftUI will localize the text in your app.")
        Divider()
        Text("Add languages you want to support to app target; make a _Localizable.xcstrings_; add translations.")
          .wrap()
        HStack {
          Text("Welcome")
            .environment(\.locale, .init(identifier: "de"))
          Text("Welcome")
            .environment(\.locale, .init(identifier: "fr"))
          Text("Welcome")
            .environment(\.locale, .init(identifier: "en"))
        }
        .block()
        Swifty (code:
        """
        Text("Welcome")
        .environment(\\.locale, .init(identifier: "de"))
        Text("Welcome")
        .environment(\\.locale, .init(identifier: "fr"))
        Text("Welcome")
        .environment(\\.locale, .init(identifier: "en"))
        """
        )
        Divider()
        Text("Add comments.")
        Text("Welcome", comment: "The first message at app open")
          .block()
        Swifty (code:
        """
        Text("Welcome", comment: "The first message at app open")
        """
        )
        Divider()
        Text("If you have a string literal that you don’t want to localize, use the `(verbatim:)` initializer instead.")
          .wrap()
        Text(verbatim: "Welcome")
          .environment(\.locale, .init(identifier: "de"))
          .block()
        Swifty (code:
        """
        Text(verbatim: "Welcome")
          .environment(\\.locale, .init(identifier: "de"))
        """
        )
        
      }
      .padding()
    }
  }
  
  
}

#Preview {
  TextLocalizationView()
}

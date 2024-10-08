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
    Markdown {
      """
      ```swift
      Text("Explore",
           comment: "The title of the tab bar item that navigates to the Explore screen.")
      ```
      """
    }
    .padding()
  }

}

#Preview {
    TextLocalizationView()
}

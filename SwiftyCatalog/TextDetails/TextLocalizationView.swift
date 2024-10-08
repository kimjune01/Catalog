//
//  TextLocalizationView.swift
//  SwiftyCatalog
//
//  Created by June Kim on 2024-10-08.
//

import SwiftUI

struct TextLocalizationView: View {
  let markdownText: LocalizedStringKey = 
  """
Text("Explore",
     comment: "The title of the tab bar item that navigates to the Explore screen.")
"""

    var body: some View {
      Text(markdownText).padding()
    }
}

#Preview {
    TextLocalizationView()
}

//
//  Markdown+.swift
//  SwiftyCatalog
//
//  Created by June Kim on 2024-10-08.
//

import MarkdownUI
import SwiftUI

struct Swifty: View {
  var code: String
  var body: some View {
    Markdown {"```swift\n" + code + "\n```"
    }.markdownTheme(.gitHub)
  }
}

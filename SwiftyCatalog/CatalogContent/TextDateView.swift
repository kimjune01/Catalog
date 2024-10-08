//
//  TextDateView.swift
//  SwiftyCatalog
//
//  Created by June Kim on 2024-10-08.
//

import SwiftUI
import MarkdownUI

struct TextDateView: View {
  var body: some View {
    ScrollView{
      VStack(alignment: .leading, spacing: 20) {
        Text(Date(), style: .date)
          .block()
        Swifty(code:"Text(Date(), style: .date)")
        Divider()
        Text(Date(timeIntervalSinceNow: 300), style: .offset)
          .block()
        Swifty(code:"Text(Date(timeIntervalSinceNow: 300), style: .offset)")
        Divider()
        Text(Date(), style: .relative)
          .block()
        Swifty(code:"Text(Date(), style: .relative)")
        Divider()
        Text(Date(), style: .time)
          .block()
        Swifty(code:"Text(Date(), style: .time)")
        Divider()
        Text(Date(), style: .timer)
          .block()
        Swifty(code: "Text(Date(), style: .timer)")
        Divider()
        Text(Date(), format: .iso8601)
          .block()
        Swifty(code: "Text(Date(), format: .iso8601)")
        Divider()
        Text(Date(), format: .dateTime)
          .block()
        Swifty(code: "Text(Date(), format: .dateTime)")
        
      }
    }.padding()
  }
}

#Preview {
  TextDateView()
}

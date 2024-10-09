//
//  FontsView.swift
//  SwiftyCatalog
//
//  Created by June Kim on 2024-10-08.
//

import SwiftUI
#if os(iOS)
import UIKit

struct FontsView: View {
  private static let fontNames: [String] = {
    var names = [String]()
    for familyName in UIFont.familyNames {
      names.append(contentsOf: UIFont.fontNames(forFamilyName: familyName))
    }
    return names.sorted()
  }()
  
  var body: some View {
    ScrollView {
      VStack(spacing: 8) {
        ForEach(FontsView.fontNames, id: \.self) { fontName in
          Text(fontName)
            .font(Font.custom(fontName, size: 17))
        }
      }
      .padding()
    }
  }
}
#else
struct FontsView: View {
  var body: some View {
    Link("iosfonts.com", destination: URL(string: "http://iosfonts.com/")!)
  }
}
#endif

#Preview {
  FontsView()
}

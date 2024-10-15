//
//  DraggableView.swift
//  SwiftyCatalog
//
//  Created by June Kim on 2024-10-14.
//

import SwiftUI

struct DraggableView: View {
  @State private var message = ""
  
  var body: some View {
    VStack(spacing: 20) {
      Canvas { context, size in
        let formattedText = Text(message).font(.largeTitle).foregroundStyle(.red)
        context.draw(formattedText, in: CGRect(origin: .zero, size: size))
      }
      .dropDestination(for: String.self) { items, location in
        message = items.first ?? ""
        return true
      }
      
    }
  }
  
}

#Preview {
  DraggableView()
}

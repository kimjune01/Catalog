//
//  TextLayout.swift
//  SwiftyCatalog
//
//  Created by June Kim on 2024-10-08.
//

import SwiftUI

struct TextPositionView: View {
  @State private var kerning: CGFloat = 0
  @State private var baselineOffset: CGFloat = 0
  @State private var lineSpacing: CGFloat = 0
  let alignments: [TextAlignment] = [.leading, .center, .trailing]
  @State private var alignment = TextAlignment.leading
  let truncationModes: [Text.TruncationMode] = [.head, .middle, .tail]
  @State private var truncationMode = Text.TruncationMode.head

  var body: some View {
    ScrollView(.vertical) {
      Text("Inline Positioning")
        .font(.headline)
      VStack(alignment: .leading, spacing: 20) {
        Text("The quick brown fox jumps over the lazy dog")
          .background(.fill)
          .block()
          .kerning(kerning)
          .baselineOffset(baselineOffset)
          .lineSpacing(lineSpacing)
        
        Stepper { Text("kerning: \(kerning)") }
        onIncrement: { kerning += 0.1 }
        onDecrement: { kerning -= 0.1 }
        Stepper { Text("baselineOffset: \(baselineOffset)") }
        onIncrement: { baselineOffset += 1 }
        onDecrement: { baselineOffset -= 1 }
        Stepper { Text("lineSpacing: \(lineSpacing)") }
        onIncrement: { lineSpacing += 1 }
        onDecrement: { lineSpacing -= 1 }
        Divider()

      }.padding(.bottom, 20)
      
      Text("Paragraph Text Alignment")
        .font(.headline)
      
      VStack(alignment: .center, spacing: 20) {
        Picker("Text alignment", selection: $alignment) {
          ForEach(alignments, id: \.self) { alignment in
            Text(String(describing: alignment))
          }
        }
        
        Text("This is an extremely long text string that will never fit even the widest of phones without wrapping")
          .font(.title)
          .multilineTextAlignment(alignment)
        Divider()
      }.padding()
      
      Text("Truncation Mode")
        .font(.headline)
      
      VStack(alignment: .center, spacing: 20) {
        Picker("Truncation mode", selection: $truncationMode) {
          ForEach(truncationModes, id: \.self) { alignment in
            Text(String(describing: alignment))
          }
        }
        Text("This is an extremely long text string that will never fit even the widest of phones without wrapping")
          .font(.title)
          .truncationMode(truncationMode)
          .lineLimit(2)
        Divider()
      }.padding()

    }.padding()
  }
}

#Preview {
  TextPositionView()
}

//
//  PickerView.swift
//  SwiftyCatalog
//
//  Created by June Kim on 2024-10-10.
//

import SwiftUI

struct PickerView: View {
  let alignments: [TextAlignment] = [.leading, .center, .trailing]
  @State private var alignmentOne = TextAlignment.leading
  @State private var alignmentTwo = TextAlignment.leading
  @State private var alignmentThree = TextAlignment.leading
  @State private var alignmentFour = TextAlignment.leading
  @State private var alignmentFive = TextAlignment.leading
  @State private var alignmentSix = TextAlignment.leading
  @State private var alignmentSeven = TextAlignment.leading
  let alignmentImages: [TextAlignment: Image] = [
    .leading : .init(systemName: "text.justify.leading"),
    .center: .init(systemName: "text.justify"),
    .trailing: .init(systemName: "text.justify.trailing"),
  ]
  
  var body: some View {
    ScrollView {
      VStack(spacing: 20) {
        Text("Menu (default on iOS)").font(.headline)
        Picker("Text alignment", selection: $alignmentOne) {
          ForEach(alignments, id: \.self) { alignment in
            Text(String(describing: alignment))
          }
        }
        .pickerStyle(.menu)
        .block()
        Divider()
        
        VStack {
          Text("Segmented").font(.headline)
          Picker("Text alignment", selection: $alignmentTwo) {
            ForEach(alignments, id: \.self) { alignment in
              Text(String(describing: alignment))
            }
          }
          .pickerStyle(.segmented)
        }
        .block()
        
        VStack {
          Text("Inline").font(.headline)
          Picker("Text alignment", selection: $alignmentFour) {
            ForEach(alignments, id: \.self) { alignment in
              Text(String(describing: alignment))
            }
          }
          .pickerStyle(.inline)
        }
        .block()
        Divider()
        
        Text("Navigation Link").font(.headline)
        NavigationView {
          VStack {
            Picker("Text alignment", selection: $alignmentFive) {
              ForEach(alignments, id: \.self) { alignment in
                Text(String(describing: alignment))
              }
            }
            .pickerStyle(.navigationLink)
          }
        }
        .frame(width: 300, height:200)
        .block()
        Divider()
        
        Text("With a Label").font(.headline)
        VStack {
          Picker(selection: $alignmentSeven, label: Text("Alignment")) {
            ForEach(alignments, id: \.self) { alignment in
              Label {
                Text(String(describing: alignment))
              } icon: {
                self.alignmentImages[alignment]
              }.tag(alignment)
            }
          }
          Picker(selection: $alignmentSeven, label: Text("Alignment")) {
            ForEach(alignments, id: \.self) { alignment in
              Label {
                Text(String(describing: alignment))
              } icon: {
                self.alignmentImages[alignment]
              }.tag(alignment)
            }
          }.pickerStyle(.wheel)
          NavigationView {
              Picker("Text alignment", selection: $alignmentFive) {
                ForEach(alignments, id: \.self) { alignment in
                  Label {
                    Text(String(describing: alignment))
                  } icon: {
                    self.alignmentImages[alignment]
                  }.tag(alignment)
                }
              }
              .pickerStyle(.navigationLink)
            
          }
          .frame(width: 300, height:200)
        }.block()
        Divider()
        
        
      }
    }.padding()
  }
}

#Preview {
  PickerView()
}

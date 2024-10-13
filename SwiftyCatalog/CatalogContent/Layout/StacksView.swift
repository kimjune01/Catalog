//
//  StacksView.swift
//  SwiftyCatalog
//
//  Created by June Kim on 2024-10-11.
//

import SwiftUI

struct StacksView: View {
  @State private var hStackSpacing: CGFloat = 10
  @State private var hStackAlignmentIndex: Int = 0
  let hStackAlignments: [VerticalAlignment] = [.top, .center, .bottom]
  @State private var vStackSpacing: CGFloat = 10
  @State private var vStackAlignmentIndex: Int = 0
  let vStackAlignments: [HorizontalAlignment] = [.leading, .center, .trailing]
  let blocksCount: Int = 5
  
  @ViewBuilder
  func horizontalItem(height: CGFloat = 50) -> some View {
    RoundedRectangle(cornerSize: .init(width: 12, height: 12))
      .frame(width: 50, height: height)
      .foregroundStyle(.gray)
  }
  @ViewBuilder
  func verticalItem(width: CGFloat = 50) -> some View {
    RoundedRectangle(cornerSize: .init(width: 12, height: 12))
      .frame(width: width, height: 50)
      .foregroundStyle(.gray)
  }
  
  var body: some View {
    ScrollView {
      VStack(spacing: 20) {
        Text("Horizontal Stack").font(.headline)
        HStack(alignment:hStackAlignments[hStackAlignmentIndex],
               spacing: hStackSpacing) {
          ForEach(0..<blocksCount, id: \.self) { idx in
            horizontalItem(height: 40 + CGFloat(idx) * 5)
          }
        }
        HStack {
          Text("Spacing: ").font(.subheadline)
          Slider(value: $hStackSpacing, in: 0...25)
        }
        
        HStack {
          Text("Alignment: ").font(.subheadline)
          Picker("Vertical alignment", selection: $hStackAlignmentIndex) {
            Text("Top").tag(0)
            Text("Center").tag(1)
            Text("Bottom").tag(2)
          }
          .pickerStyle(.segmented)
        }
        Divider()
        
        Text("Vertical Stack").font(.headline)
        VStack(alignment: vStackAlignments[vStackAlignmentIndex],
               spacing: vStackSpacing) {
          ForEach(0..<blocksCount, id: \.self) { idx in
            verticalItem(width: 50 + CGFloat(idx) * 15)
          }
        }
        HStack {
          Text("Spacing: ").font(.subheadline)
          Slider(value: $vStackSpacing, in: 0...25)
        }
        HStack {
          Text("Alignment: ").font(.subheadline)
          Picker("Horizontal alignment", selection: $vStackAlignmentIndex) {
            Text("Leading").tag(0)
            Text("Center").tag(1)
            Text("Trailing").tag(2)
          }
          .pickerStyle(.segmented)
        }
        Divider()
        
        Text("Nested Stack").font(.headline)
        VStack {
          HStack {
            verticalItem()
            verticalItem()
          }
          .padding()
          .background(Color(red: 199/255, green: 225/255, blue: 253/255))
          HStack {
            VStack {
              verticalItem()
              verticalItem()
            }
            .padding()
            .background(Color(red: 228/255, green: 254/255, blue: 233/255))
            verticalItem()
            verticalItem()
          }
          .padding()
          .background(Color(red: 199/255, green: 225/255, blue: 253/255))
        }
        .padding()
        .background(Color(red: 250/255, green: 228/255, blue: 253/255))
        Divider()
        
        Text("Lazy HStack").font(.headline)
        ScrollView(.horizontal) {
          LazyHStack(alignment: .center, spacing: 20) {
            ForEach(1...100, id: \.self) {
              Text("Column \($0)")
            }
          }
        }
        Divider()

        Text("Lazy VStack").font(.headline)
        ScrollView {
          LazyVStack(alignment: .leading) {
            ForEach(1...1000, id: \.self) {
              Text("Row \($0)")
            }
          }
        }
        .frame(height: 300)
        .background(.gray.opacity(0.3))
        
      }
    }.padding()
  }
}

#Preview {
  StacksView()
}

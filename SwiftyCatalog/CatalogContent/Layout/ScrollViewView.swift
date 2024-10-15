//
//  ScrollViewView.swift
//  SwiftyCatalog
//
//  Created by June Kim on 2024-10-11.
//

import SwiftUI

struct ScrollViewView: View {
  
  let squaresCount = 12
  
  @ViewBuilder
  func makeSquare() -> some View {
    RoundedRectangle(cornerRadius: 12)
      .frame(width: 50, height: 50)
      .foregroundStyle(Color.random())
  }
  
  @ViewBuilder
  func makeWideRect() -> some View {
    RoundedRectangle(cornerRadius: 12)
      .frame(width: 250, height: 50)
      .foregroundStyle(Color.random())
  }
  
  @ViewBuilder
  func makeTallRect() -> some View {
    RoundedRectangle(cornerRadius: 12)
      .frame(width: 50, height: 250)
      .foregroundStyle(Color.random())
  }
  
  var body: some View {
    ScrollView {
      VStack(spacing: 20) {
        Text("Vertical scroll").font(.headline)
        ScrollView {
          VStack {
            ForEach(0...squaresCount, id: \.self) { _ in
              makeWideRect()
            }
          }
          .frame(maxWidth: .infinity)
          .padding()
        }
        .frame(
          minWidth: 300,
          maxWidth: .infinity,
          maxHeight: 300
        )
        .background(Color.gray.opacity(0.2))
        Divider()
        
        Text("Horizontal scroll").font(.headline)
        ScrollView(.horizontal) {
          HStack {
            ForEach(0...squaresCount, id: \.self) { _ in
              makeTallRect()
            }
          }
          .padding()
        }
        .frame(
          minWidth: 300,
          maxWidth: .infinity,
          maxHeight: 300
        )
        .clipped()
        .background(Color.gray.opacity(0.2))
        Divider()
        
        Text("Both directions scroll").font(.headline)
        ScrollView([.horizontal, .vertical]) {
          HStack {
            ForEach(0...squaresCount, id: \.self) { _ in
              VStack {
                ForEach(0...squaresCount, id: \.self) { _ in
                  makeSquare()
                }
              }
              .padding()
            }
          }
        }
        .frame(minWidth: 300, maxHeight: 300)
        .clipped()
        .background(Color.gray.opacity(0.2))
        Divider()
      }
    }.padding()
  }
}

#Preview {
  ScrollViewView()
}

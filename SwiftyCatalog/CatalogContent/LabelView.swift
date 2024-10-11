//
//  LabelView.swift
//  SwiftyCatalog
//
//  Created by June Kim on 2024-10-09.
//

import SwiftUI

struct LabelView: View {
  var body: some View {
    ScrollView{
      VStack(spacing: 20) {
        Text("Labels combine text and icon").font(.headline)
        Label("Both", systemImage: "paperplane")
          .font(.title)
          .labelStyle(.titleAndIcon)
        Swifty(code:
          """
            .labelStyle(.titleAndIcon)
          """
        )
        Divider()
        Label("Title Only", systemImage: "heart")
          .font(.title)
          .labelStyle(.titleOnly)
        Swifty(code:
          """
            .labelStyle(.titleOnly)
          """
        )
        Divider()
        
        Label("Icon Only", systemImage: "star")
          .font(.title)
          .labelStyle(.iconOnly)
        Swifty(code:
          """
            .labelStyle(.iconOnly)
          """
        )
        Divider()
        
        
        Text("Customization on text, icon and background").font(.headline)

        let hueColors = stride(from: 0, to: 1, by: 0.01).map {
          Color(hue: $0, saturation: 1, brightness: 1)
        }
        Label {
          VStack {
            Text("Catalog")
              .font(.headline)
              .fontWeight(.semibold)
            Text("User Interface")
              .font(.subheadline)
          }
          .foregroundStyle(.purple)
        } icon: {
          LinearGradient(gradient: Gradient(colors: hueColors),
                         startPoint: .leading,
                         endPoint: .trailing)
          .frame(width: 50, height: 50)
          .mask {
            Image(systemName: "book").scaleEffect(1.8)
          }
        }
        .padding(20)
        .background(.gray.opacity(0.3))
        .clipShape(Capsule())
        
        
        Swifty(code:
          """
          Label {
            VStack {
            Text()
            Text()
            }
            } icon: {
            Image()
          }
          .background()
          """
        )
        Divider()
        
      }
    }.padding()
  }
}

#Preview {
  LabelView()
}

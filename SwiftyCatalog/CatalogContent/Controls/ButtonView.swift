//
//  ButtonView.swift
//  SwiftyCatalog
//
//  Created by June Kim on 2024-10-09.
//

import SwiftUI

enum BorderShape: String, CaseIterable {
  case capsule
  case circle
  case roundedRectangle
}

struct AdaptiveLabelStyle: LabelStyle {
  @Environment(\.verticalSizeClass) var verticalSizeClass: UserInterfaceSizeClass?
  
  func makeBody(configuration: Configuration) -> some View {
    if verticalSizeClass == .compact {
      HStack {
        configuration.icon
        configuration.title
      }
    } else {
      VStack(spacing: 8) {
        configuration.icon
        configuration.title
      }
    }
  }
}

struct ButtonView: View {
  @State private var bgColor = Color.gray.opacity(0.2)
  @State private var fgColor = Color.blue
  @State private var selectedBorderShape: BorderShape = .capsule
  @State private var showConfetti = false
  
  func buttonBorderShape(from shape: BorderShape) -> ButtonBorderShape {
    switch shape {
    case .capsule: return ButtonBorderShape.capsule
    case .circle: return ButtonBorderShape.circle
    case .roundedRectangle: return ButtonBorderShape.roundedRectangle
    }
  }
  var body: some View {
    ZStack(alignment: .bottomTrailing) {
      ScrollView {
        VStack(spacing: 20) {
          Text("Styling").font(.headline)
          Grid() {
            GridRow {
              VStack {
                Button("Button") { }
                  .padding()
                  .foregroundStyle(fgColor)
                  .background(bgColor)
                  .clipShape(.capsule)
                  .block()
                Text("Capsule").font(.caption)
              }
              VStack {
                Button("Button") { }
                  .padding()
                  .foregroundStyle(fgColor)
                  .background(bgColor)
                  .clipShape(.circle)
                  .block()
                Text("Circle").font(.caption)
              }
              VStack {
                Button("Button") { }
                  .padding()
                  .foregroundStyle(fgColor)
                  .background(bgColor)
                  .clipShape(.ellipse)
                  .block()
                Text("Ellipse").font(.caption)
              }
            }
            GridRow {
              VStack {
                Button {showConfetti.toggle()} label: { Image(systemName: "birthday.cake") }
                  .padding()
                  .buttonStyle(.bordered)
                  .block()
                Text("Bordered").font(.caption)
              }
              VStack {
                Button {showConfetti.toggle()} label: { Image(systemName: "birthday.cake") }
                  .padding()
                  .buttonStyle(.borderedProminent)
                  .block()
                Text("Bordered Prominent").font(.caption)
              }
              VStack {
                Button {showConfetti.toggle()} label: { Image(systemName: "birthday.cake") }
                  .padding()
                  .buttonStyle(.plain)
                  .block()
                Text("Plain").font(.caption)
              }
            }
            GridRow {
              VStack {
                Button("Default", action: {})
                  .block()
                Text("No role").font(.caption)
              }
              VStack {
                Button("Delete", role: .destructive, action: {})
                  .block()
                Text("Destructive role").font(.caption)
              }
              VStack {
                Button("Disabled", role: .cancel, action: {})
                  .disabled(true)
                  .block()
                Text("Disabled").font(.caption)
              }
            }
            
            VStack {
              Button {showConfetti.toggle()} label: { Label {
                Text("Happy Birthday")
              } icon: {
                Image(systemName: "birthday.cake")
              }
              }
              .padding()
              .block()
              Text("Using a label").font(.caption)
            }
            VStack {
              Button {showConfetti.toggle()} label: { Label {
                Text("Happy Birthday")
              } icon: {
                Image(systemName: "birthday.cake")
              }.labelStyle(AdaptiveLabelStyle())
              }
              .padding()
              .block()
              Text("Vertical label").font(.caption)
            }
          }
          Divider()
          
          Text("Control Size").font(.headline)
          HStack {
            Button("Mini") {}
              .buttonStyle(.bordered)
              .controlSize(.mini)
            
            Button("Small") {}
              .buttonStyle(.bordered)
              .controlSize(.small)
            
            Button("Regular") {}
              .buttonStyle(.bordered)
              .controlSize(.regular)
            
            Button("Large") {}
              .buttonStyle(.bordered)
              .controlSize(.large)
          }.block()
          Divider()
          
          Text("Menu").font(.headline)
          Menu {
            Button("Order Now", action: {})
            Button("Adjust Order", action: {})
            Menu("Advanced") {
              Button("Rename", action: {})
              Button("Delay", action: {})
            }
            Button("Cancel", action: {})
          } label: {
            Label("Food Options", systemImage: "carrot")
          }
          Divider()
          
        }.displayConfetti(isActive: $showConfetti)
      }.padding()
      Button {
        showConfetti.toggle()
      } label: {
        Image(systemName: "birthday.cake.fill")
          .font(.title.weight(.semibold))
          .padding()
          .background(Color.blue)
          .foregroundColor(.white)
          .clipShape(Circle())
      }.padding()

    }
  }
}

#Preview {
  ButtonView()
}

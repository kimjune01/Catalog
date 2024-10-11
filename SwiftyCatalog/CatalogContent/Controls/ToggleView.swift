//
//  ToggleView.swift
//  SwiftyCatalog
//
//  Created by June Kim on 2024-10-10.
//

import SwiftUI

struct ChecklistToggleStyle: ToggleStyle {
  func makeBody(configuration: Configuration) -> some View {
    Button {
      configuration.isOn.toggle()
    } label: {
      HStack {
        Image(systemName: configuration.isOn
              ? "checkmark.circle"
              : "circle")
        configuration.label
      }
    }
    .tint(.primary)
    .buttonStyle(.borderless)
  }
}

struct RedBorderToggleStyle: ToggleStyle {
  func makeBody(configuration: Configuration) -> some View {
    Toggle(configuration)
      .padding()
      .border(.red)
  }
}

struct ToggleView: View {
  @State var isOne: Bool = false
  @State var isTwo: Bool = false
  @State var twoColor: Color = .clear
  @State var isThree: Bool = false
  @State var isFour: Bool = false
  @State var isFive: Bool = false
  @State var isSix: Bool = false
  @State var isSeven: Bool = false
  
  let colors: [Color] = [.red, .blue, .green, .yellow, .green, .purple, .cyan, .brown]
  var body: some View {
    ScrollView {
      VStack(spacing: 20) {
        Text("Default toggle and styling").font(.headline)
        VStack {
          Toggle("Switch style", isOn: $isOne)
            .toggleStyle(.switch)
          Toggle("Button style", isOn: $isFour)
            .toggleStyle(.button)
        }
        .block()
        Divider()
        
        Text("Tinted").font(.headline)
        Toggle(twoColor.description, isOn: $isTwo)
          .tint(twoColor)
          .onChange(of: isTwo, { oldValue, newValue in
            if newValue {
              twoColor = colors.randomElement()!
            }
          })
          .block()
        Divider()
        
        Text("Styles").font(.headline)
        Toggle("Foreground color", isOn: $isThree)
          .foregroundStyle(.cyan)
        
        Toggle("Checklist style", isOn: $isFive)
          .toggleStyle(ChecklistToggleStyle())
        
        Toggle(isOn: $isSix) {
          Label("With a label", systemImage: "switch.2")
        }
        
        Toggle("With a border", isOn: $isSeven)
          .toggleStyle(RedBorderToggleStyle())
        Divider()
      }
    }.padding()
  }
}

#Preview {
  ToggleView()
}

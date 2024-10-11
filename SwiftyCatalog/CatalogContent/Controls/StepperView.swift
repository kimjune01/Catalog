//
//  StepperView.swift
//  SwiftyCatalog
//
//  Created by June Kim on 2024-10-10.
//

import SwiftUI

struct StepperView: View {
  @State private var value = 1
  let step = 5
  
  @State var stepperValue: Int = 0
  @State var stepperTwoValue: Int = 0
  @State var color: Color = .black
  @State var colorTwo: Color = .clear
  let colors: [Color] = [.red, .blue, .green, .yellow, .orange, .purple, .brown, .pink, .cyan, .white, .black]
  var body: some View {
    ScrollView {
      VStack(spacing: 20) {
        Text("Default stepper").font(.headline)
        Stepper {
          Text("Value: \(stepperValue)")
        } onIncrement: {
          stepperValue += 1
        } onDecrement: {
          stepperValue -= 1
        } onEditingChanged: { _ in
          // do nothing
        }
        .block()
        Divider()
        
        Text("Colored stepper").font(.headline)
        Stepper {
          Text("Value: \(stepperTwoValue)")
        } onIncrement: {
          stepperTwoValue += 1
        } onDecrement: {
          stepperTwoValue -= 1
        } onEditingChanged: { _ in
          color = colors.randomElement()!
          colorTwo = colors.randomElement()!
        }
        .padding()
        .foregroundStyle(color)
        .background(colorTwo)
        .tint(color)
        .block()
        Divider()
        
        Text("With a Label").font(.headline)
        Stepper(value: $value,
                step: step) {
          Label {
            Text("Current value: \(value)")
          } icon: {
            Image(systemName: "figure.stair.stepper")
              .imageScale(.large)
              .foregroundStyle(.blue)
          }
        }
        .block()
        
      }
    }.padding()
  }
}

#Preview {
  StepperView()
}

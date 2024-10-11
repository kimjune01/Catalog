//
//  SliderView.swift
//  SwiftyCatalog
//
//  Created by June Kim on 2024-10-10.
//

import SwiftUI

struct SliderView: View {
  @State private var sliderOneValue: Double = 0.5
  @State private var sliderTwoValue: Double = 0.5
  @State private var isEditingTwo = false

  @State private var sliderThreeValue: Double = 0.5
  @State var color: Color = .purple
  let colors: [Color] = [.red, .green, .yellow, .orange, .purple, .brown, .pink, .cyan, .gray, .black]
  
  var body: some View {
    ScrollView {
      VStack(spacing: 20) {
        Text("Default slider").font(.headline)
        Slider(value: $sliderOneValue, in: 0...1)
          .block()
        Text(sliderOneValue, format: .number.precision(.fractionLength(2)))
          .font(.subheadline)
        Divider()
        
        Text("Styling").font(.headline)
        Slider(value: $sliderTwoValue, in: 0...1, onEditingChanged: { editing in
          isEditingTwo = editing
          color = colors.randomElement()!
        }) {
          Text("Styling").font(.headline)

        }
        .tint(color)
        .block()
        Text(sliderTwoValue, format: .number.precision(.fractionLength(2)))
          .font(isEditingTwo ? .title2 : .subheadline)
          .frame(width: 200, height: 50)
        Divider()
        
        Text("With steps and text").font(.headline)
        Slider(value: $sliderThreeValue,
               in: 0...100,
               step: 20){
          Text("Speed")
        } minimumValueLabel: {
          Text("0")
        } maximumValueLabel: {
          Text("100")
        }
        .block()
        Text("Images are not allowed in place of text").font(.subheadline)

        Divider()
      }
    }.padding()
  }
}

#Preview {
  SliderView()
}

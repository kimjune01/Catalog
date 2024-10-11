//
//  ProgressView.swift
//  SwiftyCatalog
//
//  Created by June Kim on 2024-10-10.
//

import SwiftUI

struct GaugeProgressStyle: ProgressViewStyle {
  var strokeColor = Color.blue
  var strokeWidth = 25.0
  
  func makeBody(configuration: Configuration) -> some View {
    let fractionCompleted = configuration.fractionCompleted ?? 0
    
    return ZStack {
      Circle()
        .trim(from: 0, to: fractionCompleted)
        .stroke(strokeColor, style: StrokeStyle(lineWidth: strokeWidth, lineCap: .round))
        .rotationEffect(.degrees(-90))
    }
  }
}
struct ProgressViewView: View {
  @State var progressOne: Double = 0.0
  @State var progressTwo: Double = 0.5
  @State var progressThree: Double = 0.0
  @State var progressFour: Double = 0.0
  
    var body: some View {
      ScrollView {
        VStack(spacing: 20) {
          HStack {
            VStack {
              ProgressView()
                .controlSize(.mini)
                .block()
              Text("mini")
                .font(.subheadline)
            }
            VStack {
              ProgressView()
                .controlSize(.small)
                .block()
              Text("small")
                .font(.subheadline)
            }
            VStack {
              ProgressView()
                .controlSize(.regular)
                .block()
              Text("regular")
                .font(.subheadline)
            }
            VStack {
              ProgressView()
                .controlSize(.large)
                .block()
              Text("large")
                .font(.subheadline)
            }
            VStack {
              ProgressView()
                .controlSize(.extraLarge)
                .block()
              Text("extra large")
                .font(.subheadline)
            }
          }
          .padding()

          HStack {
            VStack {
              ProgressView()
                .controlSize(.mini)
                .block()
              Text("mini")
                .font(.subheadline)
            }.colorInvert()
            VStack {
              ProgressView()
                .controlSize(.small)
                .block()
              Text("small")
                .font(.subheadline)
            }.colorInvert()
            VStack {
              ProgressView()
                .controlSize(.regular)
                .block()
              Text("regular")
                .font(.subheadline)
            }.colorInvert()
            VStack {
              ProgressView()
                .controlSize(.large)
                .block()
              Text("large")
                .font(.subheadline)
            }.colorInvert()
            VStack {
              ProgressView()
                .controlSize(.extraLarge)
                .block()
              Text("extra large")
                .font(.subheadline)
            }.colorInvert()
          }
          .padding()
          .background(Color.black)
          Divider()

          Text("With a Numeric Value (linear)").font(.headline)
          ProgressView(value: progressOne)
            .block()
          Slider(value: $progressOne, in: 0...1)
            .padding(.horizontal, 50)
          Divider()
          
          Text("Custom Styles").font(.headline)
          ProgressView(value: progressTwo)
            .progressViewStyle(GaugeProgressStyle())
            .frame(width: 200, height: 200)
            .block()
          Slider(value: $progressTwo, in: 0...1)
            .padding(.horizontal, 50)
          Divider()
          
        }
      }.padding()
    }
}

#Preview {
  ProgressViewView()
}

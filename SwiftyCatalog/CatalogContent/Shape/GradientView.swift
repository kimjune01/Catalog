//
//  GradientView.swift
//  SwiftyCatalog
//
//  Created by June Kim on 2024-10-10.
//

import SwiftUI

struct GradientView: View {
  @State private var grad1: Color = .orange
  @State private var grad2: Color = .white
  @State private var startGrad: UnitPoint = .top
  @State private var endGrad: UnitPoint = .bottom
  @State private var centerGrad: UnitPoint = .center
  @State private var center2Grad: UnitPoint = .center
  
  @State private var sliderStartValue: CGFloat = 1
  @State private var sliderEndValue: CGFloat = 10
  
  let manyColors: [Color] = [.red, .blue, .green, .yellow, .purple, .orange, .white]
  
  private let points: [UnitPoint] = [.top, .bottom, .leading, .trailing, .topTrailing, .topLeading, .bottomTrailing, .bottomLeading, .center]
  private func name(for point: UnitPoint) -> String {
    switch point {
    case .top: return "Top"
    case .bottom: return "Bottom"
    case .leading: return "Leading"
    case .trailing: return "Trailing"
    case .bottomTrailing: return "BottomTrailing"
    case .bottomLeading: return "BottomLeading"
    case .topTrailing: return "TopTrailing"
    case .topLeading: return "TopLeading"
    case .center: return "Center"
    default: return "unknown"
    }
  }
  var body: some View {
    ScrollView {
      VStack(spacing: 20) {
        ColorPicker("Start color", selection: $grad1)
        ColorPicker("End color", selection: $grad2)
        
        Text("Linear Gradient").font(.headline)
        LinearGradient(
          gradient: Gradient(colors: [grad1, grad2]),
          startPoint: startGrad,
          endPoint: endGrad
        ).frame(height: 150)
        HStack {
          Text("Start point: ")
          Picker("Start", selection: $startGrad) {
            ForEach(points, id: \.self) { p in
              Text(name(for: p)).tag(p)
            }
          }
          Text("End point: ")
          Picker("End", selection: $endGrad) {
            ForEach(points, id: \.self) { p in
              Text(name(for: p)).tag(p)
            }
          }
        }
        Divider()
        
        Text("Radial Gradient").font(.headline)
        RadialGradient(
          gradient: Gradient(colors: [grad1, grad2]),
          center: centerGrad,
          startRadius: sliderStartValue * sliderStartValue,
          endRadius: sliderEndValue * sliderEndValue
        ).frame(height: 150)
        HStack {
          Text("Center point: ")
          Picker("center", selection: $centerGrad) {
            ForEach(points, id: \.self) { p in
              Text(name(for: p)).tag(p)
            }
          }
        }
        Slider(value: $sliderStartValue, in: 0...50)
        Text("Start Radius: ").font(.subheadline) +
        Text(sliderStartValue * sliderStartValue, format: .number.precision(.fractionLength(2)))
          .font(.subheadline)
        
        Slider(value: $sliderEndValue, in: 0...50)
        Text("End Radius: ").font(.subheadline) +
        Text(sliderEndValue * sliderEndValue, format: .number.precision(.fractionLength(2)))
          .font(.subheadline)
        Divider()
        
        Text("Angular Gradient").font(.headline)
        AngularGradient(
          gradient: Gradient(colors: [grad1, grad2]),
          center: center2Grad
        ).frame(height: 150)
        HStack {
          Text("Center point: ")
          Picker("center", selection: $center2Grad) {
            ForEach(points, id: \.self) { p in
              Text(name(for: p)).tag(p)
            }
          }
        }
        
        Text("Multi-color Gradients").font(.headline)
        LinearGradient(
          gradient: Gradient(colors: manyColors),
          startPoint: startGrad,
          endPoint: endGrad
        ).frame(height: 100)
        RadialGradient(
          gradient: Gradient(colors: manyColors),
          center: .center,
          startRadius: 1,
          endRadius: 200
        ).frame(height: 100)
        AngularGradient(
          gradient: Gradient(colors: manyColors),
          center: .center
        ).frame(height: 100)

      }
      
    }.padding()
  }
}

#Preview {
  GradientView()
}

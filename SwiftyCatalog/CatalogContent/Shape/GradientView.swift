//
//  GradientView.swift
//  SwiftyCatalog
//
//  Created by June Kim on 2024-10-10.
//

import SwiftUI
import CoreGraphics

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
        Divider()
        
        Text("Mesh Gradient").font(.headline)
        AnimatedColorsMeshGradientView()
          .frame(height: 300)
        
      }
      
    }.padding()
  }
}

#Preview {
  GradientView()
}


struct AnimatedColorsMeshGradientView: View {
  private let colors: [Color] = [
    Color(red: 1.00, green: 0.42, blue: 0.42),
    Color(red: 1.00, green: 0.55, blue: 0.00),
    Color(red: 1.00, green: 0.27, blue: 0.00),
    
    Color(red: 1.00, green: 0.41, blue: 0.71),
    Color(red: 0.85, green: 0.44, blue: 0.84),
    Color(red: 0.54, green: 0.17, blue: 0.89),
    
    Color(red: 0.29, green: 0.00, blue: 0.51),
    Color(red: 0.00, green: 0.00, blue: 0.55),
    Color(red: 0.10, green: 0.10, blue: 0.44)
  ]
  
  private let points: [SIMD2<Float>] = [
    SIMD2<Float>(0.0, 0.0), SIMD2<Float>(0.5, 0.0), SIMD2<Float>(1.0, 0.0),
    SIMD2<Float>(0.0, 0.5), SIMD2<Float>(0.5, 0.5), SIMD2<Float>(1.0, 0.5),
    SIMD2<Float>(0.0, 1.0), SIMD2<Float>(0.5, 1.0), SIMD2<Float>(1.0, 1.0)
  ]
}

extension AnimatedColorsMeshGradientView {
  var body: some View {
    TimelineView(.animation) { timeline in
      MeshGradient(
        width: 3,
        height: 3,
        locations: .points(points),
        colors: .colors(animatedColors(for: timeline.date)),
        background: .black,
        smoothsColors: true
      )
    }
    .ignoresSafeArea()
  }
}

extension AnimatedColorsMeshGradientView {
  private func animatedColors(for date: Date) -> [Color] {
    let phase = CGFloat(date.timeIntervalSince1970)
    
    return colors.enumerated().map { index, color in
      let hueShift = cos(phase + Double(index) * 0.3) * 0.1
      return shiftHue(of: color, by: hueShift)
    }
  }
  
  private func shiftHue(of color: Color, by amount: Double) -> Color {
    var hue: CGFloat = 0
    var saturation: CGFloat = 0
    var brightness: CGFloat = 0
    var alpha: CGFloat = 0
    
    UIColor(color).getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: &alpha)
    
    hue += CGFloat(amount)
    hue = hue.truncatingRemainder(dividingBy: 1.0)
    
    if hue < 0 {
      hue += 1
    }
    
    return Color(hue: Double(hue), saturation: Double(saturation), brightness: Double(brightness), opacity: Double(alpha))
  }
}

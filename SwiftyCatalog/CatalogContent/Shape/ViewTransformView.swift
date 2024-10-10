//
//  ImageOrientationView.swift
//  SwiftyCatalog
//
//  Created by June Kim on 2024-10-09.
//

import SwiftUI

struct ViewTransformView: View {
  private var bigBuckBunny = "bbb-splash"
  @State private var xScale: CGFloat = 1
  @State private var yScale: CGFloat = 1
  @State private var rotation: CGFloat = 0
  
  @State private var dRotation: CGFloat = 0
  @State private var dXAxis: CGFloat = 0
  @State private var dYAxis: CGFloat = 0
  @State private var dZAxis: CGFloat = 0
  @State private var dXAnchor: CGFloat = 0.5
  @State private var dYAnchor: CGFloat = 0.5

  var body: some View {
    ScrollView {
      VStack(spacing: 20) {
        Text("Scale & Rotation").font(.headline)
        Image(bigBuckBunny)
          .resizable()
          .aspectRatio(contentMode: .fill)
          .frame(width: 200, height: 200)
          .clipShape(RoundedRectangle(cornerRadius: 20.0, style: .continuous))
          .scaleEffect(x: xScale, y: yScale)
          .rotationEffect(Angle(degrees: rotation))
          .block()
        HStack {
          Text("X Scale")
          Slider(value: $xScale, in: (-1...1))
        }
        HStack {
          Text("Y Scale")
          Slider(value: $yScale, in: (-1...1))
        }
        HStack {
          Text("Rotation")
          Slider(value: $rotation, in: (-180...180))
        }
        Divider()

        Text("3D Rotation").font(.headline)
        Image(bigBuckBunny)
          .resizable()
          .aspectRatio(contentMode: .fill)
          .frame(width: 200, height: 200)
          .clipShape(RoundedRectangle(cornerRadius: 20.0, style: .continuous))
          .rotation3DEffect(Angle(degrees: dRotation), axis: (x: dXAxis, y: dYAxis, z: dZAxis), anchor: UnitPoint(x: dXAnchor, y: dYAnchor))
          .block()
        HStack {
          Text("3D Rotation angle")
          Slider(value: $dRotation, in: (-180...180))
        }
        HStack {
          Text("X Axis")
          Slider(value: $dXAxis, in: (-1...1))
        }
        HStack {
          Text("Y Axis")
          Slider(value: $dYAxis, in: (-1...1))
        }
        HStack {
          Text("Z Axis")
          Slider(value: $dZAxis, in: (-1...1))
        }
        HStack {
          Text("X Anchor")
          Slider(value: $dXAnchor)
        }
        HStack {
          Text("Y Anchor")
          Slider(value: $dYAnchor)
        }
        Divider()

      }
    }.padding()
  }
}

#Preview {
  ViewTransformView()
}

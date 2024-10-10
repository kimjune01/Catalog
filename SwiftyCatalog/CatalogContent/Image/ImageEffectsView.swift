//
//  ImageEffectsView.swift
//  SwiftyCatalog
//
//  Created by June Kim on 2024-10-09.
//

import SwiftUI

struct ImageEffectsView: View {
  private var bigBuckBunny = "bbb-splash"
  @State private var hueRotation: CGFloat = 0
  @State private var saturation: CGFloat = 1
  @State private var contrast: CGFloat = 1
  @State private var brightness: CGFloat = 0
  @State private var mHue: CGFloat = 0
  @State private var mSaturation: CGFloat = 0
  @State private var mBrightness: CGFloat = 1
  @State private var blur: CGFloat = 1
  @State private var maskText: String = "MASK"
  @State private var gradientValue = 0.1

  var body: some View {
    ScrollView{
      VStack(spacing: 20) {
        Text("Color effects").font(.headline)
        Image(bigBuckBunny)
          .resizable()
          .aspectRatio(contentMode: .fill)
          .frame(width: 200, height: 200)
          .clipShape(RoundedRectangle(cornerRadius: 20.0, style: .continuous))
          .hueRotation(Angle(degrees: hueRotation))
          .saturation(saturation)
          .contrast(contrast)
          .brightness(brightness)
          .block()
        HStack {
          Text("Hue rotation")
          Slider(value: $hueRotation, in: (0...360))
        }
        HStack {
          Text("Saturation")
          Slider(value: $saturation, in: (0...5))
        }
        HStack {
          Text("Contrast")
          Slider(value: $contrast, in: (0...5))
        }
        HStack {
          Text("Brightness")
          Slider(value: $brightness, in: (-1...1))
        }
        Button("Reset") {
          hueRotation = 0
          saturation = 1
          contrast = 1
          brightness = 0
        }
        Divider()
        
        Text("Color Multiply").font(.headline)
        let mColor = Color(hue: mHue, saturation: mSaturation, brightness: mBrightness)
        HStack {
          Image(bigBuckBunny)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 200, height: 200)
            .clipShape(RoundedRectangle(cornerRadius: 20.0, style: .continuous))
            .colorMultiply(mColor)
            .block()
          Circle()
            .fill(mColor)
            .stroke(.tertiary, lineWidth: 1)
            .frame(width: 50, height: 50)
        }
        HStack {
          Text("Saturation")
          Slider(value: $mSaturation, in: (0...1))
        }
        HStack {
          Text("Hue")
          Slider(value: $mHue, in: (0...1))
        }
        HStack {
          Text("Brightness")
          Slider(value: $mBrightness, in: (0...5))
        }
        Button("Reset") {
          mHue = 0
          mSaturation = 0
          mBrightness = 1
        }
        Divider()
        
        Text("Blur").font(.headline)
        HStack {
          Image(bigBuckBunny)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 200, height: 200)
            .blur(radius: blur)
            .clipShape(RoundedRectangle(cornerRadius: 20.0, style: .continuous))
            .block()
          VStack {
            Text(blur, format: .number.rounded(increment: 0.1))
              .font(.title)
              .fontWeight(.light)
            Text("Radius").font(.caption)
          }
        }
        HStack {
          Text("Blur")
          Slider(value: $blur, in: (0...25))
        }
        Divider()
        
        Text("Mask").font(.headline)
        HStack {
          Image(bigBuckBunny)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 300, height: 200)
            .clipShape(RoundedRectangle(cornerRadius: 20.0, style: .continuous))
            .mask(
              ZStack {
                LinearGradient(gradient: Gradient(colors: [.white, .clear]), startPoint: .init(x: gradientValue - 1, y: gradientValue - 1), endPoint: .init(x: gradientValue * 2, y: 1))
                Text(maskText).font(.system(size: 80, weight: .black))
              }
            )
            .block()
        }
        TextField("Mask text", text: $maskText)
          .textFieldStyle(RoundedBorderTextFieldStyle())
          .background(Color.secondary.opacity(0.2))
          .padding(.horizontal, 30)
        HStack {
          Text("Gradient")
          Slider(value: $gradientValue, in: (0...1))
        }
        Divider()
        
        
      }
    }.padding()
  }
}

#Preview {
  ImageEffectsView()
}

//
//  TimingsView.swift
//  SwiftyCatalog
//
//  Created by June Kim on 2024-10-14.
//

import SwiftUI

struct TimingsView: View {
  @State private var moving = false
  @State private var animationTimer: Timer?
  @State private var timingsIdx = 0
  @State private var extraBounce: CGFloat = 0
  @State private var response: CGFloat = 0.5
  @State private var dampingFraction: CGFloat = 0.825
  @State private var blendDuration: CGFloat = 0
  @State private var learnSpringAlert = false
  
  //  response: Double = 0.5, dampingFraction: Double = 0.825, blendDuration: TimeInterval = 0
  
  @State private var duration = 0.5
  func animationFor(idx: Int) -> Animation {
    switch idx {
    case 0: return .easeIn(duration: duration)
    case 1: return .easeOut(duration: duration)
    case 2: return .easeInOut(duration: duration)
    case 3: return .linear(duration: duration)
    case 4: return .bouncy(duration: duration,
                           extraBounce: extraBounce)
    case 5: return .smooth(duration: duration,
                           extraBounce: extraBounce)
    case 6: return .snappy(duration: duration,
                           extraBounce: extraBounce)
    case 7: return .interactiveSpring(duration: duration,
                                      extraBounce: extraBounce)
    case 8: return .spring(response: response,
                           dampingFraction: dampingFraction,
                           blendDuration: blendDuration)
    default: return .easeIn(duration: duration)
    }
  }
  
  func makeTimer() -> Timer {
    animationTimer?.invalidate()
    return Timer.scheduledTimer(withTimeInterval: duration + 1.5, repeats: true) { _ in
      moving.toggle()
      animationTimer = makeTimer()
    }
  }
  var body: some View {
    ScrollView {
      VStack(spacing: 10) {
        Image(systemName: "crop.rotate")
          .resizable()
          .aspectRatio(contentMode: .fit)
          .foregroundStyle(.blue)
          .rotationEffect(Angle(degrees: moving ? 180 : 0))
          .frame(width: 90, height: 90)
          .animation(animationFor(idx: timingsIdx), value: moving)
        HStack(spacing: 20) {
          RoundedRectangle(cornerRadius: moving ? 12 : 60)
            .foregroundStyle(.purple)
            .frame(width: 110, height: 110)
            .animation(animationFor(idx: timingsIdx), value: moving)
          Image(systemName: "balloon.fill")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .scaleEffect(moving ? 1.3 : 0.8)
            .foregroundStyle(.pink)
            .frame(width: 90, height: 90)
            .animation(animationFor(idx: timingsIdx), value: moving)
        }
        Image(systemName: "figure.flexibility")
          .resizable()
          .aspectRatio(contentMode: .fit)
          .frame(width: 90, height: 90)
          .offset(x: moving ? -80 : 80)
          .animation(animationFor(idx: timingsIdx), value: moving)
          .onAppear {
            moving.toggle()
            animationTimer = makeTimer()
          }
        Divider()
        
        HStack {
          VStack {
            Text("Duration")
            Text(duration, format: .number.rounded(increment: 0.1))
          }
          Slider(value: $duration, in: 0.1...5) {
            Text("\(duration, specifier: "%.2f")")
          }
        }
        Picker("Text alignment", selection: $timingsIdx) {
          Text("Ease In").tag(0)
          Text("Ease Out").tag(1)
          Text("Ease InOut").tag(2)
          Text("Linear").tag(3)
          Text("Bouncy Spring").tag(4)
          Text("Smooth Spring").tag(5)
          Text("Snappy Spring").tag(6)
          Text("Interactive Spring").tag(7)
          Text("Custom Spring").tag(8)
        }
        .frame(height: 150)
        .pickerStyle(.wheel)
        
        if timingsIdx >= 4, timingsIdx <= 7 {
          HStack {
            VStack {
              Text(extraBounce, format: .number.rounded(increment: 0.01))
              Slider(value: $extraBounce, in:0...0.5)
                .frame(width: 100)
              Text("Extra\nBounce\n")
                .multilineTextAlignment(.center)
            }
          }
        } else if timingsIdx == 8 {
          HStack(alignment: .top) {
            VStack {
              Text(response, format: .number.rounded(increment: 0.01))
              Slider(value: $response, in:0...1)
                .frame(width: 100)
              Text("Response")
                .multilineTextAlignment(.center)
            }
            VStack {
              Text(dampingFraction, format: .number.rounded(increment: 0.01))
              Slider(value: $dampingFraction, in:0...2)
                .frame(width: 100)
              Text("Damping\nFraction\n")
                .multilineTextAlignment(.center)
            }
            VStack {
              Text(blendDuration, format: .number.rounded(increment: 0.01))
              Slider(value: $blendDuration, in:0...2)
                .frame(width: 100)
              Text("Blend\nDuration\n")
                .multilineTextAlignment(.center)
            }
          }
          Button {learnSpringAlert.toggle()} label: { Label {
            Text("Learn more")
          } icon: {
            Image(systemName: "questionmark.app")
          }
          }
          .sheet(isPresented: $learnSpringAlert) {
            VStack(spacing: 10) {
              Text("Response").font(.headline)
              Text("The stiffness of the spring, defined as an approximate duration in seconds. A value of zero requests an infinitely-stiff spring, suitable for driving interactive animations.")
              Text("Damping Fraction").font(.headline)
              Text("The amount of drag applied to the value being animated, as a fraction of an estimate of amount needed to produce critical damping.")
              Text("Blend Duration").font(.headline)
              Text("The duration in seconds over which to interpolate changes to the response value of the spring.")
            }.padding()
          }
          
        }
        
      }.padding()
      
    }
  }
}

#Preview {
  TimingsView()
}

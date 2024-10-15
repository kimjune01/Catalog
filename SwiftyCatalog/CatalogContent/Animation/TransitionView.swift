//
//  TransitionView.swift
//  SwiftyCatalog
//
//  Created by June Kim on 2024-10-14.
//

import SwiftUI

struct TransitionView: View {
  @State private var transitionZero = false
  @State private var transitionOne = false
  @State private var transitionTwo = false
  @State private var transitionThree = false
  @State private var transitionFour = false
  @State private var transitionFive = false
  let edges: [Edge] = [.bottom, .top, .leading, .trailing]
  
  let stageHeight: CGFloat = 40
  
  var body: some View {
    ScrollView {
      
      VStack(spacing: 20) {
        Text("Transitions are used to animate views appearing and disappearing")
          .font(.headline)
          .padding()
        Button("Opacity") {
          withAnimation { transitionZero.toggle() }
        }
        VStack(spacing: 20) {
          if transitionZero {
            Text("Fade in and out").font(.system(size: 24, weight: .light))
              .transition(.opacity)
          }
        }
        .frame(height: stageHeight)
        Divider()
        
        Button("Move") {
          withAnimation { transitionOne.toggle() }
        }
        VStack(spacing: 20) {
          if transitionOne {
            Text("To and from any direction").font(.system(size: 24, weight: .light))
              .transition(.move(edge: edges.randomElement()!))
          }
        }
        .frame(height: stageHeight)
        Divider()
        
        Button("Slide") { withAnimation { transitionThree.toggle() } }
        VStack(spacing: 20) {
          if transitionThree {
            Text("Moving from left then right")
              .font(.system(size: 24, weight: .light))
              .transition(.slide)
          }
        }
        .frame(height: stageHeight)
        Divider()
        
        Button("Scale") {
          withAnimation { transitionFour.toggle() }
        }
        VStack(spacing: 20) {
          if transitionFour {
            Text("If I could only see the scale")
              .font(.system(size: 24, weight: .light))
              .transition(.scale)
          }
        }
        .frame(height: stageHeight)
        Divider()
        
        Button("Blur Replace") {
          withAnimation { transitionFive.toggle() }
        }
        VStack(spacing: 20) {
          if transitionFive {
            Text("Blurry").font(.system(size: 24, weight: .light))
              .font(.system(size: 24, weight: .light))
              .transition(.blurReplace)
          }
        }
        .frame(height: stageHeight)
        Divider()
        
        Button("Combined Tranition") {
          withAnimation { transitionTwo.toggle() }
        }
        VStack(spacing: 20) {
          if transitionTwo {
            Text("Peekaboo").font(.system(size: 24, weight: .light))
              .font(.system(size: 24, weight: .light))
              .transition(
                .move(edge: edges.randomElement()!)
                .combined(with: .opacity)
                .combined(with: .blurReplace))
          }
        }
        .frame(height: stageHeight)
        Divider()
        
        
      }
    }
    
  }
}

#Preview {
  TransitionView()
}

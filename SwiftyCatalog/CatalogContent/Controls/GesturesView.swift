//
//  GesturesView.swift
//  SwiftyCatalog
//
//  Created by June Kim on 2024-10-11.
//

import SwiftUI

struct GesturesView: View {
  @State private var lastGesture = ""
  let gesturesAvailable = ["Tap", "Double Tap", "Triple Tap", "Drag", "Rotate", "Magnify", "LongPress"]
  let columns = [
    GridItem(.adaptive(minimum: 120, maximum: 150), alignment: .leading)
  ]
  @State private var latestGesture = ""
  @State private var latestGestureState = ""
  @State var magScale: CGFloat = 1
  @State var progressingScale: CGFloat = 1
  
  var magGesture = MagnificationGesture()
  var dragGesture = DragGesture()
  var rotateGesture = RotateGesture()
  
  var body: some View {
    VStack(spacing: 20) {
      Grid(horizontalSpacing: 20, verticalSpacing: 10) {
        GridRow {
          Text("Latest gesture")
          Text("Current gesture state")
        }
        GridRow {
          Text(latestGesture).font(.headline)
          Text(latestGestureState).font(.headline)
        }
      }
      ZStack {
        RoundedRectangle(cornerRadius: 12)
          .frame(width: 300, height: 300)
          .foregroundStyle(.gray.opacity(0.3))
          .onTapGesture {
            latestGesture = "Tap"
          }
          .onTapGesture(count: 2, perform: {
            latestGesture = "Double Tap"
          })
          .onTapGesture(count: 3, perform: {
            latestGesture = "Triple Tap"
          })
          .onLongPressGesture(perform: {
            latestGesture = "Long press"
          }, onPressingChanged: { pressing in
            latestGestureState = pressing ? "Pressing" : ""
          })
          .gesture(
            magGesture
              .onChanged {
                progressingScale = $0
                latestGestureState = "Magnifying"
              }
              .onEnded {
                magScale *= $0
                progressingScale = 1
                latestGesture = "Magnify"
                latestGestureState = ""
              }
          )
          .gesture(
            dragGesture
              .onChanged({ dragValue in
                latestGestureState = "Dragging"
              })
              .onEnded({ dragValue in
                latestGesture = "Drag"
              })
          )
          .gesture(
            rotateGesture
              .onChanged({ rotateValue in
                latestGestureState = "Rotating"
              })
              .onEnded({ rotateValue in
                latestGesture = "Rotate"
              })
          )
        Image(systemName: "hand.rays.fill")
          .scaleEffect(magScale * progressingScale * 5)
          .foregroundStyle(.white)
          .allowsHitTesting(false)
      }
      Text("Try gesturing on the shape above").font(.subheadline)
      Divider()
      
      Text("Gestures available: ").font(.headline)
      LazyVGrid(columns: columns, alignment: .leading, spacing: 10) {
        ForEach(gesturesAvailable, id: \.self) { gesture in
          Text(gesture).font(.system(size: 16, weight: .semibold))
            .padding(9)
            .cornerRadius(8)
            .background(.gray.opacity(0.2))
        }
      }
      Text("Other two finger gestures are not available yet.").font(.subheadline)
    }.padding()
  }
}

#Preview {
  GesturesView()
}

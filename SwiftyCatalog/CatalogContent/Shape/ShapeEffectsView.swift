//
//  ShapeEffectsView.swift
//  SwiftyCatalog
//
//  Created by June Kim on 2024-10-10.
//

import SwiftUI

struct ShapeEffectsView: View {
  @State private var dashPhase: CGFloat = 0
  @State private var strokeProgress: CGFloat = 0.5

  @State private var shadowValue: CGFloat = 10
  @State private var shadowOffsetValue: CGFloat = 0
  
  var body: some View {
    ScrollView {
      VStack(spacing: 20) {

        Text("Basic effects").font(.headline)
        HStack(spacing: 20) {
          VStack {
            Circle()
              .stroke(style: .init(lineWidth: 2, dash: [10, 5]))
              .foregroundStyle(.gray)
              .frame(width: 80, height: 80)
            Text("Dash")
              .lineLimit(2)
              .font(.subheadline)
          }
          VStack {
            Circle()
              .stroke(.red, lineWidth: 2)
              .foregroundStyle(.gray)
              .frame(width: 80, height: 80)
            Text("Red stroke")
              .font(.subheadline)
          }
          VStack {
            Circle()
              .stroke(.red, lineWidth: 7)
              .fill(.yellow)
              .foregroundStyle(.gray)
              .frame(width: 80, height: 80)
            Text("Stroke & fill")
              .font(.subheadline)
          }
        }
        Divider()
        
        Text("Shadow effects").font(.headline)
        HStack(spacing: 20) {
          VStack {
            Circle()
              .foregroundStyle(.secondary)
              .shadow(radius: shadowValue, x: shadowOffsetValue, y: shadowOffsetValue)
              .frame(width: 80, height: 80)
          }
          VStack {
            Circle()
              .foregroundStyle(.selection)
              .shadow(radius: shadowValue, x: shadowOffsetValue, y: shadowOffsetValue)
              .frame(width: 80, height: 80)
          }
        }
        HStack {
          Text("Radius: ").font(.subheadline)
          Slider(value: $shadowValue, in: 0...50)
        }
        HStack {
          Text("Offset: ").font(.subheadline)
          Slider(value: $shadowOffsetValue, in: -50...50)
        }
        Divider()
        Text("Stroke Style").font(.headline)
        Grid(horizontalSpacing: 20, verticalSpacing: 20) {
          GridRow {
            VStack {
              Circle()
                .stroke(style: .init(lineWidth: 6, lineCap: .butt, dash: [11, 10]))
                .foregroundStyle(.gray)
                .frame(width: 80, height: 80)
              Text("lineCap:butt")
                .lineLimit(2)
                .font(.subheadline)
            }
            VStack {
              Circle()
                .stroke(style: .init(lineWidth: 6, lineCap: .round, dash: [5, 20]))
                .foregroundStyle(.gray)
                .frame(width: 80, height: 80)
              Text("lineCap:round")
                .lineLimit(2)
                .font(.subheadline)
            }
            VStack {
              Circle()
                .stroke(style: .init(lineWidth: 6, lineCap: .square, dash: [5, 20]))
                .foregroundStyle(.gray)
                .frame(width: 80, height: 80)
              Text("lineCap:square")
                .lineLimit(2)
                .font(.subheadline)
            }
          }
          GridRow {
            VStack {
              Rectangle()
                .stroke(style: .init(lineWidth: 20, lineCap: .butt, lineJoin: .bevel))
                .foregroundStyle(.gray)
                .frame(width: 60, height: 60)
                .padding()
              Text("lineJoin:bevel")
                .lineLimit(2)
                .font(.subheadline)
            }
            VStack {
              Rectangle()
                .stroke(style: .init(lineWidth: 20, lineCap: .butt, lineJoin: .miter))
                .foregroundStyle(.gray)
                .frame(width: 60, height: 60)
                .padding()
              Text("lineJoin:miter")
                .lineLimit(2)
                .font(.subheadline)
            }
            VStack {
              Rectangle()
                .stroke(style: .init(lineWidth: 20, lineCap: .butt, lineJoin: .round))
                .foregroundStyle(.gray)
                .frame(width: 60, height: 60)
                .padding()
              Text("lineJoin:round")
                .lineLimit(2)
                .font(.subheadline)
            }
          }
        }
        Divider()
        
        Text("Fill style").font(.headline)
        HStack(spacing: 20) {
          VStack {
            Circle()
              .fill(TintShapeStyle())
              .tint(.green)
              .frame(width: 80, height: 80)
            Text("Tint Shape")
              .font(.subheadline)
          }
          VStack {
            Circle()
              .fill(SelectionShapeStyle())
              .frame(width: 80, height: 80)
            Text("Selection Shape")
              .font(.subheadline)
          }
          VStack {
            Circle()
              .fill(ImagePaint(image: Image(systemName: "star")))
              .frame(width: 80, height: 80)
            Text("ImagePaint")
              .font(.subheadline)
          }
        }
        Divider()

        Text("Dash Phase").font(.headline)
        Circle()
          .stroke(style: .init(lineWidth: 4, dash: [10, 5], dashPhase: dashPhase))
          .foregroundStyle(.gray)
          .frame(width: 80, height: 80)
        Slider(value: $dashPhase, in: 0...50)
          .padding(.horizontal, 50)
        Divider()
        
        Text("Stroke trim").font(.headline)
        Circle()
          .trim(from: 0, to: strokeProgress)
          .stroke(style: .init(lineWidth: 4))
          .foregroundStyle(.gray)
          .frame(width: 80, height: 80)
        Slider(value: $strokeProgress, in: 0...1)
          .padding(.horizontal, 50)
        Divider()
        
        
      }
    }.padding()
  }
}

#Preview {
  ShapeEffectsView()
}

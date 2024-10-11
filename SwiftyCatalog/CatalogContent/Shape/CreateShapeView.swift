//
//  CreateShapeView.swift
//  SwiftyCatalog
//
//  Created by June Kim on 2024-10-10.
//

import SwiftUI

struct HexagonParameters {
  struct Segment {
    let line: CGPoint
    let curve: CGPoint
    let control: CGPoint
  }
  
  static let adjustment: CGFloat = 0.085
  
  
  static let segments = [
    Segment(
      line:    CGPoint(x: 0.60, y: 0.05),
      curve:   CGPoint(x: 0.40, y: 0.05),
      control: CGPoint(x: 0.50, y: 0.00)
    ),
    Segment(
      line:    CGPoint(x: 0.05, y: 0.20 + adjustment),
      curve:   CGPoint(x: 0.00, y: 0.30 + adjustment),
      control: CGPoint(x: 0.00, y: 0.25 + adjustment)
    ),
    Segment(
      line:    CGPoint(x: 0.00, y: 0.70 - adjustment),
      curve:   CGPoint(x: 0.05, y: 0.80 - adjustment),
      control: CGPoint(x: 0.00, y: 0.75 - adjustment)
    ),
    Segment(
      line:    CGPoint(x: 0.40, y: 0.95),
      curve:   CGPoint(x: 0.60, y: 0.95),
      control: CGPoint(x: 0.50, y: 1.00)
    ),
    Segment(
      line:    CGPoint(x: 0.95, y: 0.80 - adjustment),
      curve:   CGPoint(x: 1.00, y: 0.70 - adjustment),
      control: CGPoint(x: 1.00, y: 0.75 - adjustment)
    ),
    Segment(
      line:    CGPoint(x: 1.00, y: 0.30 + adjustment),
      curve:   CGPoint(x: 0.95, y: 0.20 + adjustment),
      control: CGPoint(x: 1.00, y: 0.25 + adjustment)
    )
  ]
}

struct CreateShapeView: View {
  static let gradientStart = Color(red: 239.0 / 255, green: 120.0 / 255, blue: 221.0 / 255)
  static let gradientEnd = Color(red: 239.0 / 255, green: 172.0 / 255, blue: 120.0 / 255)
  
  func HexagonBadge() -> some View {
    GeometryReader { geometry in
      Path { path in
        var width: CGFloat = min(geometry.size.width, geometry.size.height)
        let height = width
        let xScale: CGFloat = 0.832
        let xOffset = (width * (1.0 - xScale)) / 2.0
        width *= xScale
        path.move(
          to: CGPoint(
            x: width * 0.95 + xOffset,
            y: height * (0.20 + HexagonParameters.adjustment)
          )
        )
        HexagonParameters.segments.forEach { segment in
          path.addLine(
            to: CGPoint(
              x: width * segment.line.x + xOffset,
              y: height * segment.line.y
            )
          )
          path.addQuadCurve(
            to: CGPoint(
              x: width * segment.curve.x + xOffset,
              y: height * segment.curve.y
            ),
            control: CGPoint(
              x: width * segment.control.x + xOffset,
              y: height * segment.control.y
            )
          )
        }
      }.fill(.linearGradient(
        Gradient(colors: [Self.gradientStart, Self.gradientEnd]),
        startPoint: UnitPoint(x: 0.5, y: 0),
        endPoint: UnitPoint(x: 0.5, y: 0.6)
      ))
    }
  }
  
    var body: some View {
      ScrollView {
        VStack(spacing: 20) {
          Text("Basic shapes").font(.headline)
          Grid(horizontalSpacing: 20, verticalSpacing: 15) {
            GridRow {
              VStack {
                Circle()
                  .foregroundStyle(.gray)
                  .frame(width: 80, height: 80)
                Text("Circle").font(.subheadline)
              }
              VStack {
                Ellipse()
                  .foregroundStyle(.gray)
                  .frame(width: 80, height: 50)
                Text("Ellipse").font(.subheadline)
              }
              VStack {
                Rectangle()
                  .foregroundStyle(.gray)
                  .frame(width: 80, height: 80)
                Text("Rectangle").font(.subheadline)
              }
            }
            GridRow {
              VStack {
                RoundedRectangle(cornerSize: .init(width: 15, height: 15))
                  .foregroundStyle(.gray)
                  .frame(width: 80, height: 80)
                Text("Rounded Rectangle")
                  .lineLimit(2)
                  .frame(width: 80)
                  .font(.subheadline)
              }
              VStack {
                Capsule()
                  .frame(width: 80, height: 50)
                  .foregroundStyle(.gray)

                Text("Capsule").font(.subheadline)
              }
              VStack {
                UnevenRoundedRectangle(cornerRadii: .init(topLeading: 15, bottomTrailing: 15))
                  .foregroundStyle(.gray)
                  .frame(width: 80, height: 80)
                Text("Uneven Rounded Rectangle")
                  .frame(width: 80)
                  .font(.subheadline)
              }
            }
          }
          Divider()
          
          Text("Corner Style").font(.headline)
          HStack(spacing: 20) {
            VStack {
              UnevenRoundedRectangle(cornerRadii: .init(topLeading: 35, bottomTrailing: 35), style: .circular)
                .foregroundStyle(.gray)
                .frame(width: 80, height: 80)
              Text("Circular")
                .lineLimit(2)
                .frame(width: 80)
                .font(.subheadline)
            }
            VStack {
              UnevenRoundedRectangle(cornerRadii: .init(topLeading: 35, bottomTrailing: 35), style: .continuous)
                .foregroundStyle(.gray)
                .frame(width: 80, height: 80)
              Text("Continuous")
                .lineLimit(2)
                .frame(width: 80)
                .font(.subheadline)
            }
          }
          Divider()
          
          
          Text("Custom shapes").font(.headline)
          HexagonBadge()
            .frame(width: 80, height: 80)
          Text("Any shape can be drawn using paths and geometry.")
            .lineLimit(2)
            .font(.subheadline)
        }
      }.padding()
    }
}

#Preview {
    CreateShapeView()
}

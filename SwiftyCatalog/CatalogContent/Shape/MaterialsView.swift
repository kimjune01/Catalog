//
//  MaterialsView.swift
//  SwiftyCatalog
//
//  Created by June Kim on 2024-10-10.
//

import SwiftUI

struct MaterialsView: View {
    var body: some View {
      ZStack {
        Image("river")
          .resizable()
          .scaledToFill()
          .aspectRatio(contentMode: .fill)
          .ignoresSafeArea(.all)
        ScrollView {
          VStack(spacing: 20) {

            Divider().padding(.vertical, 100)
            Text("Light background").font(.headline)
            Grid(horizontalSpacing: 20, verticalSpacing: 20) {
              GridRow {
                VStack {
                  Text("Hello")
                    .padding()
                    .background(
                      .ultraThinMaterial,
                      in: RoundedRectangle(cornerRadius: 8, style: .continuous)
                    )
                  Text("Ultrathin Material")
                    .font(.subheadline)
                }
                VStack {
                  Text("Hello")
                    .padding()
                    .background(
                      .thinMaterial,
                      in: RoundedRectangle(cornerRadius: 8, style: .continuous)
                    )
                  Text("Thin Material")
                    .font(.subheadline)
                }
                VStack {
                  Text("Hello")
                    .padding()
                    .background(
                      .regularMaterial,
                      in: RoundedRectangle(cornerRadius: 8, style: .continuous)
                    )
                  Text("Regular Material")
                    .font(.subheadline)
                }
              }
              GridRow {
                VStack {
                  Text("Hello")
                    .padding()
                    .background(
                      .thickMaterial,
                      in: RoundedRectangle(cornerRadius: 8, style: .continuous)
                    )
                  Text("Thick Material")
                    .font(.subheadline)
                }
                VStack {
                  Text("Hello")
                    .padding()
                    .background(
                      .ultraThickMaterial,
                      in: RoundedRectangle(cornerRadius: 8, style: .continuous)
                    )
                  Text("Ultrathick Material")
                    .font(.subheadline)
                }
              }
            }
            Divider()
            Text("Dark background").font(.headline)
            Grid(horizontalSpacing: 20, verticalSpacing: 20) {
              GridRow {
                VStack {
                  Text("Hello")
                    .padding()
                    .background(
                      .ultraThinMaterial,
                      in: RoundedRectangle(cornerRadius: 8, style: .continuous)
                    )
                  Text("Ultrathin Material")
                    .font(.subheadline)
                }
                VStack {
                  Text("Hello")
                    .padding()
                    .background(
                      .thinMaterial,
                      in: RoundedRectangle(cornerRadius: 8, style: .continuous)
                    )
                  Text("Thin Material")
                    .font(.subheadline)
                }
                VStack {
                  Text("Hello")
                    .padding()
                    .background(
                      .regularMaterial,
                      in: RoundedRectangle(cornerRadius: 8, style: .continuous)
                    )
                  Text("Regular Material")
                    .font(.subheadline)
                }
              }
              GridRow {
                VStack {
                  Text("Hello")
                    .padding()
                    .background(
                      .thickMaterial,
                      in: RoundedRectangle(cornerRadius: 8, style: .continuous)
                    )
                  Text("Thick Material")
                    .font(.subheadline)
                }
                VStack {
                  Text("Hello")
                    .padding()
                    .background(
                      .ultraThickMaterial,
                      in: RoundedRectangle(cornerRadius: 8, style: .continuous)
                    )
                  Text("Ultrathick Material")
                    .font(.subheadline)
                }
              }
            }
            .environment(\.colorScheme, .dark)
            Divider().padding(.vertical, 200)
          }
        }.padding()
      }
    }
}

#Preview {
    MaterialsView()
}

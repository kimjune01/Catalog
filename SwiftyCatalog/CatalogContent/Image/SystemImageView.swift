//
//  SystemImageView.swift
//  SwiftyCatalog
//
//  Created by June Kim on 2024-10-09.
//

import SwiftUI

struct SystemImageView: View {
  @State private var bounceValue = false
  @State private var pulseValue = false
  @State private var rotateValue = false
  @State private var wiggleValue = false
  @State private var breatheValue = false
  @State private var variableValue: CGFloat = 0
  @State private var searchText = ""
  @State private var isFavorite = false
  @State private var animationsRunning = false
  @State private var symbolEffect: any SymbolEffect = .pulse
  
  var body: some View {
    ScrollView{
      VStack(spacing: 20) {
        Text("Symbols can have variants").font(.headline)
        HStack {
          VStack {
            Image(systemName: "person")
            Text("Default").font(.caption)
          }
          VStack {
            Image(systemName: "person")
              .symbolVariant(.fill)
            Text("Fill").font(.caption)
          }
          VStack {
            Image(systemName: "person")
              .symbolVariant(.circle)
            Text("Circle").font(.caption)
          }
          VStack {
            Image(systemName: "person")
              .symbolVariant(.circle.fill)
            Text("Circle + Fill").font(.caption)
          }
          VStack {
            Image(systemName: "person")
              .symbolVariant(.slash)
            Text("Slash").font(.caption)
          }
        }
        .imageScale(.large)
        .foregroundStyle(.blue)
        .font(.largeTitle)
        Divider()
        
        
        Text("Symbols can have font weight").font(.headline)
        HStack {
          VStack {
            Image(systemName: "bolt")
              .foregroundStyle(.blue)
              .fontWeight(.thin)
            Text("Thin").font(.caption)
          }
          VStack {
            Image(systemName: "bolt")
            Text("Default").font(.caption)
          }
          VStack {
            Image(systemName: "bolt")
              .fontWeight(.bold)
            Text("Bold").font(.caption)
          }
          VStack {
            Image(systemName: "bolt")
              .fontWeight(.black)
            Text("Black").font(.caption)
          }
        }
        .foregroundStyle(.blue)
        .imageScale(.large)
        .font(.largeTitle)
        Divider()
        
        Text("Symbols can be colorful").font(.headline)
        HStack {
          VStack {
            Image(systemName: "theatermasks")
              .symbolRenderingMode(.hierarchical)
              .foregroundStyle(.blue)
            Text("Heierarchical").font(.caption)
          }
          VStack {
            Image(systemName: "person.3.sequence.fill")
              .symbolRenderingMode(.palette)
              .foregroundStyle(.blue, .green, .red)
            Text("Palette").font(.caption)
          }
          VStack {
            Image(systemName: "rainbow")
              .symbolRenderingMode(.multicolor)
              .foregroundStyle(.blue)
            Text("Multicolor").font(.caption)
          }
        }
        .imageScale(.large)
        .font(.largeTitle)
        Divider()
        
        Text("Animations for every symbol").font(.headline)
        HStack(spacing: 15) {
          VStack {
            Button {
              withAnimation {
                bounceValue.toggle()
              }
            } label: {
              Image(systemName: "figure")
                .symbolEffect(.bounce.up, value: bounceValue)
            }
            Text("Bounce").font(.caption)
          }
          VStack {
            Button {
              withAnimation {
                pulseValue.toggle()
              }
            } label: {
              Image(systemName: "figure")
                .symbolEffect(.pulse, value: pulseValue)
            }
            Text("Pulse").font(.caption)
          }
          VStack {
            Button {
              withAnimation {
                rotateValue.toggle()
              }
            } label: {
              
              Image(systemName: "figure")
                .symbolEffect(.rotate, value: rotateValue)
            }
            Text("Rotate").font(.caption)
          }
          VStack {
            Button {
              withAnimation {
                wiggleValue.toggle()
              }
            } label: {
              Image(systemName: "figure")
                .symbolEffect(.wiggle, value: wiggleValue)
            }
            Text("Wiggle").font(.caption)
          }
          VStack {
            
            Button {
              withAnimation {
                breatheValue.toggle()
              }
            } label: {
              Image(systemName: "figure")
                .symbolEffect(.breathe, value: breatheValue)
            }
            Text("Breathe").font(.caption)
          }
        }
        .font(.largeTitle)
        .foregroundStyle(.blue)
        .imageScale(.large)
        
        
        Divider()
        
        Text("Unique animations for some symbols").font(.headline)
        HStack {
          Image(systemName: "square.stack.3d.up")
            .foregroundStyle(.blue)
            .imageScale(.large)
            .symbolEffect(.variableColor.cumulative, options: .repeating, value: animationsRunning)
          Button("Animate Stack") {
            withAnimation {
              animationsRunning.toggle()
            }
          }
        }.font(.largeTitle)
        Divider()
        
        Text("Indicate discrete states").font(.headline)
        VStack {
          Button {
            withAnimation {
              isFavorite.toggle()
            }
          } label: {
            Label("Tap to Favorite", systemImage: isFavorite ? "heart.fill": "heart")
          }
          .contentTransition(.symbolEffect(.replace))
        }
        .font(.largeTitle)
        Divider()
        
        Text("Indicate continuous states").font(.headline)
        HStack {
          Image(systemName: "cellularbars", variableValue: variableValue)
            .padding()
          Image(systemName: "car.rear.road.lane.distance.5", variableValue: variableValue)
            .padding()
          Image(systemName: "speaker.wave.3", variableValue: variableValue)
            .padding()
        }
        .font(.system(.largeTitle))
        .foregroundStyle(.blue)
        .imageScale(.large)
        HStack {
          Text("Variable: ").font(.caption)
          Slider(value:$variableValue).padding(.horizontal, 10)
        }
        Divider()
        
        Text("Explore more Symbols").font(.headline)
        
        Image("sf-symbols")
        Link("Get the SF Symbols app", destination: URL(string:"https://developer.apple.com/sf-symbols/")!)
        Text("Choose from over 6000 symbols, complete with colors and animations.").font(.footnote)
        
      }
    }.padding()
  }
}

#Preview {
  SystemImageView()
}

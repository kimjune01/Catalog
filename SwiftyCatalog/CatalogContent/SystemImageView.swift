//
//  SystemImageView.swift
//  SwiftyCatalog
//
//  Created by June Kim on 2024-10-09.
//

import SwiftUI

struct SystemImageView: View {
  @State private var variableValue: CGFloat = 0
  @State private var symbolVariant: String = "chart.bar.fill"
  @State private var searchText = ""
  var body: some View {
      ScrollView{
        VStack(spacing: 20) {
          Text(symbolVariant).font(.title2)
          HStack{
            Image(systemName: symbolVariant.lowercased(), variableValue: variableValue)
              .foregroundStyle(.blue)
          }
          .font(.system(.largeTitle))
          .scaleEffect(1.5)
          .padding(50)
          SearchBar(text: $searchText, actionButton: Button(action: {
            symbolVariant = searchText
            searchText = ""
          }) {
            Text("Replace")
          })
          HStack {
            Text("Variable value: ")
            Slider(value:$variableValue).padding(.horizontal, 10)
          }
          Divider()
          
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

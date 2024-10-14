//
//  GridView.swift
//  SwiftyCatalog
//
//  Created by June Kim on 2024-10-11.
//

import SwiftUI

struct GridView: View {
  let green = Color(red: 228/255, green: 254/255, blue: 233/255)
  let blue = Color(red: 199/255, green: 225/255, blue: 253/255)
  let pink = Color(red: 250/255, green: 228/255, blue: 253/255)
  
  @State private var selectedAlignmentIdx = 0
  let allAlignments: [Alignment] = [.topLeading, .top, .topTrailing, .leading, .center, .trailing, .bottomLeading, .bottom, .bottomTrailing]

  @State private var showDiffCell = false
  @State private var isCellMerged = false

  func textDescribing(alignment: Alignment) -> some View {
    switch alignment {
    case .topLeading: return Text("Top Leading")
    case .top: return Text("Top")
    case .topTrailing: return Text("Top Trailing")
    case .leading: return Text("Leading")
    case .center: return Text("Center")
    case .trailing: return Text("Trailing")
    case .bottomLeading: return Text("Bottom Leading")
    case .bottom: return Text("Bottom")
    case .bottomTrailing: return Text("Bottom Trailing")
    default: return Text("Unknown Alignment")
    }
  }
  
  @ViewBuilder
  func makeRect(_ color: Color = .red) -> some View {
    let widthRandom = abs(CGFloat(color.description.hashValue) * 13).truncatingRemainder(dividingBy: 35)
    let heightRandom = abs(CGFloat(color.description.hashValue) * 9).truncatingRemainder(dividingBy: 35)
    RoundedRectangle(cornerRadius: 8)
      .frame(width: 35 + widthRandom,
             height: 35 + heightRandom)
      .foregroundStyle(color)
  }
  
  @ViewBuilder
  func makeWideRect(_ color: Color = .red) -> some View {
    let widthRandom = abs(CGFloat(color.description.hashValue) * 13).truncatingRemainder(dividingBy: 35)
    let heightRandom = abs(CGFloat(color.description.hashValue) * 9).truncatingRemainder(dividingBy: 35)
    RoundedRectangle(cornerRadius: 8)
      .frame(width: 135 + widthRandom,
             height: 35 + heightRandom)
      .foregroundStyle(color)
  }
  
  var body: some View {
    ScrollView {
      VStack(spacing: 20) {
        Text("Grid").font(.headline)
        Text("Unlike stacks, grids keep both rows and columns aligned.").font(.subheadline)
        Grid(alignment: allAlignments[selectedAlignmentIdx]) {
          GridRow {
            makeRect(.blue)
            makeRect(.green)
            if showDiffCell { makeRect(.cyan) }
            makeRect(.yellow)
          }
          .padding(5)
          GridRow {
            makeRect(.purple)
            makeRect(.brown)
          }
          .padding(5)
          GridRow {
            makeRect(.orange)
            makeRect(.pink)
            makeRect(.mint)
          }
          .padding(5)
        }
        .animation(.easeInOut, value: showDiffCell)
        .block()
        
        Picker("Alignment", selection: $selectedAlignmentIdx) {
          ForEach(0..<allAlignments.count, id: \.self) { alignmentIdx in
            textDescribing(alignment: allAlignments[alignmentIdx]).tag(alignmentIdx)
          }
        }
        .pickerStyle(.wheel)
        .frame(height: 100)
        Toggle("Toggle cell", isOn: $showDiffCell)
          .toggleStyle(.button)
        Divider()
        
        Text("Cell size").font(.headline)
        Grid(alignment: allAlignments[selectedAlignmentIdx]) {
          GridRow {
            makeRect(.blue)
            makeRect(.green)
            makeRect(.yellow)
          }
          .padding(5)
          GridRow {
            makeWideRect(.purple)
              .gridCellColumns(isCellMerged ? 2 : 1)
            makeRect(.brown)
          }
          .padding(5)
          GridRow {
            makeRect(.orange)
            makeRect(.pink)
            makeRect(.mint)
          }
          .padding(5)
        }
        .animation(.easeInOut, value: isCellMerged)
        .block()
        Text("All grid cells are equal in size, but a cell can be specified to take up more horizontal space (but not vertically).")
          .font(.subheadline)
        
        Toggle("Expand the purple cell", isOn: $isCellMerged)
          .toggleStyle(.button)
        
      }
    }.padding()
  }
}

#Preview {
  GridView()
}

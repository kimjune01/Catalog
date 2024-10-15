//
//  ModalView.swift
//  SwiftyCatalog
//
//  Created by June Kim on 2024-10-13.
//

import SwiftUI

struct ModalView: View {
  var isBeingPresented: Bool
  @State private var isOnePresented = false
  @State private var isTwoPresented = false
  @Environment(\.dismiss) var dismiss
  let seed = CGFloat.random(in: 0...1)
  
  var body: some View {
    ZStack {
      VStack(spacing: 20) {
        if isBeingPresented {
          Button {dismiss()} label: {
            Label {
              Text("Dismiss")
            } icon: {
              Image(systemName: "xmark.rectangle.portrait").imageScale(.large)
            }
          }
          .sheet(isPresented: $isOnePresented, content:{
            ModalView.init(isBeingPresented: true)})
          .padding()
          Divider()
        }

        ZStack {
          RoundedRectangle(cornerRadius: 10)
            .frame(minWidth: 100, maxWidth: .infinity, minHeight: 100, maxHeight: 200)
            .foregroundStyle(Color.randomLight(seed: seed))
            .padding()
          Image(systemName:
                  CatalogItem.allCases[
                    Int(Double(CatalogItem.allCases.count) * seed)]
            .imageName()).scaleEffect(5)
            .foregroundStyle(.white)
        }

        Button {isOnePresented.toggle()} label: {
          Label {
            Text("Sheet modal")
          } icon: {
            Image(systemName: "arrow.up.page.on.clipboard").imageScale(.large)
          }
        }
        .sheet(isPresented: $isOnePresented, content: {
          ModalView.init(isBeingPresented: true)})
        .padding()
        Divider()
        
        Button {isTwoPresented.toggle()} label: {
          Label {
            Text("Show Full screen cover modal")
          } icon: {
            Image(systemName: "arrow.up.page.on.clipboard").imageScale(.large)
          }
        }
        .fullScreenCover(isPresented: $isTwoPresented, content: {
          ModalView(isBeingPresented: true)
        })
        .padding()
      }
    }
    .edgesIgnoringSafeArea(.all)
  }
}

#Preview {
  ModalView(isBeingPresented: false)
}

//
//  TextInputView.swift
//  SwiftyCatalog
//
//  Created by June Kim on 2024-10-09.
//

import SwiftUI

struct TextInputView: View {
  @State var name: String = ""
  @FocusState private var nameFieldIsFocused: Bool
  @State var showGreetingAlert = false
  
  var body: some View {
    ScrollView {
      VStack(spacing: 20) {
        Text("TextField").font(.headline)
        TextField("Enter your name", text: $name)
          .focused($nameFieldIsFocused)
          .onSubmit {
            showGreetingAlert.toggle()
          }
          .alert("Hello, \(name)!", isPresented: $showGreetingAlert) {
            Button("OK") {
              name = ""
            }
          }
          .block()
        Text("Default styling & boilerplate code").font(.subheadline)
        Swifty(code:
        """
        @State var name: String = ""
        @FocusState private var nameFieldIsFocused: Bool
        @State var showGreetingAlert = false
        ...
        TextField("Enter your name", text: $name)
          .focused($nameFieldIsFocused)
          .onSubmit {
            showGreetingAlert.toggle()
          }
          .alert("Hello, \\(name)!", isPresented: $showGreetingAlert) {
            Button("OK") { }
          }
        """
        )
        Divider()
        
        
      }
    }.padding()
  }
}

#Preview {
  TextInputView()
}

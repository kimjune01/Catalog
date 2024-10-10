//
//  TextInputView.swift
//  SwiftyCatalog
//
//  Created by June Kim on 2024-10-09.
//

import SwiftUI

struct TextFieldView: View {
  @State var name: String = ""
  @State var showGreetingAlert = false

  @State var textFieldStatus = "Not editing"
  @State var username: String = ""
  
  @State var date: Date = Date()
  @State var currency: Float = 0
  @State var password: String = ""
  @State var highlightedText: String = ""

  static var df: DateFormatter {
    let df = DateFormatter()
    df.dateStyle = .short
    return df
  }
  
  var body: some View {
    ScrollView {
      VStack(spacing: 20) {
        Text("TextField").font(.headline)
        TextField("Enter your name", text: $name)
          .onSubmit {
            showGreetingAlert.toggle()
          }
          .alert("Hello, \(name)!", isPresented: $showGreetingAlert) {
            Button("OK") {
              name = ""
            }
          }
          .block()
        Swifty(code:
        """
        @State var name: String = ""
        @State var showGreetingAlert = false
        ...
        TextField("Enter your name", text: $name)
          .onSubmit {
            showGreetingAlert.toggle()
          }
          .alert("Hello, \\(name)!", isPresented: $showGreetingAlert) {
            Button("OK") { }
          }
        """
        )
        Divider()
        
        Text("Styling").font(.headline)
        VStack {
          TextField("Enter your name", text: $name)
            .textFieldStyle(.roundedBorder)
          TextField("Enter your number", text: $name)
            .textFieldStyle(.roundedBorder)
        }
        .block()
        Text("Rounded border").font(.subheadline)
        VStack {
          TextField("Enter your name", text: $name)
            .textFieldStyle(.plain)
          TextField("Enter your number", text: $name)
            .textFieldStyle(.plain)
        }
        .block()
        Text("Plain").font(.subheadline)
        Divider()
        
        
        Text("States & Callbacks").font(.headline)
        TextField(
          "Username",
          text: $username,
          onEditingChanged: { (isBegin) in
            if isBegin {
              textFieldStatus = "Began editing"
            } else {
              textFieldStatus = "Finished editing"
            }
          },
          onCommit: {
            textFieldStatus = "Commits editing"
          }
        )
        .block()
        Text(textFieldStatus).font(.subheadline)
        Divider()
        
        Text("Date formatting").font(.headline)
        TextField(
          "Date",
          value: $date,
          formatter: TextFieldView.df,
          onEditingChanged: { _ in
            
          }, onCommit: {
            
          })
        .block()
        Text(date, format: Date.FormatStyle(date: .abbreviated, time:.none)).font(.subheadline)
        Divider()
        
        Text("Currency formatting").font(.headline)
        TextField(
          "Price",
          value: $currency,
          format: .number.precision(.fractionLength(2)))
        .block()
        Text(currency, format: .currency(code: "USD")).font(.subheadline)
        Divider()

        Text("Secure field").font(.headline)
        SecureField(
          "Super Secret Password",
          text: $password)
        .autocapitalization(.none)
        .block()
        Text(password).font(.subheadline)
        Divider()

        Text("Border highlighting").font(.headline)
        SecureField(
          "Try again",
          text: $highlightedText)
        .autocapitalization(.none)
        .padding()
        .overlay(
          RoundedRectangle(cornerRadius: 12)
            .stroke(.red.opacity(0.5), lineWidth: 3)
        )
        .block()
        Divider()

      }
    }.padding()
  }
}

#Preview {
  TextFieldView()
}

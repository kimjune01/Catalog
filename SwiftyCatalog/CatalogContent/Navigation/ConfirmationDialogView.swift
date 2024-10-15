//
//  ConfirmationDialogView.swift
//  SwiftyCatalog
//
//  Created by June Kim on 2024-10-13.
//

import SwiftUI

struct ConfirmationDialogView: View {
  @State private var showingConfirmation = false
  @State private var backgroundColor = Color.white
  @State private var visibilityIdx = 0
  var body: some View {
    ScrollView {
      VStack(spacing: 20) {
        Text("Action Sheet").font(.headline)
        Picker("Visibility picker", selection: $visibilityIdx) {
          Text("Title Hidden").tag(0)
          Text("Title Visible").tag(1)
        }.pickerStyle(.segmented)
        
        Button("Cancel Subscription") {
          showingConfirmation = true
        }
        .frame(width: 300, height: 200)
        .background(backgroundColor)
        .confirmationDialog("Are you sure?", isPresented: $showingConfirmation, titleVisibility: visibilityIdx == 0 ? .hidden : .visible) {
          Button("Get a 10% discount") {  }
          Button("Remind me later") {  }
          Button("Unsubscribe", role: .destructive) {  }
          Button("Cancel", role: .cancel) { }
        } message: {
          Text("You will stop getting all the benefits of subscribing.")
        }
      }
    }
  }
}

#Preview {
  ConfirmationDialogView()
}

//
//  TextVoiceoverView.swift
//  SwiftyCatalog
//
//  Created by June Kim on 2024-10-08.
//

import SwiftUI

struct TextVoiceoverView: View {
  var body: some View {
    ScrollView{
      VStack(spacing: 20) {
        Text("Welcome to our app!")
          .font(.title)
          .accessibilityLabel("Welcome message")
          .accessibilityHint("Displays a welcome message to the user.")
          .padding()
        
        Button(action: {
          // Action
        }) {
          Text("Continue")
            .font(.headline)
        }
        .accessibilityLabel("Continue butt")
        .accessibilityHint("Tap to proceed to the next screen.")
        .padding()
      }
    }.padding()
  }
}

#Preview {
  TextVoiceoverView()
}

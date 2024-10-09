import SwiftUI

struct SearchBar<ActionButton: View>: View {
  @Binding var text: String
  @State private var isEditing = false
  let actionButton: ActionButton?
  var body: some View {
    HStack {
      
      TextField("Search...", text: $text)
        .autocapitalization(.none)
        .textCase(.lowercase)
        .padding(7)
        .padding(.horizontal, 25)
        .background(Color(.systemGray6))
        .cornerRadius(8)
        .padding(.horizontal, 10)
        .onTapGesture {
          self.isEditing = true
        }
      
      if !text.isEmpty && actionButton != nil {
        actionButton
        .padding(.trailing, 10)
        .transition(.move(edge: .trailing))
      }
    }
  }
}

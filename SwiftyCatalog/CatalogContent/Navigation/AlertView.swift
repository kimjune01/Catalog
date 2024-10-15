//
//  AlertView.swift
//  SwiftyCatalog
//
//  Created by June Kim on 2024-10-13.
//

import SwiftUI

struct AlertView: View {
  @State private var isOneAlert: Bool = false
  @State private var isTwoAlert: Bool = false
  @State private var isThreeAlert: Bool = false
  
    var body: some View {
      ScrollView {
        VStack (spacing: 20) {
          Button { isOneAlert.toggle() } label: {
            Label {
              Text("Alert with long message")
            } icon: {
              Image(systemName: "exclamationmark.square").imageScale(.large)
            }
          }.alert(isPresented: $isOneAlert, content: {
            Alert(title: Text("Cheese"),
                  message: Text("Say cheese fondue cheese and wine. Cottage cheese port-salut edam everyone loves port-salut paneer cheese strings babybel. Stilton ricotta lancashire red leicester bocconcini boursin everyone loves parmesan. Mozzarella pecorino emmental fromage brie cheesecake dolcelatte blue castello. Cottage cheese croque monsieur."),
                  dismissButton: .default(Text("Dismiss")))
          })
          .padding()
          Divider()
          
          Button { isTwoAlert.toggle() } label: {
            Label {
              Text("Delete Something")
            } icon: {
              Image(systemName: "trash").imageScale(.large)
            }
          }.alert(isPresented: $isTwoAlert, content: {
            Alert(title: Text("Title"),
                  primaryButton: .destructive(Text("Destructive")),
                  secondaryButton: .cancel(Text("Cancel")))
          })
          .padding()
          Divider()
          
          Text("The text in alerts cannot be customized.").font(.subheadline)
        }
      }.padding()
    }
}

#Preview {
    AlertView()
}

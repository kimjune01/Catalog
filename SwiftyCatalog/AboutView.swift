//
//  AboutView.swift
//  SwiftyCatalog
//
//  Created by June Kim on 2024-10-14.
//

import SwiftUI

struct AboutView: View {
    var body: some View {
      ScrollView {
        VStack(alignment: .leading, spacing: 20) {
          Text("Catalog").font(.title)
          Text("This app facilitates efficient communication between designers and engineers in a PDE team. By using the same language to refer to each part of the user experience, designers can specify their vision precisely.")
          Text("It's open source on GitHub, so you can copy paste the code, contribute and make it even better.")
          Text("If you enjoyed this app, or have suggestions, please send me an email to june@june.kim!")
          Spacer()
          
          Text("Thanks to wonderful code examples that inspired this app, such as sarunw.com, and hackingwithswift.com!")
          
        }
      }.padding()
    }
}

#Preview {
    AboutView()
}

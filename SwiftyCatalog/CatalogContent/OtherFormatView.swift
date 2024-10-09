//
//  TextFormatView.swift
//  SwiftyCatalog
//
//  Created by June Kim on 2024-10-08.
//

import SwiftUI

struct OtherFormatView: View {
  @State var count: Int = 0

  var body: some View {
    ScrollView{
      VStack(alignment: .leading, spacing: 20) {
        Text("Currency: ")
        Text(72.3, format: .currency(code: "USD"))
          .block()
        Swifty(code:"Text(72.3, format: .currency(code: \"USD\")")
        Divider()

        Text("Percentage: ")
        Text(12.6 / 66, format: .percent.precision(.fractionLength(2)))
          .block()
        Swifty(code:"Text(12.6 / 66, format: .percent.precision(.fractionLength(2)))")
        Divider()
        
        Text("Measurement: ")
        let length = Measurement(value: 5.0, unit: UnitLength.feet)
        HStack (spacing: 20) {
          Text(length, format: .measurement(width: .wide))
          Text(length, format: .measurement(width: .narrow))
        }
        .block()
        Swifty(code:
        """
        let length = Measurement(value: 5.0, unit: UnitLength.feet)
        Text(length, format: .measurement(width: .wide))
        Text(length, format: .measurement(width: .narrow))
        """)
        Divider()
        
        Text("List of things: ")
        let items: [Int] = [1, 2, 3, 4]
        Text(items, format: .list(memberStyle: .number, type: .and))
          .block()
        Swifty(code:
        """
        let items: [Int] = [1, 2, 3, 4]
        Text(items, format: .list(memberStyle: .number, type: .and))
        """)
        Divider()
        
        Text("People's names: ")
        let name = PersonNameComponents(namePrefix: "Dr.",
                                        givenName: "Thomas",
                                        middleName: "Louis",
                                        familyName: "Clark",
                                        nameSuffix: "Jr.",
                                        nickname: "Tom")
        HStack (spacing: 20) {
          Text(name, format: .name(style: .short))
          Text(name, format: .name(style: .medium))
          Text(name, format: .name(style: .long))
        }
          .block()
        Swifty(code:
        """
        let name = PersonNameComponents(namePrefix: "Dr.",
                                        givenName: "Thomas",
                                        middleName: "Louis",
                                        familyName: "Clark",
                                        nameSuffix: "Jr.",
                                        nickname: "Tom")
        Text(name, format: .name(style: .short))
        Text(name, format: .name(style: .medium))
        Text(name, format: .name(style: .long))
        """)
        Divider()
        
        
        Text("Counting things: ")
        Text("You tapped on me ^[\(count) time](inflect: true)")
          .onTapGesture {
            count += 1
          }
          .block()
        Swifty(code:"Text(\"You tapped on me ^[\\(count) time](inflect: true)\")")
        Divider()
        

        
        
        
      }
    }.padding()
  }
}

#Preview {
  OtherFormatView()
}

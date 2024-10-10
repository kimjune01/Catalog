
import SwiftUI

struct NumberFormatView: View {
  var body: some View {
    ScrollView{
      VStack(alignment: .leading, spacing: 20) {
        
        Text(12.3456, format: .number)
          .block()
        Swifty(code: "Text(12.3456, format: .number)")
        Divider()

        HStack(spacing: 20) {
          Text(12.3456, format: .number)
          Text("->")
          Text(12.3456, format: .number.rounded(rule: .down, increment: 1.0))
        }
        .block()
        Swifty(code: ".number.rounded(rule: .down, increment: 1.0)")
        Divider()
        
        HStack(spacing: 20) {
          Text(12.3456, format: .number)
          Text("->")
          Text(12.3456, format: .number.rounded(increment: 0.1))
        }
        .block()
        Swifty(code: ".number.rounded(increment: 0.1)")
        Divider()
        
        HStack(spacing: 20) {
          Text(12.3456, format: .number)
          Text("->")
          Text(12.3456, format: .number.precision(.fractionLength(2)))
        }
        .block()
        Swifty(code: ".number.precision(.fractionLength(2))")
        Divider()
        
        HStack(spacing: 20) {
          Text("123456.789")
          Text("->")
          Text(123456.789, format: .number.notation(.compactName))
        }
        .block()
        Swifty(code: ".number.notation(.compactName)")
        Divider()
        
        HStack(spacing: 20) {
          Text("123456.789")
          Text("->")
          Text(123456.789, format: .number.notation(.scientific).precision(.significantDigits(3)))
        }
        .block()
        Swifty(code: ".number.notation(.scientific).precision(.significantDigits(3)))")
        Divider()
        
      }
    }.padding()
    
  }
}

#Preview {
  NumberFormatView()
}

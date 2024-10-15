import SwiftUI

extension Color {
  static func random() -> Color {
    let hue: CGFloat = .random(in: 0...1)
    let saturation: CGFloat = .random(in: 0...1)
    let brightness: CGFloat = .random(in: 0...1)
    
    return Color(
      hue: hue,
      saturation: saturation,
      brightness: brightness,
      opacity: 1)
  }
  
  static func randomLight(seed: CGFloat? = nil) -> Color {
    return Color(
      hue: seed ?? CGFloat.random(in: 0...1),
      saturation: 0.65,
      brightness:  0.85,
      opacity: 1)
  }
}

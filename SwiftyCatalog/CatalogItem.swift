//
//  CatalogItem.swift
//  SwiftyCatalog
//
//  Created by June Kim on 2024-10-08.
//

import SwiftUI

enum CatalogItem: String, Identifiable, Hashable {
  var id: Self {
    return self
  }
  case text
  case image
  case label
  case textInput
  case button
  case shape
  case toggle
  case link
  case progressView
  case picker
  case slider
  case stepper
  case localization
  case verbatim
  case date
  case timer
  case font
  case styling
  case textLayout
  case voiceover
  
  func title() -> String {
    return self.rawValue.titleCase()
  }
  func imageName() -> String {
    switch self {
    case .text: return "textformat"
    case .image: return "photo"
    case .label: return "text.below.photo"
    case .textInput: return "character.textbox"
    case .localization: return "globe"
    case .button: return "rectangle.and.hand.point.up.left"
    case .shape: return "squareshape.fill"
    case .toggle: return "switch.2"
    case .link: return "link"
    case .progressView: return "menubar.dock.rectangle"
    case .picker: return "arrow.up.and.down.text.horizontal"
    case .slider: return "slider.horizontal.3"
    case .stepper: return "plusminus"
    case .verbatim: return "square.and.pencil"
    case .date: return "calendar"
    case .timer: return "clock"
    case .font: return "abc"
    case .styling: return "paintbrush.pointed"
    case .textLayout: return "character.textbox"
    case .voiceover: return "speaker"
    
    }
  }
}

extension String {
  func camelCaseToWords() -> String {
    return unicodeScalars.dropFirst().reduce(String(prefix(1))) {
      return CharacterSet.uppercaseLetters.contains($1)
        ? $0 + " " + String($1)
        : $0 + String($1)
    }
  }
  func titleCase() -> String {
    return self
      .replacingOccurrences(of: "([A-Z])",
                            with: " $1",
                            options: .regularExpression,
                            range: range(of: self))
      .trimmingCharacters(in: .whitespacesAndNewlines)
      .capitalized // If input is in llamaCase
  }
}


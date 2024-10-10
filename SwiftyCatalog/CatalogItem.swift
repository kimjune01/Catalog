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
  case date
  case timer
  case systemFont
  case fonts
  case styling
  case voiceover
  case numberFormat
  case otherFormat
  case textPosition
  case systemImage
  case createImage
  case resizeImage
  case imageResizingMode
  case imageEffects
  case viewTransform
  
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
    case .date: return "calendar"
    case .timer: return "clock"
    case .systemFont: return "textformat"
    case .fonts: return "textformat.alt"
    case .styling: return "paintbrush.pointed"
    case .voiceover: return "speaker"
    case .numberFormat: return "textformat.123"
    case .otherFormat: return "textformat"
    case .textPosition: return "text.word.spacing"
    case .createImage: return "photo.circle"
    case .systemImage: return "desktopcomputer"
    case .resizeImage: return "viewfinder"
    case .viewTransform: return "rotate.left.fill"
    case .imageResizingMode: return "rectangle.split.3x3.fill"
    case .imageEffects: return "paintpalette"
    }
  }
}

extension String {
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


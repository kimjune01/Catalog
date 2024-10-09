//
//  CatalogLists.swift
//  SwiftyCatalog
//
//  Created by June Kim on 2024-10-08.
//
import SwiftUI

typealias CatalogList = Dictionary<String, [CatalogItem]>

func getCatalogList(for catalogItem: CatalogItem) -> CatalogList? {
  switch catalogItem {
  case .text: return textCatalog
  case .image: return imageCatalog
  default: return nil
  }
}

@ViewBuilder
func getCatalogContent(for item: CatalogItem) -> some View {
  switch item {
  case .localization: TextLocalizationView()
  case .date: TextDateView()
  case .numberFormat: NumberFormatView()
  case .otherFormat: OtherFormatView()
  case .systemFont: SystemFontView()
  case .fonts: FontsView()
  case .textPosition: TextPositionView()
  case .voiceover: TextVoiceoverView()
  case .createImage: CreateImageView()
  case .resizeImage: ResizeImageView()
  default: EmptyView()
  }
}

let masterCatalog: CatalogList = [
  "View Elements" :  [ .text, .image, .label, .textInput, .button, .shape, .toggle, .link, .progressView, .picker, .slider, .stepper ]
]
let textCatalog: CatalogList = [
  "Initializing Text" :  [ .localization, .date, .numberFormat, .otherFormat],
  "Appearance" : [.systemFont, .fonts, .textPosition],
]
let imageCatalog: CatalogList = [
  "New Image": [.createImage, .systemImage],
  "Configure": [.resizeImage, .imageOrientation, .imageResizingMode],
]

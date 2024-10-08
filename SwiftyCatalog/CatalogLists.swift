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
  default: return nil
  }
}

@ViewBuilder
func getCatalogContent(for title: String) -> some View {
  switch title {
  case "Localization": LocalizationView()
  default: Text(title)
  }
}

let masterCatalog: CatalogList = [
  "View Elements" :  [ .text, .image, .label, .textInput, .button, .shape, .toggle, .link, .progressView, .picker, .slider, .stepper ]
]
let textCatalog: CatalogList = [
  "Initializing Text" :  [ .localization
   ],
]

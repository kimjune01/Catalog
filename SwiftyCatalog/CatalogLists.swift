
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
  case .systemImage: SystemImageView()
  case .imageEffects: ImageEffectsView()
  case .label: LabelView()
  case .link: LinkView()
  case .textInput: TextInputView()
  default: EmptyView()
  }
}

let masterCatalog: CatalogList = [
  "Display" :  [.text, .image, .label, .shape, .progressView],
  "Controls" :  [.textInput, .button, .link, .toggle, .picker, .slider, .stepper ]
]
let textCatalog: CatalogList = [
  "Initializing Text" :  [.localization, .date, .numberFormat, .otherFormat],
  "Appearance" : [.systemFont, .fonts, .textPosition],
]
let imageCatalog: CatalogList = [
  "New Image": [.createImage, .systemImage],
  "Configure": [.resizeImage, .imageEffects],
]
let shapeCatalog: CatalogList = [
  "Shape": []
  ]


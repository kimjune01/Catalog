//
//  CatalogItem.swift
//  SwiftyCatalog
//
//  Created by June Kim on 2024-10-08.
//

import SwiftUI

enum CatalogItem: String, Identifiable, Hashable, CaseIterable {
  
  var id: Self {
    return self
  }
  case text
  case image
  case label
  case textField
  case button
  case shapeAndColor
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
  case createShape
  case shapeEffects
  case gradient
  case datePicker
  case materials
  case map
  case layout
  case stacks
  case scrollView
  case list
  case grid
  case tabs
  case navigationView
  case gestures
  case popups
  case alert
  case modal
  case confirmationDialog
  case animation
  case timings
  case transition
  case characterAnimation
  
  func title() -> String {
    return self.rawValue.titleCase()
  }
  func imageName() -> String {
    switch self {
    case .text: return "textformat"
    case .image: return "photo"
    case .label: return "text.below.photo"
    case .textField: return "character.textbox"
    case .localization: return "globe"
    case .button: return "rectangle.and.hand.point.up.left"
    case .shapeAndColor: return "squareshape.fill"
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
    case .createImage: return "photo"
    case .systemImage: return "desktopcomputer"
    case .resizeImage: return "viewfinder"
    case .viewTransform: return "rotate.left.fill"
    case .imageResizingMode: return "rectangle.split.3x3.fill"
    case .imageEffects: return "paintpalette"
    case .createShape: return "pencil.and.outline"
    case .shapeEffects: return "paintpalette"
    case .gradient: return "lightspectrum.horizontal"
    case .datePicker: return "calendar.badge.checkmark"
    case .materials: return "light.panel"
    case .map: return "map"
    case .layout: return "compass.drawing"
    case .stacks: return "rectangle.stack"
    case .scrollView: return "scroll"
    case .list: return "list.bullet"
    case .grid: return "square.grid.2x2"
    case .navigationView: return "rectangle.portrait.and.arrow.right.fill"
    case .tabs: return "inset.filled.bottomthird.rectangle"
    case .gestures: return "hand.draw"
    case .popups: return "party.popper"
    case .alert: return "exclamationmark.bubble"
    case .modal: return "rectangle.portrait.on.rectangle.portrait"
    case .confirmationDialog: return "inset.filled.bottomhalf.rectangle.portrait"
    case .animation: return "hands.and.sparkles.fill"
    case .timings: return "stopwatch.fill"
    case .transition: return "drop.transmission"
    case .characterAnimation: return "character.magnify"
    }
  }
}

typealias CatalogList = Dictionary<String, [CatalogItem]>

func getCatalogList(for catalogItem: CatalogItem) -> CatalogList? {
  switch catalogItem {
  case .text: return textCatalog
  case .image: return imageCatalog
  case .shapeAndColor: return shapeCatalog
  case .layout: return layoutCatalog
  case .popups: return popupCatalog
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
  case .textField: TextFieldView()
  case .button: ButtonView()
  case .toggle: ToggleView()
  case .picker: PickerView()
  case .slider: SliderView()
  case .stepper: StepperView()
  case .progressView: ProgressViewView()
  case .createShape: CreateShapeView()
  case .shapeEffects: ShapeEffectsView()
  case .gradient: GradientView()
  case .viewTransform: ViewTransformView()
  case .datePicker: DatePickerView()
  case .materials: MaterialsView()
  case .map: MapView()
  case .stacks: StacksView()
  case .scrollView: ScrollViewView()
  case .list: ListView()
  case .navigationView: NavigationViewView()
  case .grid: GridView()
  case .tabs: TabViewView()
  case .gestures: GesturesView()
  case .modal: ModalView(isBeingPresented: false)
  case .alert: AlertView()
  case .confirmationDialog: ConfirmationDialogView()
  case .timings: TimingsView()
  case .characterAnimation: CharacterAnimationView()
  default: EmptyView()
  }
}

let masterCatalog: CatalogList = [
  "Display" :  [.text, .image, .label, .shapeAndColor, .animation, .layout],
  "Controls" :  [.textField, .button, .link, .toggle, .picker, .datePicker, .slider, .stepper, .progressView ],
  "Navigation": [.navigationView, .tabs, .popups]
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
  "Shape": [.createShape, .shapeEffects, .viewTransform],
  "Color": [.gradient, .materials]
]
let layoutCatalog: CatalogList = [
  "Composition": [.stacks, .scrollView],
  "Collection": [.list, .grid]
]
let popupCatalog: CatalogList = [
  "Popups": [.alert, .modal, .confirmationDialog],
]
let animationCatalog: CatalogList = [
  "Animation": [.timings, .transition],
]

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

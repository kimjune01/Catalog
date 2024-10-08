//
//  MasterCatalog.swift
//  SwiftyCatalog
//
//  Created by June Kim on 2024-10-08.
//

import SwiftUI

struct MasterCatalog: View {
  @State private var selectedElement: CatalogItem? = nil
  let viewElements: [CatalogItem] = [
    .init(title: "Text", systemImage: "textformat"),
    .init(title: "Image", systemImage: "photo"),
    .init(title: "Label", systemImage: "text.below.photo"),
    .init(title: "Text Input", systemImage: "character.textbox"),
    .init(title: "Button", systemImage: "rectangle.and.hand.point.up.left"),
    .init(title: "Shape", systemImage: "squareshape.fill"),
    .init(title: "Toggle", systemImage: "switch.2"),
    .init(title: "Link", systemImage: "link"),
    .init(title: "ProgressView", systemImage: "menubar.dock.rectangle"),
    .init(title: "Picker", systemImage: "arrow.up.and.down.text.horizontal"),
    .init(title: "Slider", systemImage: "slider.horizontal.3"),
    .init(title: "Stepper", systemImage: "plusminus"),
   ]

   var body: some View {
     Text("Swifty Catalog").bold()
     List {
         Section(header: Text("View Elements")) {
           ForEach(viewElements) { ve in
             NavigationLink(value: ve) {
               Label(ve.title, systemImage: ve.systemImage)
             }
           }
         }
         Section(header: Text("SwiftUI"), footer: Text("A lot to learn")) {
             Text("List")
         }
     }
     .navigationDestination(for: CatalogItem.self) { ve in
       switch ve.title {
       case "Text":
         TextCatalogView()
       case "Image":
         ImageCatalogView()
       case "Localization":
         TextLocalizationView()
       default:
         TextCatalogView()
       }
     }

       .padding()
   }
}

#Preview {
  MasterCatalog()
}

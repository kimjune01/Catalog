
import SwiftUI

struct ImageCatalogView: View {
  
  let viewElements: [CatalogItem] = [
    
    ]

    var body: some View {
      Text("Image Catalog").bold()
      List {
          Section(header: Text("View Elements")) {
            ForEach(viewElements) { ve in
              Label(ve.title, systemImage: ve.systemImage)
            }
          }
      }
        .padding()
    }
}

#Preview {
  ImageCatalogView()
}

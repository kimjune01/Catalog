
import SwiftUI

struct CatalogListView: View {
  let keys: [String]
  let catalogList: CatalogList
  let title: String
  init (title: String, catalogList: CatalogList) {
    self.keys = Array(catalogList.keys)
    self.title = title
    self.catalogList = catalogList
  }
  
  var body: some View {
    List {
      ForEach(keys, id: \.self) { key in
        Section(header: Text(key)) {
          ForEach(catalogList[key]!) { item in
            NavigationLink(value: item) {
              Label(item.title(), systemImage: item.imageName())
            }
          }
        }
      }
    }
    .navigationTitle(title)
    .navigationDestination(for: CatalogItem.self) { item in
      if let list = getCatalogList(for:item) {
        CatalogListView(title: item.title(), catalogList: list)
      } else {
        getCatalogContent(for: item)
      }
    }
  }
}

#Preview {
  CatalogListView(title: "Swifty Catalog", catalogList: masterCatalog)
}

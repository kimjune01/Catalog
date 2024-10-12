//
//  LocationDetailsView.swift
//  SwiftyCatalog
//
//  Created by June Kim on 2024-10-11.
//

import SwiftUI
import MapKit

struct LocationDetailsView: View {
  @Binding var mapSelection: MKMapItem?
  @Binding var show: Bool
  var body: some View {
    VStack (alignment: .leading, spacing: 20) {
      Button {
        show.toggle()
        mapSelection = nil
      } label: {
        Image(systemName: "xmark.circle.fill")
          .resizable()
          .frame(width: 24, height: 24)
          .foregroundStyle(.gray)
      }
      .padding()
      Text("Custom location details view").font(.headline)
      Text(mapSelection?.placemark.name ?? "").font(.subheadline)
      Text(mapSelection?.placemark.title ?? "").font(.subheadline)
      Spacer()
    }
  }
}

#Preview {
  LocationDetailsView(mapSelection: .constant(nil), show: .constant(false))
}

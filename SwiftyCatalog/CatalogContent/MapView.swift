//
import SwiftUI
import MapKit

let appleRegion = MKCoordinateRegion.init(center:
                                            CLLocationCoordinate2D.init(latitude: 37.3346, longitude: -122.0090), latitudinalMeters: 1000, longitudinalMeters: 1000)
struct MapView: View {
  @State private var cameraPosition: MapCameraPosition = .region(appleRegion)
  @State private var styleIndex = 0
  let allStyleIndices = [0, 1, 2]
  let allMapStyles: [MapStyle] = [.standard, .imagery, .hybrid]
  func text(forMapStyleIndex: Int) -> String {
    switch forMapStyleIndex {
    case 0: return "Standard"
    case 1: return "Imagery"
    case 2: return "Hybrid"
    default: return "nil"
    }
  }
  
  @State private var compassEnabled = false
  @State private var pitchToggleEnabled = false
  @State private var userLocationEnabled = false
  @State private var scaleViewEnabled = false
  @State private var overlayEnabled = false
  @State private var customAnnotationEnabled = false
  @State private var mapCircleEnabled = false
  
  let edgeIndices = [0,1,2,3, 4, 5, 6, 7, 8]
  @State private var selectedEdgeIndex = 0
  let allEdges: [Alignment] = [.top, .bottom, .leading, .trailing, .center, .topLeading, .topTrailing, .bottomLeading, .bottomTrailing]
  func text(forEdgeIndex: Int) -> String {
    switch forEdgeIndex {
    case 0: return "Top"
    case 1: return "Bottom"
    case 2: return "Leading"
    case 3: return "Trailing"
    case 4: return "Center"
    case 5: return "Top Leading"
    case 6: return "Top Trailing"
    case 7: return "Bottom Leading"
    case 8: return "Bottom Trailing"
    default: return "nil"
    }
  }
  
  @State private var searchText = ""
  @State private var searchResults: [MKMapItem] = []
  @State private var mapSelection: MKMapItem?
  @State private var showDetails: Bool = false
  
  @State private var overlayLevel = MKOverlayLevel.aboveRoads

  var body: some View {
    ScrollView{
      VStack(spacing: 20) {
        Map(position:$cameraPosition, selection: $mapSelection) {
          if customAnnotationEnabled {
            Annotation("Apple Park", coordinate: appleRegion.center) {
              Image(systemName: "apple.logo").foregroundStyle(.white)
            }
          }
          if mapCircleEnabled {
            MapCircle(center: appleRegion.center, radius: 200)
              .foregroundStyle(.cyan.opacity(0.5))
              .mapOverlayLevel(level: overlayLevel)            
          }
          ForEach(searchResults, id: \.self) { result in
            let placemark = result.placemark
            Marker(placemark.name ?? "", coordinate: placemark.coordinate)
          }
        }
        .mapStyle(allMapStyles[styleIndex])
        .mapControls {
          if compassEnabled { MapCompass() }
          if pitchToggleEnabled { MapPitchToggle() }
          if userLocationEnabled { MapUserLocationButton() }
          if scaleViewEnabled { MapScaleView() }
          
        }
        .overlay(alignment: allEdges[selectedEdgeIndex]) {
          TextField("Search for a location", text: $searchText)
            .font(.subheadline)
            .padding(12)
            .background(Color.white.opacity(0.8))
            .frame(width: 250)
            .padding()
            .shadow(radius: 10)
        }
        .onSubmit(of: .text) {
          print("submitted")
          Task {
            searchResults = await searchPlaces(searchText, region: appleRegion)
          }
        }
        .onChange(of: mapSelection, { oldValue, newValue in
          showDetails = newValue != nil
        })
        .sheet(isPresented: $showDetails, content: {
          LocationDetailsView(mapSelection: $mapSelection, show: $showDetails)
            .presentationDetents([.height(200)])
        })
        .frame(height: 350)
        Picker("Text alignment", selection: $styleIndex) {
          ForEach(allStyleIndices, id: \.self) { idx in
            Text(text(forMapStyleIndex:idx)).tag(idx)
          }
        }
        .pickerStyle(.segmented)
        HStack {
          Toggle("Compass", isOn: $compassEnabled)
            .toggleStyle(.button)
          Toggle("Pitch", isOn: $pitchToggleEnabled)
            .toggleStyle(.button)
          Toggle("User location", isOn: $userLocationEnabled)
            .toggleStyle(.button)
          Toggle("Scale", isOn: $scaleViewEnabled)
            .toggleStyle(.button)
        }
        Text("Compass button shows only when rotated").font(.caption)

        HStack {
          Toggle("TextField overlay", isOn: $overlayEnabled)
            .toggleStyle(.button)
          Picker("Position", selection: $selectedEdgeIndex) {
            ForEach(edgeIndices, id: \.self) { idx in
              Text(text(forEdgeIndex: idx)).tag(idx)
            }
          }
          .pickerStyle(.menu)
        }
        HStack {
          Toggle("Map Circle", isOn: $mapCircleEnabled)
            .toggleStyle(.button)
          Picker("Position", selection: $overlayLevel) {
            Text("Above Roads").tag(MKOverlayLevel.aboveRoads)
            Text("Above Labels").tag(MKOverlayLevel.aboveLabels)
          }
        }

        Toggle("Custom Annotation", isOn: $customAnnotationEnabled)
          .toggleStyle(.button)


      }
    }
  }
}

extension MapView {
  func searchPlaces(_ searchText: String, region: MKCoordinateRegion) async -> [MKMapItem] {
    let request = MKLocalSearch.Request()
    request.naturalLanguageQuery = searchText
    request.region = region
    
    let results = try? await MKLocalSearch(request: request).start()
    return results?.mapItems ?? []
  }
}

#Preview {
  MapView()
}

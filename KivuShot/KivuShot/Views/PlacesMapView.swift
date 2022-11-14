//
//  PlacesMapView.swift
//  KivuShot
//
//  Created by Cédric Bahirwe on 13/11/2022.
//

import SwiftUI
import MapKit

struct PlacesMapView: View {
    @StateObject private var store = PlacesStore()
    @State var isToggled = false
    var body: some View {
        ZStack(alignment: .bottom) {
            Map(
                coordinateRegion: $store.coordinateRegion,
                interactionModes: store.interactionModes,
                showsUserLocation: store.isUserLocationVisible,
                userTrackingMode: $store.userTrackingMode,
                annotationItems: store.places) { place in
                    MapAnnotation(coordinate: place.coordinate) {
                        VStack {
                            Image("hotel.placeholder")
                                .resizable()
                                .frame(width: 50, height: 50)
                                .clipShape(Circle())
                            Text(place.name)
                                .shadow(color: .black, radius: 2, x: 2, y: 2)
                                .multilineTextAlignment(.center)
                                .lineLimit(2, reservesSpace: false)
                        }
                        .frame(width: 100)
                        .background(.red)
                    }

                }
                .ignoresSafeArea()

            Button("Toggle", action: store.goToNext)
                .buttonStyle(.borderedProminent)

        }
        .preferredColorScheme(.dark)
    }

    final class PlacesStore: ObservableObject {
        private static let gomaCenter = CLLocationCoordinate2D(latitude: -1.647616,
                                                               longitude: 29.205361)
        private(set) var span = MKCoordinateSpan()
        private(set) var interactionModes: MapInteractionModes = .all

        @Published var coordinateRegion = MKCoordinateRegion(center: Place.examples.first!.coordinate,
                                                             span: .init(latitudeDelta: 0.05,
                                                                         longitudeDelta: 0.05))
        private(set) var isUserLocationVisible = true
        @Published var userTrackingMode: MapUserTrackingMode = .follow
        private(set) var places: [Place] = Place.examples
        private var currentPlaceIndex = 0

        public func goToNext() {
            currentPlaceIndex += 1
            if currentPlaceIndex >= places.count {
                currentPlaceIndex = 0
            }

            let place = places[currentPlaceIndex]

            changeMapRegion(to: place.coordinate, range: 0.01)

        }

        public func changeMapRegion(to coordinate: CLLocationCoordinate2D, range: Double) {
            // Zoom Out
            withAnimation {
                coordinateRegion.span = .init(latitudeDelta: range*5,
                                              longitudeDelta: range*5)
            }
            // Zoom In
            DispatchQueue.main.asyncAfter(deadline: .now()+0.5) {
                withAnimation {
                    self.coordinateRegion = MKCoordinateRegion(center: coordinate,
                                                                span: .init(latitudeDelta: range,
                                                                            longitudeDelta: range))
                }
            }
        }
    }

    struct Place: Identifiable {
        let id: UUID
        let name: String
        let coordinate: CLLocationCoordinate2D

        init(_ name: String, coordinate: CLLocationCoordinate2D) {
            self.id = UUID()
            self.name = name
            self.coordinate = coordinate
        }

        init(_ name: String, _ coordinate: (lat: Double, long: Double)) {
            self.id = UUID()
            self.name = name
            self.coordinate = CLLocationCoordinate2D(latitude: coordinate.lat,
                                                     longitude: coordinate.long)
        }

        static let examples: [Place] = [
            Place("Serena Hotel Goma", (-1.696310, 29.232899)),
            Place("Hote Karibu", (-1.667906, 29.180722)),
            Place("Hotel Cap Kivu", (-1.680919, 29.213611))
        ]
    }
}

struct PlacesMapView_Previews: PreviewProvider {
    static var previews: some View {
        PlacesMapView()
    }
}

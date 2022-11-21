//
//  PlacesViewModel.swift
//  KivuShot
//
//  Created by Cédric Bahirwe on 14/11/2022.
//

import SwiftUI
import MapKit

public typealias PlacesStore = PlacesViewModel


public final class PlacesViewModel:  ObservableObject {
    private static let gomaCenter = CLLocationCoordinate2D(latitude: -1.647616,
                                                           longitude: 29.205361)
    private(set) var span = MKCoordinateSpan()
    private(set) var interactionModes: MapInteractionModes = .all

    @Published var coordinateRegion = MKCoordinateRegion(center: KivuPlace.examples.first!.coordinate,
                                                         span: .init(latitudeDelta: 0.05,
                                                                     longitudeDelta: 0.05))
    private(set) var isUserLocationVisible = true
    @Published var userTrackingMode: MapUserTrackingMode = .follow
    private(set) var places: [KivuPlace] = KivuPlace.examples
    private var currentPlaceIndex = 0


    public func getSelectedPlace() -> KivuPlace {
        places[currentPlaceIndex]

    }
    public func goToNext() {
        currentPlaceIndex += 1
        if currentPlaceIndex >= places.count {
            currentPlaceIndex = 0
        }

        let place = places[currentPlaceIndex]

        changeMapRegion(to: place.coordinate)

    }

    public func changeMapRegion(to coordinate: CLLocationCoordinate2D, range: Double = 0.01) {
        // Zoom Out
//        withAnimation {
//            coordinateRegion.span = .init(latitudeDelta: range*5,
//                                          longitudeDelta: range*5)
//        }
        // Zoom In
        DispatchQueue.main.asyncAfter(deadline: .now()+0.5) {
            withAnimation {
                self.coordinateRegion = MKCoordinateRegion(center: coordinate,
                                                           span: .init(latitudeDelta: range,
                                                                       longitudeDelta: range))
            }
        }
    }

    public func selectPlace(_ place: any Place) {
        if let selectedIndex = places.firstIndex(where: { $0.id == place.id }) {
            currentPlaceIndex = selectedIndex

            changeMapRegion(to: place.coordinate)
        }
    }
}

//
//  KivuPlace.swift
//  KivuShot
//
//  Created by Cédric Bahirwe on 14/11/2022.
//

import CoreLocation

public struct KivuPlace: Place {
    public let id: UUID

    public var name: String

    public var location: PlaceLocation


    init(id: UUID = UUID(),_ name: String, coordinate: CLLocationCoordinate2D) {
        self.id = id
        self.name = name
        self.location = PlaceLocation(coordinate: coordinate)
    }

    init(id: UUID = UUID(), _ name: String, _ coordinate: (lat: Double, long: Double)) {
        self.id = id
        self.name = name
        self.location = PlaceLocation(coordinate: CLLocationCoordinate2D(latitude: coordinate.lat,
                                                                             longitude: coordinate.long))
    }

    #if DEBUG
    static let examples: [Self] = [
        KivuPlace("Serena Hotel Goma", (-1.696310, 29.232899)),
        KivuPlace("Hote Karibu", (-1.667906, 29.180722)),
        KivuPlace("Hotel Cap Kivu", (-1.680919, 29.213611))
    ]
    #endif
}

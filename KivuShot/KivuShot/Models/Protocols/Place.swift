//
//  Place.swift
//  KivuShot
//
//  Created by Cédric Bahirwe on 14/11/2022.
//

import CoreLocation

public protocol Place: Identifiable, Codable {
    var id: UUID { get }
    var name: String { get set }
    var location: PlaceLocation { get set }
}

public extension KivuPlace {
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: location.latitude,
                               longitude: location.longitude)
    }
}

public struct PlaceLocation: Codable {
    let latitude: Double
    let longitude: Double
    let accuracy: Double?

    init(latitude: Double, longitude: Double, accuracy: Double? = nil) {
        self.latitude = latitude
        self.longitude = longitude
        self.accuracy = accuracy
    }


    init(coordinate: CLLocationCoordinate2D, accuracy: Double? = nil) {
        self.latitude = coordinate.latitude
        self.longitude = coordinate.longitude
        self.accuracy = accuracy
    }
}

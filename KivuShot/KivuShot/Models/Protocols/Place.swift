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
    var summary: String { get set}
    var longSummary: String { get set }
    var coverURL: URL { get set }
    var location: PlaceLocation { get set }
    var website: URL? { get set }
}

public extension Place {
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: location.latitude,
                               longitude: location.longitude)
    }
}


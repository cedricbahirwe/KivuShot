//
//  PlaceLocation.swift
//  KivuShot
//
//  Created by Cédric Bahirwe on 21/11/2022.
//

import Foundation

public struct PlaceLocation: Equatable, Codable {
    let address: String?
    let latitude: Double
    let longitude: Double
    let accuracy: Double?


    init(address: String? = nil, latitude: Double, longitude: Double, accuracy: Double? = nil) {
        self.address = address
        self.latitude = latitude
        self.longitude = longitude
        self.accuracy = accuracy
    }
}

public extension PlaceLocation {
    static let serena = PlaceLocation(latitude: -1.696310,
                                      longitude: 29.232899)

    static let kivulodge = PlaceLocation(latitude: -1.675635,
                                         longitude: 29.205250)

    static let capkivu = PlaceLocation(latitude: -1.681119,
                                       longitude: 29.214056)
}

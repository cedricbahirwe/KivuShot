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

    public var coverURL: URL

    public var summary: String
    public var longSummary: String

    public var location: PlaceLocation

    public var website: URL?

    public init(id: UUID = UUID(), name: String, coverURL: URL = URL(string: "https://maps.google.com")!, summary: String = "", longSummary: String = "", location: PlaceLocation, website: URL? = nil) {
        self.id = id
        self.name = name
        self.coverURL = coverURL
        self.summary = summary
        self.longSummary = longSummary
        self.location = location
        self.website = website
    }

#if DEBUG
    static let serena: Self = Self(name: "Serena Hotel Goma",
                                   coverURL: .example,
                                   summary: "Stay in our hotel in Goma, DRC, on Lake Kivu with an Olympic-sized pool and 5-star accommodation.",
                                   location: .serena, website: .example)
    static let examples: [Self] = [
        .serena,
        KivuPlace(name: "Lac Kivu Lodge", coverURL: .example,
                  summary: "The lodge is decorated properly with an African touch and a mixture of all kinds of culture to cater for all guests.",
                  longSummary: "The food is great and it serves most of the delicacies. You will have a change to test the best Congolese dishes and other African dishes.",
                  location: .kivulodge),
        KivuPlace(name: "Hotel Cap Kivu", coverURL: .example,
                  summary: "Hôtel audacieux qui capture le glamour et l'ambiance de  Goma.",
                  longSummary: "Situé dans un décor à couper le souffle du lac Kivu, cet hôtel de style de vie dispose de 70 chambres et suites luxueuses avec vue sur le lac ou la ville.L'hôtel est un haut lieu de la fête et de la gastronomie avec une offre de restaurant , de bar  invitant à une nouvelle expérience chaque jour.Que vous recherchiez une expérience culinaire gastronomique ou que vous souhaitiez plonger dans la piscine, notre complexe propose des choix décontractés ou énergiques.",
                  location: .capkivu,
                  website: URL(string: "https://www.capkivuhotel.com/fr"))
    ]

    var computedImage: String {
        switch location {
        case .serena: return "serena"
        case .capkivu: return "capkivu"
        case .kivulodge: return "kivulodge"
        default: return "hotel.placeholder"
        }
    }
#endif
}

//
//  LocationSearchAlgorithm.swift
//  KivuShot
//
//  Created by Cédric Bahirwe on 03/12/2022.
//

import MapKit
import Combine

final class LocationService: NSObject, ObservableObject {
    var entryLocation = CLLocation()

    enum LocationStatus: Equatable {
        case idle
        case noResults
        case isSearching
        case error(String)
        case result
    }

    @Published var queryFragment: String = ""
    @Published private(set) var status: LocationStatus = .idle
    @Published private(set) var searchResults: [MKLocalSearchCompletion] = []

    private var queryCancellable: AnyCancellable?
    private let searchCompleter: MKLocalSearchCompleter!

    init(searchCompleter: MKLocalSearchCompleter = MKLocalSearchCompleter()) {
        self.searchCompleter = searchCompleter

        // Filters out any points of interest other than the listed types
        searchCompleter.pointOfInterestFilter = .some(MKPointOfInterestFilter(including: [.restaurant, .brewery, .winery, .nightlife, .cafe]))
        // Only includes points of interest in the results (not roads, etc.)
        searchCompleter.resultTypes = .pointOfInterest
        // Defines search region with center on user current location and user defined span
        searchCompleter.region = MKCoordinateRegion(center: entryLocation.coordinate, span: MKCoordinateSpan(latitudeDelta: 2.0, longitudeDelta: 2.0))

        super.init()
        self.searchCompleter.delegate = self

        queryCancellable = $queryFragment
            .receive(on: DispatchQueue.main)
            .debounce(for: .milliseconds(100), scheduler: RunLoop.main, options: nil)
            .sink(receiveValue: { fragment in
                self.status = .isSearching
                if !fragment.isEmpty {
                    self.searchCompleter.queryFragment = fragment
                } else {
                    self.status = .idle
                    self.searchResults = []
                }
        })
    }
}

extension LocationService: MKLocalSearchCompleterDelegate {
    func completerDidUpdateResults(_ completer: MKLocalSearchCompleter) {
        // Filters the results based on the filter criteria
        self.searchResults = completer.results.filter({ $0.subtitle != "Search Nearby" })
        self.status = completer.results.isEmpty ? .noResults : .result
    }

    func completer(_ completer: MKLocalSearchCompleter, didFailWithError error: Error) {
        self.status = .error(error.localizedDescription)
    }
}

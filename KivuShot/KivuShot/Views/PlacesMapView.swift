//
//  PlacesMapView.swift
//  KivuShot
//
//  Created by Cédric Bahirwe on 13/11/2022.
//

import SwiftUI
import MapKit

struct PlacesMapView: View {
    @ObservedObject var store: PlacesStore

    var body: some View {
        Map(
            coordinateRegion: $store.coordinateRegion,
            interactionModes: store.interactionModes,
            showsUserLocation: store.isUserLocationVisible,
            userTrackingMode: $store.userTrackingMode,
            annotationItems: store.places) { place in
                MapAnnotation(coordinate: place.coordinate) {
                    VStack(spacing: 5) {
                        Image("hotel.placeholder")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
                        Text(place.name)
                            .font(.caption)
                            .shadow(color: .black, radius: 2, x: 2, y: 2)
                            .multilineTextAlignment(.center)
                            .lineLimit(2, reservesSpace: false)
                    }
                    .frame(width: 100)
                    .onTapGesture {
                        store.selectPlace(place)
                    }
                }
            }
            .ignoresSafeArea()
    }
}

#if DEBUG
struct PlacesMapView_Previews: PreviewProvider {
    static var previews: some View {
        PlacesMapView(store: PlacesStore())
    }
}
#endif

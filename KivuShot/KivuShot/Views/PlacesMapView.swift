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
        ZStack(alignment: .top) {

            ZStack(alignment: .bottom) {
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

                PlaceBottomOverlayView(place: store.getSelectedPlace())
                    .padding(.horizontal, 6)
                    .gesture(
                        DragGesture()
                            .onEnded({ newValue in
                                if newValue.translation.width > 0 {
                                    store.selectPrevious()
                                } else {
                                    store.selectNext()
                                }
                            })
                    )
//                    .defersSystemGestures(on: <#T##Edge.Set#>)
                //            Button("Toggle", action: store.goToNext)
                //                .buttonStyle(.borderedProminent)

            }

            titleHeaderView()

        }
        .preferredColorScheme(.dark)
    }
}


extension PlacesMapView {
    func titleHeaderView() -> some View {
        Text("KivuShot")
            .font(.system(.title2, design: .rounded))
            .fontWeight(.black)
            .shadow(color: .black, radius: 4, x: 3, y: 3)
            .padding()
            .frame(maxWidth: .infinity)
            .background(.ultraThinMaterial)
    }
}
struct PlacesMapView_Previews: PreviewProvider {
    static var previews: some View {
        PlacesMapView()
    }
}

//
//  PlaceBottomOverlayView.swift
//  KivuShot
//
//  Created by Cédric Bahirwe on 14/11/2022.
//

import SwiftUI

struct PlaceBottomOverlayView: View {
    let place: KivuPlace
    var body: some View {
        HStack {
            Image("hotel.placeholder")
                .resizable()
                .frame(width: 150, height: 100)
                .background(.thinMaterial,
                            in: RoundedRectangle(cornerRadius: 15))

            VStack(alignment: .leading) {

                Text(place.name)

                Text(place.description)

            }

        }
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct PlaceBottomOverlayView_Previews: PreviewProvider {
    static let place = KivuPlace.examples.first!
    static var previews: some View {
        PlaceBottomOverlayView(place: place)
    }
}

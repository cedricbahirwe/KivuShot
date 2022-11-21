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
        HStack(alignment: .top) {
            Image(place.computedImage)
                .resizable()
                .frame(width: 150, height: 125)
                .background(.thinMaterial,
                            in: RoundedRectangle(cornerRadius: 15))
                .cornerRadius(15)

            VStack(alignment: .leading) {
                Text(place.name)
                    .font(.title3)
                Text(place.summary)
                    .font(.callout)
                    .foregroundColor(.gray)
                    .lineLimit(3)

                if let website = place.website {
                    Link(destination: place.coverURL) {
                        Label(website.absoluteString,
                              systemImage: "arrow.up.right.square")
                        .font(.callout)
                        .labelStyle(.iconThenTitle)
                    }
                    .lineLimit(1)
                    
                }
            }
        }
        .padding()
        .frame(maxWidth: .infinity,
               alignment: .leading)
        .background(.regularMaterial)
        .cornerRadius(18)
        
    }
}

struct PlaceBottomOverlayView_Previews: PreviewProvider {
    static let place = KivuPlace.examples.first!
    static var previews: some View {
        PlaceBottomOverlayView(place: place)
            .previewLayout(.sizeThatFits)
//            .preferredColorScheme(.dark)
    }
}

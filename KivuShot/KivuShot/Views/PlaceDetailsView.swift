//
//  PlaceDetailsView.swift
//  KivuShot
//
//  Created by Cédric Bahirwe on 14/11/2022.
//

import SwiftUI

struct PlaceDetailsView: View {
    private let screenSize = UIScreen.main.bounds.size.height
    let place: KivuPlace
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                Image(place.computedImage)
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: .infinity, maxHeight: screenSize*0.3)

                VStack(alignment: .leading, spacing: 20) {
                    Text(place.name)
                        .font(.title.weight(.black))
                    Text(place.summary)
                        .font(.title2)
                        .opacity(0.9)

                    Group {
                        Text(place.longSummary)
                            .font(.headline)
                            .foregroundColor(.secondary)
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}

#if DEBUG
struct PlaceDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        PlaceDetailsView(place: .examples[0])
    }
}
#endif

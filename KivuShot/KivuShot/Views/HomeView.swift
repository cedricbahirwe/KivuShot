//
//  HomeView.swift
//  KivuShot
//
//  Created by Cédric Bahirwe on 21/11/2022.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var store = PlacesStore()

    var body: some View {
        ZStack(alignment: .top) {

            ZStack(alignment: .bottom) {
                PlacesMapView(store: store)
                PlaceBottomOverlayView(place: store.getSelectedPlace())
                    .padding(.horizontal, 6)
                    .onTapGesture(perform: store.goToDetails)
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
            }
            .sheet(item: $store.detailedPlace, content: PlaceDetailsView.init)

            titleHeaderView()


        }
        .preferredColorScheme(.dark)

    }
}

private extension HomeView {
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

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

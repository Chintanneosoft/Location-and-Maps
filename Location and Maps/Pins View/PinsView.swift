//
//  PinsView.swift
//  Location and Maps
//
//  Created by Neosoft on 17/11/23.
//

import Foundation
import SwiftUI
import MapKit



struct PinsView: View {
    @StateObject var viewModel: PinsViewModel

    var body: some View {
        Map(
            mapRect: $viewModel.mapRect,
            annotationItems: viewModel.cities
        ) { city in
            MapMarker(coordinate: city.coordinate, tint: .accentColor)
        }.onAppear(perform: viewModel.fit)
    }
}


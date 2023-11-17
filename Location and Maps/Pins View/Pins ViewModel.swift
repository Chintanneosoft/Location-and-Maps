//
//  Pins ViewModel.swift
//  Location and Maps
//
//  Created by Neosoft on 17/11/23.
//

import Foundation
import MapKit

@MainActor
class PinsViewModel: ObservableObject {
    @Published var mapRect = MKMapRect()
    let cities: [City]

    init(cities: [City]) {
        self.cities = cities
    }

    func fit() {
        let points = cities.map(\.coordinate).map(MKMapPoint.init)
        mapRect = points.reduce(MKMapRect.null) { rect, point in
            let newRect = MKMapRect(origin: point, size: MKMapSize())
            return rect.union(newRect)
        }
    }
}

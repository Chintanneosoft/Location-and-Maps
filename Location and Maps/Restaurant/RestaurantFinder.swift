//
//  RestaurantFinder.swift
//  Location and Maps
//
//  Created by Neosoft on 20/11/23.
//

import Foundation
import SwiftUI
import MapKit

class RestaurantFinder: ObservableObject {
    @Published var restaurants = [Restaurant(name: "", coordinate: CLLocationCoordinate2D())]
    
    func findNearbyRestaurants(location: CLLocation) {
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = "restaurant"
        //More keywords “coffee”,“hotels”,“museums”,“parks”,“cinemas”,“grocery stores”,“hospitals”,“pharmacies”,“gas stations”,“schools”,“universities”
        request.region = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
        
        let search = MKLocalSearch(request: request)
        search.start { (response, error) in
            guard let response = response else { return }
            
            self.restaurants = response.mapItems.map { item in
                Restaurant(name: item.name ?? "", coordinate: item.placemark.coordinate)
            }
        }
    }
}

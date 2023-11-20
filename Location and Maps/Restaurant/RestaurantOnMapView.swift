//
//  RestaurantOnMapView.swift
//  Location and Maps
//
//  Created by Neosoft on 20/11/23.
//

import SwiftUI
import CoreLocation
import MapKit
struct RestaurantOnMapView: View {
    
    @StateObject var finder = RestaurantFinder()
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(), latitudinalMeters: 1000, longitudinalMeters: 1000)
    @State private var latitude = CLLocationDegrees()
    @State private var longitude = CLLocationDegrees()
    @State private var colors: [Color] = [.yellow,.red,.orange,.white,.indigo,.gray,.blue,.black,.mint,.green,.pink,.brown,.purple,.cyan]
    var combinedVariables: [CLLocationDegrees] {
        [latitude, longitude]
    }
    var body: some View {
        Map(coordinateRegion: $region, annotationItems: finder.restaurants) { restaurant in
            MapMarker(coordinate: restaurant.coordinate, tint: colors.randomElement())
        }
        .onChange(of: region.center.latitude) { newCenter in
            latitude = newCenter
        }
        .onChange(of: region.center.longitude) { newCenter in
            longitude = newCenter
        }
        .onChange(of: combinedVariables) { newCenter in
            let location = CLLocation(latitude: newCenter[0], longitude: newCenter[1])
            finder.findNearbyRestaurants(location: location)
        }
    }
}

struct RestaurantOnMapView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantOnMapView()
    }
}

//
//  RestaurantView.swift
//  Location and Maps
//
//  Created by Neosoft on 20/11/23.
//

import SwiftUI
import CoreLocation
import MapKit

struct RestaurantView: View {
    
    @StateObject var finder = RestaurantFinder()
    @ObservedObject var locationManager = LocationManager()
    
    @State private var colors: [Color] = [.yellow,.red,.orange,.white,.indigo,.gray,.blue,.black,.mint,.green,.pink,.brown,.purple,.cyan]
    
    var body: some View {
        Map(coordinateRegion: .constant(MKCoordinateRegion(center: locationManager.location?.coordinate ?? CLLocationCoordinate2D(), latitudinalMeters: 1000, longitudinalMeters: 1000)), annotationItems: finder.restaurants) { restaurant in
            MapMarker(coordinate: restaurant.coordinate, tint: colors.randomElement())
                }
            .onReceive(locationManager.$location, perform: { location in
                finder.findNearbyRestaurants(location: location ?? CLLocation())
            })
            
        }
}

struct RestaurantView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantView()
    }
}

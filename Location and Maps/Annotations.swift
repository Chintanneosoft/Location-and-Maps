//
//  Annotations.swift
//  Location and Maps
//
//  Created by Neosoft on 17/11/23.
//

import Foundation
import SwiftUI
import MapKit

struct Annotations: View {
    
    @State private var cities: [City] = [
        City(coordinate: .init(latitude: 40.7128, longitude: 74.0060),color: .black.opacity(0.5)),
        City(coordinate: .init(latitude: 37.7749, longitude: 122.414),color: .black.opacity(0.5)),
        City(coordinate: .init(latitude: 47.6062, longitude: 122.3321),color: .black.opacity(0.5))
    ]
    
    @State private var colors: [Color] = [.yellow,.red,.orange,.white,.indigo,.gray,.blue,.black,.mint,.green,.pink,.brown,.purple,.cyan]
    
    @State private var userTrackingMode: MapUserTrackingMode = .follow
    
    @ObservedObject var locationManager = LocationManager()
    
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 25.7617, longitude: 80.1918),
        span: MKCoordinateSpan(latitudeDelta: 10, longitudeDelta: 10)
    )

    var body: some View {
        Map(coordinateRegion: $region, annotationItems: cities) { city in
            MapAnnotation(
                coordinate: city.coordinate,
                anchorPoint: CGPoint(x: 0.5, y: 0.5)
            ) {
                Circle()
                    .fill(city.color)
                    .frame(width: 44, height: 44)
            }
        }
        .onReceive(locationManager.$location) { location in
            cities.append(City(coordinate: location?.coordinate ?? CLLocationCoordinate2D(), color: colors.randomElement()?.opacity(0.5) ?? .black))
        }
        
    }
}

//
//  LocationView.swift
//  Location and Maps
//
//  Created by Neosoft on 17/11/23.
//

import Foundation
import SwiftUI
import CoreLocation
import MapKit

struct LocationTrackerView: View {
    
    @State private var currentLocation = CLLocationCoordinate2D()
    @State private var centerCoordinate = CLLocationCoordinate2D()
    @State private var showingPlaceDetails = false
    @State private var selectedPlace: MKPointAnnotation? = nil
    @State private var locations: [MKPointAnnotation] = []
    
    @ObservedObject var locationManager = LocationManager()
    
    var body: some View {
            CurrentLocationView(centerCoordinate: $centerCoordinate, selectedPlace: $selectedPlace, showingPlaceDetails: $showingPlaceDetails, currentLocation: $currentLocation ,  annotations: locations)
                .edgesIgnoringSafeArea(.all)
                .onReceive(locationManager.$location) { location in
                    setCurrentLocationView(location: location)
                                }
    }
    
    func setCurrentLocationView(location: CLLocation?){
        guard let location = location else { return }
        self.currentLocation = location.coordinate
        self.centerCoordinate = location.coordinate
    }
}

struct LocationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationTrackerView()
    }
}

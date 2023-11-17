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

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    private let locationManager = CLLocationManager()
    @Published var location: CLLocation?

    override init() {
        super.init()
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.requestWhenInUseAuthorization()
    }

    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        switch manager.authorizationStatus {
        case .authorizedWhenInUse, .authorizedAlways:
            self.locationManager.startUpdatingLocation()
        default:
            break
        }
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        self.location = location
    }
}

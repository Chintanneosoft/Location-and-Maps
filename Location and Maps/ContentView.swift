//
//  ContentView.swift
//  Location and Maps
//
//  Created by Neosoft on 17/11/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                
                NavigationLink(destination: LocationTrackerView()) {
                    Text("See My Location")
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .foregroundColor(.red)
                        .padding()
                        .background(.yellow)
                        .cornerRadius(30)
                }
                
                
                NavigationLink(destination: Annotations()) {
                    Text("Annotations")
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .foregroundColor(.red)
                        .padding()
                        .background(.yellow)
                        .cornerRadius(30)
                }
                
                NavigationLink(destination: PinsView(viewModel: PinsViewModel(
                    cities: [
                        City(coordinate: .init(latitude: 40.7128, longitude: 74.0060), color: .red),
                        City(coordinate: .init(latitude: 37.7749, longitude: 122.4194), color: .green),
                        City(coordinate: .init(latitude: 47.6062, longitude: 122.3321), color: .blue)]))) {
                    Text("PinsView")
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .foregroundColor(.red)
                        .padding()
                        .background(.yellow)
                        .cornerRadius(30)
                }
                
                NavigationLink(destination:RestaurantView() ) {
                    Text("RestaurantView")
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .foregroundColor(.red)
                        .padding()
                        .background(.yellow)
                        .cornerRadius(30)
                }
                
                NavigationLink(destination:RestaurantOnMapView() ) {
                    Text("Restaurant On Map View")
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .foregroundColor(.red)
                        .padding()
                        .background(.yellow)
                        .cornerRadius(30)
                }
            }
            .navigationTitle("Location and Views")
            .padding()
            .frame(maxWidth: .infinity,maxHeight: .infinity)
            .background(.orange)
        }
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

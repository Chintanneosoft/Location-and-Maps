//
//  RestaurantModel.swift
//  Location and Maps
//
//  Created by Neosoft on 20/11/23.
//

import Foundation
import SwiftUI
import CoreLocation

struct Restaurant: Identifiable{
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
}

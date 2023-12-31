//
//  City Model.swift
//  Location and Maps
//
//  Created by Neosoft on 17/11/23.
//

import Foundation
import CoreLocation
import SwiftUI

struct City: Identifiable {
    let id = UUID()
    let coordinate: CLLocationCoordinate2D
    let color: Color
}

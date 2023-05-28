//
//  Location.swift
//  4-Africa
//
//  Created by giangbb on 10/11/2022.
//

import SwiftUI
import MapKit

struct Location : Codable, Identifiable {
    let id: String
    let name: String
    let image: String
    let latitude: Double
    let longitude: Double
    
    var locat: CLLocationCoordinate2D{
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}

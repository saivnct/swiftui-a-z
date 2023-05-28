//
//  Video.swift
//  4-Africa
//
//  Created by giangbb on 10/11/2022.
//

import SwiftUI

struct Video: Codable, Identifiable {
    let id: String
    let name: String
    let headline: String
    
    //computed property
    var thumbnail: String{
        "video-\(id)"
    }
}

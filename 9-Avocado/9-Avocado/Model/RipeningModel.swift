//
//  RipeningModel.swift
//  9-Avocado
//
//  Created by giangbb on 25/11/2022.
//

import SwiftUI

struct Ripening: Identifiable {
    var id = UUID()
    var image: String
    var stage: String
    var title: String
    var description: String
    var ripeness: String
    var instruction: String
}

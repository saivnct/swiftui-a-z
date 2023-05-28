//
//  CardModel.swift
//  8-LearnByDoing
//
//  Created by giangbb on 21/11/2022.
//

import SwiftUI

struct Card: Identifiable {
    var id = UUID()
    var title: String
    var headline: String
    var imageName: String
    var callToAction: String
    var message: String
    var gradientColors: [Color]
}

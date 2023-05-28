//
//  Constant.swift
//  6-Devote
//
//  Created by giangbb on 15/11/2022.
//

import SwiftUI


// MARK: -  FORMATTER

let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

// MARK: -  UI
var backgroundGradient : LinearGradient {
    return LinearGradient(gradient: Gradient(colors: [.pink,.pink,.blue,.blue]), startPoint: .topLeading, endPoint: .bottomTrailing)
}


// MARK: -  UX
let feedBack = UINotificationFeedbackGenerator()

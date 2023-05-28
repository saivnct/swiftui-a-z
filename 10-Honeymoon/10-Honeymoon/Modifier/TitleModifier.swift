//
//  TitleModifier.swift
//  10-Honeymoon
//
//  Created by solgo on 29/11/2022.
//

import SwiftUI

struct TitleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.pink)
    }
}

//
//  ButtonModifier.swift
//  10-Honeymoon
//
//  Created by solgo on 29/11/2022.
//

import SwiftUI

struct ButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.headline)
            .padding()
            .frame(minWidth: 0, maxWidth: .infinity)
            .background(
                Capsule().fill(Color.pink)
            )
            .foregroundColor(.white)
    }
}

//
//  CenterModifier.swift
//  4-Africa
//
//  Created by solgo on 13/11/2022.
//

import SwiftUI

struct CenterModifier: ViewModifier {
    func body(content: Content) -> some View {
        HStack{
            Spacer()
            content
            Spacer()
        }
    }
}


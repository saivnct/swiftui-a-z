//
//  CardTransition.swift
//  10-Honeymoon
//
//  Created by solgo on 29/11/2022.
//

import SwiftUI

extension AnyTransition {
    //this extension defines 2 asymmetric transition effects
    //the main reason why we choose to use asymmetric transition is that we only want to animate the card's transition when it's removed. So when a new card is inserted in the deck, there should be no animation whatsoever
    
    //when the card is thrown away to the right of the screen
    static var trailingBottom: AnyTransition {
        AnyTransition.asymmetric(
            insertion: .identity,
            removal: AnyTransition.move(edge: .trailing).combined(with: .move(edge: .bottom))
        )
    }
    
    //when the card is thrown away to the left of the screen
    static var leadingBottom: AnyTransition {
        AnyTransition.asymmetric(
            insertion: .identity,
            removal: AnyTransition.move(edge: .leading).combined(with: .move(edge: .bottom))
        )
    }
}

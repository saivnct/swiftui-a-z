//
//  ContentView.swift
//  8-LearnByDoing
//
//  Created by giangbb on 21/11/2022.
//

import SwiftUI

struct ContentView: View {
    // MARK: -  PROPERTIES
    var cards: [Card] = cardData
    
    // MARK: -  BODY
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .center, spacing: 20) {
                ForEach(cards) { item in
                    CardView(card: item)
                }
            }//: HSTACK
            .padding(20)
            
        }//: SCROLL
    }
}

// MARK: -  PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

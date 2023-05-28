//
//  AnimalDetailInsetFactView.swift
//  4-Africa
//
//  Created by giangbb on 10/11/2022.
//

import SwiftUI

struct AnimalDetailInsetFactView: View {
    // MARK: -  PROPERTIES
    let animal: Animal
    
    // MARK: -  BODY
    var body: some View {
        GroupBox{
            TabView {
                ForEach(animal.fact, id: \.self) { item in
                    Text(item)
                }
            }//: TAB
            .tabViewStyle(.page)
            .frame(minHeight: 148, idealHeight: 168, maxHeight: 180)
        }//: BOX
    }
}

// MARK: -  PREVIEW
struct AnimalDetailInsetFactView_Previews: PreviewProvider {
    static let animals: [Animal] = Bundle.main.decode("animals.json")
    static var previews: some View {
        AnimalDetailInsetFactView(animal: animals[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}

//
//  InsetGalleryView.swift
//  4-Africa
//
//  Created by giangbb on 09/11/2022.
//

import SwiftUI

struct AnimalDetailInsetGalleryView: View {
    // MARK: -  PROPERTIES
    let animal: Animal
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .center,spacing: 15) {
                ForEach(animal.gallery, id: \.self) { item in   //since the photos dont have ids, we must use their name as id in order to work with foreach
                    Image(item)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                    .cornerRadius(12)
                }
            }//: HSTACK
        }//: SCROLL
    }
}

struct AnimalDetailInsetGalleryView_Previews: PreviewProvider {
    static let animals: [Animal] = Bundle.main.decode("animals.json")
    static var previews: some View {
        AnimalDetailInsetGalleryView(animal: animals[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}

//
//  AnimalDetailHeadingView.swift
//  4-Africa
//
//  Created by giangbb on 09/11/2022.
//

import SwiftUI

struct AnimalDetailHeadingView: View {
    // MARK: -  PROPERTIES
    var headingImage: String
    var headingText: String
    
    // MARK: -  BODY
    var body: some View {
        HStack{
            Image(systemName: headingImage)
                .foregroundColor(.accentColor)
                .imageScale(.large)
            
            Text(headingText)
                .font(.title3)
                .fontWeight(.bold)
        }.padding(.vertical)
    }
}


// MARK: -  PREVIEW
struct AnimalDetailHeadingView_Previews: PreviewProvider {
    static var previews: some View {
        AnimalDetailHeadingView(headingImage: "photo.on.rectangle.angled", headingText: "Widerness in picture")
            .previewLayout(.sizeThatFits)
            .padding()
    }
}

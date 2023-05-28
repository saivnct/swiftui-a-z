//
//  CoverImageView.swift
//  4-Africa
//
//  Created by giangbb on 09/11/2022.
//

import SwiftUI

struct CoverImageView: View {
    // MARK: -  PROPERTIES
    let coverImages : [CoverImage] = Bundle.main.decode("covers.json")
    
    // MARK: -  BODY
    var body: some View {
        TabView {
            ForEach(coverImages) { coverImage in
                Image(coverImage.name)
                    .resizable()
                .scaledToFill()
            }
        }//: TAB
        .tabViewStyle(.page)
        
        
    }
}

// MARK: -  PREVIEW
struct CoverImageView_Previews: PreviewProvider {
    static var previews: some View {
        CoverImageView()
            .previewLayout(.fixed(width: 400, height: 300))
    }
}

//
//  RecipeRaingView.swift
//  9-Avocado
//
//  Created by giangbb on 25/11/2022.
//

import SwiftUI

struct RecipeRaingView: View {
    // MARK: -  PROPERTIES
    var recipe: Recipe
    
    
    // MARK: -  BODY
    var body: some View {
        HStack(alignment: .center, spacing: 5) {
            ForEach(1...recipe.rating, id: \.self) { _ in
                Image(systemName: "star.fill")
                    .font(.body)
                    .foregroundColor(.yellow)
            }
        }
    }
}

// MARK: -  PREVIEW
struct RecipeRaingView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeRaingView(recipe: recipesData[0])
            .previewLayout(.fixed(width: 320, height: 60))
    }
}

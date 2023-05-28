//
//  RecipeCardView.swift
//  9-Avocado
//
//  Created by solgo on 24/11/2022.
//

import SwiftUI

struct RecipeCardView: View {
    // MARK: - PROPERTIES
    var recipe: Recipe
    var hapticImpact = UIImpactFeedbackGenerator(style: .medium)
    @State private var showModal: Bool = false
    
    // MARK: - BODY
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Image(recipe.image)
                .resizable()
                .scaledToFit() // the same with .aspectRatio(contentMode: .fit)
                .overlay (
                    Image(systemName: "bookmark")
                        .font(.title.weight(.light))
                        .foregroundColor(.white)
                        .imageScale(.small)
                        .shadow(color: Color("ColorBlackTransparentLight"),radius: 2, x: 0 , y: 0)
                        .padding(.trailing, 20)
                        .padding(.top, 22)
                    , alignment: .topTrailing
                )
            
            
            VStack(alignment: .leading, spacing: 12) {
                // TITLE
                Text(recipe.title)
                    .font(.system(.title, design: .serif))
                    .fontWeight(.bold)
                    .foregroundColor(Color("ColorGreenMedium"))
                    .lineLimit(1)
                
                // HEADLINE
                Text(recipe.headline)
                    .font(.system(.body, design: .serif))
                    .foregroundColor(.gray)
                    .italic()
                
                // RATES
                RecipeRaingView(recipe: recipe)
                
                // COOKING
                RecipeCookingView(recipe: recipe)
                
            }
            .padding()
            .padding(.bottom, 12)
            
            
        }//: VSTACK
        .background(.white)
        .cornerRadius(12)
        .shadow(color: Color("ColorBlackTransparentLight"), radius: 8, x: 0 , y: 0)
        .onTapGesture {
            hapticImpact.impactOccurred()
            showModal = true
        }
        .sheet(isPresented: $showModal) {
            RecipeDetailView(recipe: recipe)
        }
    }
}


// MARK: - PREVIEW
struct RecipeCardView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeCardView(recipe: recipesData[0])
            .previewLayout(.sizeThatFits)
    }
}

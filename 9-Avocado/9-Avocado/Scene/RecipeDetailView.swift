//
//  RecipeDetailView.swift
//  9-Avocado
//
//  Created by giangbb on 25/11/2022.
//

import SwiftUI

struct RecipeDetailView: View {
    // MARK: -  PROPERTIES
    var recipe: Recipe
    @State private var pulsate: Bool = false
    @Environment(\.presentationMode) var presentationMode
    
    // MARK: -  BODY
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .center, spacing: 0) {
                Image(recipe.image)
                    .resizable()
                .scaledToFit()
                
                Group{
                    //TITLE
                    Text(recipe.title)
                        .font(.system(.largeTitle, design: .serif))
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color("ColorGreenAdaptive"))
                        .padding(.top, 10)
                    
                    //RATING
                    RecipeRaingView(recipe: recipe)
                    
                    //COOKING
                    RecipeCookingView(recipe: recipe)
                    
                    //INGREDIENTS
                    Text("Ingredients")
                        .fontWeight(.bold)
                        .modifier(TitleModifier())
                    
                    VStack(alignment: .leading, spacing: 5) {
                        ForEach(recipe.ingredients, id: \.self) { item in
                            VStack(alignment: .leading, spacing: 5) {
                                Text(item)
                                    .font(.footnote)
                                    .multilineTextAlignment(.leading)
                                Divider()
                            }//: VSTACK
                        }//: LOOP
                    }//: VSTACK
                    
                    //INSTRUCTIONS
                    Text("Instruction")
                        .fontWeight(.bold)
                        .modifier(TitleModifier())
                    
                    ForEach(recipe.instructions, id: \.self) { item in
                        VStack(alignment: .center, spacing: 5) {
                            Image(systemName: "chevron.down.circle")
                                .resizable()
                                .frame(width: 42, height: 42, alignment: .center)
                                .font(.title.weight(.ultraLight))
                                .foregroundColor(Color("ColorGreenAdaptive"))
                            
                            Text(item)
                                .lineLimit(nil)
                                .multilineTextAlignment(.center)
                                .font(.system(.body, design: .serif))
                                .frame(minHeight: 100)
                        }
                    }
                }
                .padding(.horizontal, 24)
                .padding(.vertical, 12)
            }//: VSTACK
        }//: SCROLL
        .edgesIgnoringSafeArea(.top)
        .overlay(
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }, label: {
                Image(systemName: "chevron.down.circle.fill")
                    .font(.title)
                    .foregroundColor(.white)
                    .shadow(radius: 4)
                    .opacity(pulsate ? 1 : 0.6)
                    .scaleEffect(pulsate ? 1.2 : 0.8, anchor: .center)
                    .animation(.easeInOut(duration: 1.5).repeatForever(autoreverses: true), value: pulsate)
                
                
            })
            .padding(.trailing, 20)
            .padding(.top, 24)
            ,
            alignment: .topTrailing
        )
        .onAppear(){
            pulsate.toggle()
        }
        
    }
}

// MARK: -  PREVIEW
struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeDetailView(recipe: recipesData[0])
    }
}

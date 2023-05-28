//
//  ContentView.swift
//  9-Avocado
//
//  Created by solgo on 21/11/2022.
//

import SwiftUI

struct ContentView: View {
    // MARK: - PROPERTIES
    var headers : [Header] = headersData
    var facts : [Fact] = factsData
    var recipes : [Recipe] = recipesData
    
    // MARK: - BODY
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .center, spacing: 20) {
                
                // MARK: - HEADER
                ScrollView(.horizontal,showsIndicators: false){
                    HStack(alignment: .top, spacing: 0) {
                        ForEach(headers) { header in
                            HeaderView(header: header)
                        }//: LOOP
                        
                    }//: HSTACK
                    
                }//: SCROLL
                
                // MARK: - DISHES
                Text("Avocado Dishes")
                    .fontWeight(.bold)
                    .modifier(TitleModifier())
            
                DishesView()
                    .frame(maxWidth: 640)   //add "maxWidth: 640" in or to look greate on ipad devices
                
                // MARK: - AVOCADO FACTS
                Text("Avocado Facts")
                    .fontWeight(.bold)
                    .modifier(TitleModifier())
                
                ScrollView(.horizontal,showsIndicators: false){
                    HStack(alignment: .top, spacing: 60) {
                        ForEach(facts) { fact in
                            FactsView(fact: fact)
                        }//: LOOP
                        
                    }//: HSTACK
                    .padding(.vertical)
                    .padding(.leading, 60)
                    .padding(.trailing, 20)
                    
                }//: SCROLL
                
                // MARK: - RECIPE CARDS
                Text("Avocado Recipes")
                    .fontWeight(.bold)
                    .modifier(TitleModifier())
                
                VStack(alignment: .center, spacing: 20) {
                    ForEach(recipes) { recipe in
                        RecipeCardView(recipe: recipe)
                    }//: LOOP
                }//: VSTACK
                .frame(maxWidth: 640)
                .padding(.horizontal)
                
                
                // MARK: - FOOTER
                VStack(alignment: .center, spacing: 20) {
                    Text("All About Avocados")
                        .fontWeight(.bold)
                        .modifier(TitleModifier())
                    
                    Text("Everything you wanted to know about avocados but were too afraid to ask.")
                        .font(.system(.body, design: .serif))
                        .multilineTextAlignment(.center)
                        .foregroundColor(.gray)
                        .frame(minHeight: 60)
                }//: VSTACK
                .frame(maxWidth: 640)
                .padding()
                .padding(.bottom, 85)
            }//: VSTACK
        }//: SCROLL
        .edgesIgnoringSafeArea(.all)
        .padding(0)
    }
}

struct TitleModifier: ViewModifier{
    func body(content: Content) -> some View {
        content
            .font(.system(.title, design: .serif))
            .foregroundColor(Color("ColorGreenAdaptive"))
            .padding(8)
    }
}

// MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

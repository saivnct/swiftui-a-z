//
//  OnboardingView.swift
//  3-Fruit
//
//  Created by solgo on 07/11/2022.
//

import SwiftUI

struct OnboardingView: View {
    // MARK: - PROPERTIES
    let fruits: [Fruit] = fruitsData
    
    // MARK: - BODY
    var body: some View {
        
        TabView{
            
            ForEach(fruits) { fruit in
                FruitCardView(fruit: fruit)
            }//: LOOP
            
        }//: TAB
        .tabViewStyle(PageTabViewStyle())
        .padding(.vertical, 20)
    }
}

// MARK: - PREVIEW
struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}

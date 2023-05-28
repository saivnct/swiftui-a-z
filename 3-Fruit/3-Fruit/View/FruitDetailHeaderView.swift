//
//  FruitDetailHeaderView.swift
//  3-Fruit
//
//  Created by solgo on 07/11/2022.
//

import SwiftUI

struct FruitDetailHeaderView: View {
    var fruit: Fruit
    
    @State private var isAnimatingImg: Bool = false
    
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: fruit.gradientColors), startPoint: .topLeading, endPoint: .bottomTrailing)
            
            Image(fruit.image)
                .resizable()
                .scaledToFit()
                .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 8, x: 6, y: 8)
                .padding(.vertical, 20)
                .scaleEffect(isAnimatingImg ? 1.0 : 0.6)
                .animation(.easeOut(duration: 0.5), value: isAnimatingImg)
        }//: ZSTACK
        .frame(height: 440)
        .onAppear() {
            isAnimatingImg = true
        }
    }
}

struct FruitDetailHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        FruitDetailHeaderView(fruit: fruitsData[0])
            .previewLayout(.fixed(width: 375, height: 440))
    }
}

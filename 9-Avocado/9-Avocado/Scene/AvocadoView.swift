//
//  AvocadoView.swift
//  9-Avocado
//
//  Created by solgo on 21/11/2022.
//

import SwiftUI

struct AvocadoView: View {
    // MARK: - PROPERTIES
    @State private var pulsateAnimation: Bool = false
    
    // MARK: - BODY
    var body: some View {
        VStack {
            Spacer()
            Image("avocado")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 240, height: 240, alignment: .center)
                .shadow(color: Color("ColorBlackTransparentDark"),radius: 12, x: 0, y: 8)
                .scaleEffect(pulsateAnimation ?  1 : 0.9)
                .opacity(pulsateAnimation ? 1 : 0.9)
                .animation(.easeInOut(duration: 1.5).repeatForever(autoreverses: true), value: pulsateAnimation)
            
            VStack {
                Text("Avocados".uppercased())
                    .font(.system(size: 42, weight: .bold, design: .serif))
                    .foregroundColor(.white)
                    .padding()
                .shadow(color: Color("ColorBlackTransparentDark"),radius: 4, x: 0, y: 4)
                
                Text("""
Creamy, green, and full of nutrients!
Avocado is a powerhouse ingredient at any meal. Enjoy these handpicked avocado recipes for breakfast, lunch, dinner & more!
""")
                .lineLimit(nil)
                .font(.system(.headline, design: .serif))
                .foregroundColor(Color("ColorGreenLight"))
                .multilineTextAlignment(.center)
                .lineSpacing(8)
                .frame(maxWidth: 648, minHeight: 120) //maxWidth: 648 -> we want our text to look food in Ipad as well ; minHeight: 128 -> sometimes there's problem dealing with multiline string in SwiftUI
                
            }//: VSTACK
            .padding()
            
            Spacer()
            
        }//: VSTACK
        .background(
            Image("background")
                .resizable()
                .aspectRatio(contentMode: .fill)
        )
        .edgesIgnoringSafeArea(.all)
        .onAppear(){
            pulsateAnimation.toggle()
        }
        
        
    }
}

// MARK: - PREVIEW
struct AvocadoView_Previews: PreviewProvider {
    static var previews: some View {
        AvocadoView()
//            .environment(\.colorScheme, .dark)
    }
}

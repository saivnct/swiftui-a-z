//
//  ContentView.swift
//  5-TouchDown
//
//  Created by solgo on 13/11/2022.
//

import SwiftUI

struct ContentView: View {
    // MARK: - PROPERTIES
    let keyWindow = UIApplication.shared.connectedScenes
        .filter({$0.activationState == .foregroundActive})
        .compactMap({$0 as? UIWindowScene})
        .first?.windows
        .filter({$0.isKeyWindow}).first
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                NavigationBarView()
                    .padding(.horizontal, 15)
                    .padding(.bottom)
                    .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
//                    .padding(.top,keyWindow?.safeAreaInsets.top)
                .background(Color.white)
                .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 5)
                
                Spacer()
                
                FooterView()
                    .padding(.horizontal)
            }//: VSTACK
            .background(colorBackground.ignoresSafeArea(.all, edges: .all))
            
        }//: ZSTACK
        .ignoresSafeArea(.all, edges: .top)
    }
}


// MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

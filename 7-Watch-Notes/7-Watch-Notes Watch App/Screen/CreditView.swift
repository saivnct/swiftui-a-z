//
//  CreditView.swift
//  7-Watch-Notes Watch App
//
//  Created by solgo on 20/11/2022.
//

import SwiftUI

struct CreditView: View {
    // MARK: - PROPERTIES
    @State private var randomNumber: Int = Int.random(in: 1..<4) //from 1 to 3
    
    
    private var ramdomImage : String {
        return "developer-no\(randomNumber)"
    }
    // MARK: - BODY
    var body: some View {
        VStack(spacing: 3) {
            //PROFILE IMAGE
            Image(ramdomImage)
                .resizable()
                .scaledToFit()
                .layoutPriority(1)
            
            //HEADER
            HeaderView(title: "Credit")
            
            //CONTENT
            Text("Giangbb")
                .foregroundColor(.primary)
                .fontWeight(.bold)
            
            Text("Developer")
                .font(.footnote)
                .foregroundColor(.secondary)
                .fontWeight(.light)
            
        }//: VSTACK
        .padding()
    }
}

// MARK: - PREVIEW
struct CreditView_Previews: PreviewProvider {
    static var previews: some View {
        CreditView()
    }
}

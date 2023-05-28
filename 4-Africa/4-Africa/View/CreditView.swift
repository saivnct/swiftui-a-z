//
//  CreditView.swift
//  4-Africa
//
//  Created by solgo on 13/11/2022.
//

import SwiftUI

struct CreditView: View {
    var body: some View {
        VStack {
            Image("compass")
                .resizable()
                .scaledToFit()
                .frame(width: 128, height: 128)
            
            Text("""
            Copyright @ Giang Bui
            All right reserved
            ♥️ giangtpu@gmail.com ♥️
            """)
                    .font(.footnote)
                .multilineTextAlignment(.center)
        }//: VSTACK
        .padding()
        .opacity(0.4)
    }
}

struct CreditView_Previews: PreviewProvider {
    static var previews: some View {
        CreditView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}

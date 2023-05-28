//
//  HeaderView.swift
//  7-Watch-Notes Watch App
//
//  Created by solgo on 20/11/2022.
//

import SwiftUI

struct HeaderView: View {
    // MARK: - PROPERTIES
    var title: String?
    
    // MARK: - BODY
    var body: some View {
        VStack {
            //TITLE
            if let title = title {
                Text(title.uppercased())
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.accentColor)
            }
            
            //SEPERATOR
            HStack{
                Capsule()
                    .frame(height: 1)
                
                Image(systemName: "note.text")
                
                Capsule()
                    .frame(height: 1)
            }//: HSTACK
            .foregroundColor(.accentColor)
            
        }//: VSTACK
    }
}


// MARK: - PREVIEW
struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HeaderView(title: "Credits")
            
            HeaderView()
        }
    }
}

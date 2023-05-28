//
//  GuideComponent.swift
//  10-Honeymoon
//
//  Created by giangbb on 23/11/2022.
//

import SwiftUI

struct GuideComponent: View {
    // MARK: -  PROPERTIES
    var title: String
    var subtitle: String
    var description: String
    var icon: String
    
    // MARK: -  BODY
    var body: some View {
        HStackLayout(alignment: .center, spacing: 20) {
            Image(systemName: icon)
                .font(.largeTitle)
                .foregroundColor(.pink)
            
            VStack(alignment: .leading, spacing: 4) {
                HStack {
                    Text(title.uppercased())
                        .font(.title)
                        .fontWeight(.heavy)
                    
                    Spacer()
                    
                    Text(subtitle.uppercased())
                        .font(.footnote)
                        .fontWeight(.heavy)
                        .foregroundColor(.pink)
                }//: HSTACK
                
                Divider().padding(.bottom, 4)
                
                Text(description)
                    .font(.footnote)
                    .foregroundColor(.secondary)
                    .fixedSize(horizontal: false, vertical: true) //make sure the heigh of text will be expanded even if the current view is smaller than the dimension of this text
            
                
            }//: VSTACK
            
        }//: HSTACK
    }
}


// MARK: -  PREVIEW
struct GuideComponent_Previews: PreviewProvider {
    static var previews: some View {
        GuideComponent(title: "title", subtitle: "Swipe right", description: "This is a placeholder sentence. This is a placeholder sentence. This is a placeholder sentence.", icon: "heart.circle")
            .previewLayout(.sizeThatFits)
        
    }
}

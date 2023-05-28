//
//  HeaderView.swift
//  9-Avocado
//
//  Created by solgo on 24/11/2022.
//

import SwiftUI

struct HeaderView: View {
    // MARK: - PROPERTIES
    @State private var showHeadline: Bool = false
    var header : Header
    
    var slideInAnimation: Animation {
        Animation.spring(response: 1.5, dampingFraction: 0.5, blendDuration: 0.5)
            .speed(1)
            .delay(0.25)
    }
    
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            Image(header.image)
                .resizable()
                .aspectRatio(contentMode: .fill)    // the same with scaledToFill()
            
            HStack(alignment: .top, spacing: 0) {
                Rectangle()
                    .fill(Color("ColorGreenLight"))
                    .frame(width: 4)
                
                VStack(alignment: .leading, spacing: 9){
                    Text(header.headline)
                        .font(.system(.title, design: .serif))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .shadow(radius: 3)
                    
                    Text(header.subheadline)
                        .font(.footnote)
                        .lineLimit(2)
                        .multilineTextAlignment(.leading)
                        .foregroundColor(.white)
                        .shadow(radius: 3)
                    
                }//: VSTACK
                .padding(.vertical, 0)
                .padding(.horizontal, 20)
                .frame(width: 281, height: 105)
                .background(Color("ColorBlackTransparentLight"))
            }//: HSTACK
            .frame(width: 285, height: 105, alignment: .center)
            .offset(x: -66, y:  showHeadline ? 75 : 220)
            .animation(slideInAnimation, value: showHeadline)
            .onAppear(){
                showHeadline.toggle()
            }
            
        }//: ZSTACK
        .frame(width: 480, height: 320, alignment: .center)
        
    }
}

// MARK: - PREVIEW
struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(header: headersData[0])
            .previewLayout(.sizeThatFits)
    }
}

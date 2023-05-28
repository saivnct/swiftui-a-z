//
//  SourceLinkView.swift
//  3-Fruit
//
//  Created by solgo on 07/11/2022.
//

import SwiftUI

struct FruitDetailSourceLinkView: View {
    var body: some View {
        //Group Box give us a light gray background color that fully adaptive in dark/light mode
        //Group Box behaves as a vertical stack container
        GroupBox(){
            HStack{
                Text("Content source")
                Spacer()
                Link("Wikipedia", destination: URL(string: "https://wikipedia.com")!)
                Image(systemName: "arrow.up.right.square")
            }
            .font(.footnote)
        }//:GROUP BOX
        
        
    }
}

struct FruitDetailSourceLinkView_Previews: PreviewProvider {
    static var previews: some View {
        FruitDetailSourceLinkView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}

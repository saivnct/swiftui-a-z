//
//  BackgroundImageView.swift
//  6-Devote
//
//  Created by giangbb on 16/11/2022.
//

import SwiftUI

struct BackgroundImageView: View {
    var body: some View {
        Image("rocket")
            .antialiased(true)  //keep the edges of image smooth when it is scaled up or down
            .resizable()
            .scaledToFill() //make sure img will scale to fit its parent view while maintaining it aspect ratio
            .ignoresSafeArea(.all)
    }
}

struct BackgroundImageView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundImageView()
    }
}

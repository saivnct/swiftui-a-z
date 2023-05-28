//
//  ControlImgView.swift
//  Pinch
//
//  Created by giangbb on 07/11/2022.
//

import SwiftUI

struct ControlImgView: View {
    let icon: String
    var action: (() -> Void)? = nil
    
    var body: some View {
        Button{
            if let action = action {
                action()
            }
        }label: {
            Image(systemName: icon)
                .font(.system(size: 36))
        }
    }
}

struct ControlImgView_Previews: PreviewProvider {
    static var previews: some View {
        ControlImgView(icon: "minus.magnifyingglass")
            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}

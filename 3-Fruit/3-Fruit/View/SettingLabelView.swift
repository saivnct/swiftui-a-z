//
//  SettingLabelView.swift
//  3-Fruit
//
//  Created by giangbb on 08/11/2022.
//

import SwiftUI

struct SettingLabelView: View {
    // MARK: -  PROPERTIES
    var labelTxt: String
    var labelImg: String
    
    // MARK: -  BODY
    var body: some View {
        HStack {
            Text(labelTxt.uppercased())
                .fontWeight(.bold)
            Spacer()
            Image(systemName: labelImg)
        }
    }
}

// MARK: -  PREVIEW
struct SettingLabelView_Previews: PreviewProvider {
    static var previews: some View {
        SettingLabelView(labelTxt: "fructus", labelImg: "info.circle")
            .previewLayout(.sizeThatFits)
            .padding()
    }
}

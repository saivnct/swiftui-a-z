//
//  RipeningStagesView.swift
//  9-Avocado
//
//  Created by solgo on 21/11/2022.
//

import SwiftUI

struct RipeningStagesView: View {
    // MARK: -  PROPERTIES
    var ripeningStages : [Ripening] = ripeningData
    
    // MARK: -  BODY
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            VStack{
                Spacer()
                
                HStack(alignment: .center, spacing: 25) {
                    ForEach(ripeningStages) { item in
                        RipeningView(ripening: item)
                    }
                }//: HSTACK
                .padding(.vertical)
                .padding(.horizontal,25)
                
                Spacer()
            }//: VSTACK
        }
    }
}


// MARK: -  PREVIEW
struct RipeningStagesView_Previews: PreviewProvider {
    static var previews: some View {
        RipeningStagesView()
    }
}

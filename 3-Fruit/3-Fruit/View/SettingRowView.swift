//
//  SettingRowView.swift
//  3-Fruit
//
//  Created by giangbb on 08/11/2022.
//

import SwiftUI

struct SettingRowView: View {
    // MARK: -  PROPERTIES
    var name: String
    var content: String? = nil
    var linkLabel: String? = nil
    var linkDestination: String? = nil
    
    // MARK: -  BODY
    var body: some View {
        VStack {
            Divider()
                .padding(.vertical, 4)
            
            HStack{
                
                Text(name).foregroundColor(.gray)
                Spacer()
                if let content = content {
                    Text(content)
                } else if let linkLabel = linkLabel, let linkDestination = linkDestination{
                    Link(linkLabel, destination: URL(string: linkDestination)!)
                    Image(systemName: "arrow.up.right.square")
                        .foregroundColor(.pink)
                }else{
                    EmptyView()
                }
            }//: HSTACK
        }//: VSTACK
    }
}

// MARK: -  MULTIPLE PREVIEW
struct SettingRowView_Previews: PreviewProvider {
    static var previews: some View {
        SettingRowView(name: "Developer", content: "Giangbb")
            .previewLayout(.fixed(width: 375, height: 60))
            .padding()
        
        SettingRowView(name: "Wiki", linkLabel: "Wikipedia", linkDestination: "https://wikipedia.com")
            .previewLayout(.fixed(width: 375, height: 60))
            .padding()
    }
}

//
//  SettingView.swift
//  3-Fruit
//
//  Created by giangbb on 08/11/2022.
//

import SwiftUI

struct SettingView: View {
    // MARK: -  PROPERTIES
    @Environment(\.presentationMode) var presentationMode
    
    @AppStorage("isOnBoarding") var isOnBoarding: Bool = false
    
    // MARK: -  BODY
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 20) {
                    // MARK: -  SECTION 1
                    GroupBox(label: SettingLabelView(labelTxt: "fructus", labelImg: "info.circle")) {
                        Divider()
                            .padding(.vertical, 4)
                        HStack(alignment: .center, spacing: 10) {
                            Image("logo")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 80, height: 80)
                                .cornerRadius(9)
                            
                            Text("Most fruits re naturally low in fat, sodium and calories. None have cholesterol. Fruit are sources of many essential nutrients, including potassium, dietary fiber, vitamins, and much more.")
                                .font(.footnote)
                        }
                    }//: GROUPBOX
                    
                    // MARK: -  SECTION 2
                    GroupBox(label: SettingLabelView(labelTxt: "Customization", labelImg: "paintbrush")) {
                        Divider()
                            .padding(.vertical,4)
                        
                        Text("Restart the application by toggle the switch in this box.")
                            .padding(.vertical, 8)
                            .frame(minHeight: 60)
                            .layoutPriority(1)  //by default, layoutPriority = 0 -> sometime the long text is truncated by the rendering system (because rendering system in some cases cannot calculate the right size of long text) => therefore, we set priority to higher priority (1) to display the whole text
                            .font(.footnote)
                            .multilineTextAlignment(.leading)
                        
                        Toggle(isOn: $isOnBoarding) {
                            if isOnBoarding {
                                Text("Restarted".uppercased())
                                    .fontWeight(.bold)
                                    .foregroundColor(.green)
                            } else {
                                Text("Restart".uppercased())
                                    .fontWeight(.bold)
                                    .foregroundColor(.secondary)
                            }
                        }
                        .padding()
                        .background(
                            Color(.tertiarySystemBackground)
                                .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                        )
                    }
                    
                    // MARK: -  SECTION 3
                    GroupBox(label: SettingLabelView(labelTxt: "Application", labelImg: "apps.iphone")) {
                        SettingRowView(name: "Developer", content: "Giangbb")
                        SettingRowView(name: "Designer", content: "Giangbb")
                        SettingRowView(name: "Compatibility", content: "iOS 14")
                        SettingRowView(name: "Website", linkLabel: "Giang Bui", linkDestination: "https://wikipedia.com")
                        SettingRowView(name: "SwiftUI", content: "2.0")
                        SettingRowView(name: "Version", content: "1.1.0")
                    }//: GROUPBOX
                    
                }//: VSTACK
                .navigationBarTitle(Text("Setting"))
                .navigationBarTitleDisplayMode(.large)
                .navigationBarItems(
                    trailing: Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Image(systemName: "xmark")
                    })
                )
                .padding()
            }//: SCROLL
        }//: NAVIGATION
    }
}

// MARK: -  PREVIEW
struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
            .preferredColorScheme(.dark)
    }
}

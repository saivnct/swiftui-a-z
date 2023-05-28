//
//  SettingsView.swift
//  9-Avocado
//
//  Created by solgo on 21/11/2022.
//

import SwiftUI

struct SettingsView: View {
    // MARK: - PROPERTIES
    @State private var enableNotification: Bool = true
    @State private var backgroundRefresh: Bool = false
    
    // MARK: - BODY
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            // MARK: - HEADER
            VStack(alignment: .center, spacing: 5) {
                Image("avocado")
                    .resizable()
                    .scaledToFit()
                    .padding(.top)
                    .frame(width: 100, height: 100, alignment: .center)
                    .shadow(color: Color("ColorBlackTransparentLight"), radius: 8, x: 0, y: 4)
                
                Text("Avocados".uppercased())
                    .font(.system(.title, design: .serif))
                    .fontWeight(.bold)
                .foregroundColor(Color("ColorGreenAdaptive"))
            }//: VSTACK
            .padding()
            
            Form{
                // MARK: - SECTION #1
                Section(header: Text("General Settings")) {
                    Toggle(isOn: $enableNotification) {
                        Text("Enable notification")
                    }
                    
                    Toggle(isOn: $backgroundRefresh) {
                        Text("Background refresh")
                    }
                }//: SECTION
                
                // MARK: - SECTION #2
                Section(header: Text("Application")) {
                    if enableNotification {
                        HStack{
                            Text("Product")
                                .foregroundColor(.gray)
                            
                            Spacer()
                            
                            Text("Avocado Recipes")
                        }
                        
                        HStack{
                            Text("Compatibility")
                                .foregroundColor(.gray)
                            
                            Spacer()
                            
                            Text("iphone & ipad")
                        }
                        
                        HStack{
                            Text("Developer")
                                .foregroundColor(.gray)
                            
                            Spacer()
                            
                            Text("Giangbb")
                        }
                        
                        HStack{
                            Text("Designer")
                                .foregroundColor(.gray)
                            
                            Spacer()
                            
                            Text("Giangtpu")
                        }
                        
                        HStack{
                            Text("Website")
                                .foregroundColor(.gray)
                            
                            Spacer()
                            
                            Text("giangbb.com")
                        }
                        
                        HStack{
                            Text("Version")
                                .foregroundColor(.gray)
                            
                            Spacer()
                            
                            Text("1.0.0")
                        }
                    } else {
                        HStack{
                            Text("Personal message")
                                .foregroundColor(.gray)
                            
                            Spacer()
                            
                            Text("👍 Happy coding!")
                        }
                    }
                    
                    
                }//: SECTION
                 
            }//: FORM
            
        }//: VSTACK
        .frame(maxWidth: 640)
        
    }
}

// MARK: - PREVIEW
struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}

//
//  SettingView.swift
//  7-Watch-Notes Watch App
//
//  Created by solgo on 20/11/2022.
//

import SwiftUI

struct SettingView: View {
    // MARK: - PROPERTIES
    @AppStorage("lineCount") var lineCount: Int = 1
    @State private var value : Double = 1.0
    
    // MARK: - FUNCTION
    func update() {
        lineCount = Int(value)
    }
    
    // MARK: - BODY
    var body: some View {
        VStack(spacing: 8){
            //HEADER
            HeaderView(title: "Settings")
            
            //ACTUAL LINE COUNT
            Text("Lines \(lineCount)".uppercased())
                .fontWeight(.bold)
            
            //SLIDER
            Slider(value: Binding(get: {
                self.value
            }, set: { newValue in
                self.value = newValue
                self.update()
            }), in: 1...4, step: 1)
                .accentColor(.accentColor)
            
        }//: VSTACK
        .onAppear(){
            value = Double(lineCount)
        }
    }
}


// MARK: - PREVIEW
struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}

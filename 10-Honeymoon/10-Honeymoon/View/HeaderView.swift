//
//  HeaderView.swift
//  10-Honeymoon
//
//  Created by giangbb on 23/11/2022.
//

import SwiftUI

struct HeaderView: View {
    // MARK: - PROPERTIES
    @Binding var showGuideView: Bool
    @Binding var showInfoView: Bool
    let haptic = UINotificationFeedbackGenerator()
    
    // MARK: - BODY
    var body: some View {
        HStack {
            Button {
                playSound(sound: "sound-click", type: "mp3")
                haptic.notificationOccurred(.success)
                showInfoView.toggle()
            } label: {
                Image(systemName: "info.circle")
                    .font(.system(size: 24, weight: .regular))
            }//: BUTTON
            .accentColor(Color.primary)
            .sheet(isPresented: $showInfoView) {
                InfoView()
            }
            
            
            Spacer()
            
            
            Image("logo-honeymoon-pink")
                .resizable()
                .scaledToFit()
                .frame(height: 28)
            
            
            Spacer()
            
            
            Button {
                playSound(sound: "sound-click", type: "mp3")
                haptic.notificationOccurred(.success)
                showGuideView.toggle()
            } label: {
                Image(systemName: "questionmark.circle")
                    .font(.system(size: 24, weight: .regular))
            }//: BUTTON
            .accentColor(Color.primary)
            .sheet(isPresented: $showGuideView) {
                GuideView()
            }

        }//HSTACK
        .padding()
    }
}

// MARK: - PREVIEW
struct HeaderView_Previews: PreviewProvider {
    @State static var showGuideView : Bool = false
    @State static var showInfoView : Bool = false
    
    static var previews: some View {
        HeaderView(showGuideView: $showGuideView, showInfoView: $showInfoView)
            .previewLayout(.fixed(width: 375, height: 80))
    }
}

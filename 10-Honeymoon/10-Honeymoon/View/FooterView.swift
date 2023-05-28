//
//  FooterView.swift
//  10-Honeymoon
//
//  Created by giangbb on 23/11/2022.
//

import SwiftUI

struct FooterView: View {
    // MARK: - PROPERTIES
    //@Binding property wrapper let us declare a value in a view and share this value with another view. When this value changes in one view then it will also change in the other view
    @Binding var showBookingAlert: Bool //this variable will be shared between FooterView & ContentView
    
    let haptic = UINotificationFeedbackGenerator()
    
    // MARK: - BODY
    var body: some View {
        HStack {
            Image(systemName: "xmark.circle")
                .font(.system(size: 42, weight: .light))

            Spacer()
            
            Button {
                playSound(sound: "sound-click", type: "mp3")
                haptic.notificationOccurred(.success)
                showBookingAlert.toggle()
            } label: {
                Text("Book Destination".uppercased())
                    .font(.system(.subheadline, design: .rounded))
                    .fontWeight(.heavy)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 12)
                    .accentColor(.pink)
                    .background(
                        Capsule().stroke(Color.pink, lineWidth: 2)
                    )
            }

            
            Spacer()
            
            Image(systemName: "heart.circle")
                .font(.system(size: 42, weight: .light))
        }
        .padding()
        
    }
}

// MARK: - PREVIEW
struct FooterView_Previews: PreviewProvider {
    @State static var showAlert: Bool = false
    static var previews: some View {
        FooterView(showBookingAlert: $showAlert)
            .previewLayout(.fixed(width: 375, height: 80))
    }
}

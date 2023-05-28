//
//  CardView.swift
//  8-LearnByDoing
//
//  Created by giangbb on 21/11/2022.
//

import SwiftUI

struct CardView: View {
    // MARK: -  PROPERTIES
    let card: Card
    
    @State private var fadeIn: Bool = false
    @State private var moveDownward: Bool = false
    @State private var moveUpward: Bool = false
    @State private var showAlert: Bool = false
    
    var hapticImpact = UIImpactFeedbackGenerator(style: .medium)
    
    // MARK: -  BODY
    var body: some View {
        ZStack {
            Image(card.imageName)
                .opacity(fadeIn ? 1.0 : 0.0)
                .animation(.linear(duration: 1.2), value: fadeIn)
            
            VStack{
                Text(card.title)
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                
                Text(card.headline)
                    .fontWeight(.light)
                    .foregroundColor(Color.white)
                    .italic()
            }//: VSTACK
            .offset(y: moveDownward ? -218 : -300)
            .animation(.linear(duration: 0.8), value: moveDownward)
            
            Button {
                playSound(sound: "sound-chime", type: "mp3")
                hapticImpact.impactOccurred()
                showAlert.toggle()
            } label: {
                HStack {
                    Text(card.callToAction.uppercased())
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                    .accentColor(.white)
                    
                    Image(systemName: "arrow.right.circle")
                        .font(Font.title.weight(.medium))
                        .accentColor(.white)
                }//: HSTACK
                .padding(.vertical)
                .padding(.horizontal, 24)
                .background(LinearGradient(gradient: Gradient(colors: card.gradientColors), startPoint: .leading, endPoint: .trailing))
                .clipShape(Capsule())
                .shadow(color: Color("ColorShadow"), radius: 6, x: 0, y: 3)
            }//: BUTTON
            .offset(y: moveUpward ? 210 : 300)
            .animation(.linear(duration: 0.8), value: moveUpward)

        }//: ZSTACK
        .frame(width: 355, height: 545)
        .background(LinearGradient(gradient: Gradient(colors: card.gradientColors), startPoint: .top, endPoint: .bottom))
        .cornerRadius(16)
        .shadow(radius: 8)
        .onAppear(){
            fadeIn.toggle()
            moveDownward.toggle()
            moveUpward.toggle()   //0.8
        }
        .alert(isPresented: $showAlert) {
            Alert(title: Text(card.title), message: Text(card.message), dismissButton: .default(Text("OK")))
            
        }
    }
}

// MARK: -  PREVIEW
struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: cardData[0])
            .previewLayout(.sizeThatFits)
    }
}

//
//  ContentView.swift
//  10-Honeymoon
//
//  Created by giangbb on 23/11/2022.
//

import SwiftUI

struct ContentView: View {
    // MARK: - PROPERTIES
    @State private var showBookingAlert: Bool = false
    @State private var showGuideView: Bool = false
    @State private var showInfoView: Bool = false
    
    
    @GestureState private var dragState = DragState.inactive
    private var dragAreaThreshold: CGFloat = 65.0
    @State private var lastCardIndex: Int = 1
    @State private var cardRemovalTransition = AnyTransition.trailingBottom
    
    
    
    @State var cardViews: [CardView] = {
        var views = [CardView]()
        for index in 0..<2 {
            views.append(CardView(destination: honeymoonData[index]))
        }
        return views
    }()
    
    private func moveCard() {
        cardViews.removeFirst()
        
        lastCardIndex += 1
        
        cardViews.append(CardView(destination: honeymoonData[lastCardIndex % honeymoonData.count]))
    }
    
    private func isTopCard(cardView: CardView) -> Bool {
        guard let index = cardViews.firstIndex(where: { $0.id == cardView.id}) else {
            return false
        }
        
        return index == 0
    }
    
    
    // MARK: - DRAG STATES
    enum DragState {
        case inactive
        case pressing
        case dragging(translation: CGSize)
        
        var translation: CGSize{
            switch self {
            case .inactive, .pressing:
                return .zero
            case .dragging(let translation):
                return translation
            }
        }
        
        var isDragging: Bool {
            switch self {
            case .dragging:
                 return true
            case .inactive, .pressing:
                return false
            }
        }
        
        var isPressing: Bool{
            switch self {
            case .pressing, .dragging:
                 return true
            case .inactive:
                return false
            }
        }
    }
    
    // MARK: - BODY
    var body: some View {
        VStack {
            // MARK: - HEADER
            HeaderView(showGuideView: $showGuideView, showInfoView: $showInfoView)
                .opacity(dragState.isDragging ? 0.0 : 1.0)
                .animation(.default, value: dragState.isDragging)
            
            Spacer()
            
            // MARK: - CARDS
            ZStack{
                //the 'zIndex' modifier indicates the order of the views in a ZStack -> view with higher value of index is placed on top of others
                ForEach(cardViews) { cardView in
                    cardView
                        .zIndex(self.isTopCard(cardView: cardView) ? 1 : 0)
                        .overlay(
                            ZStack{
                                Image(systemName: "x.circle")
                                    .modifier(SymbolModifier())
                                    .opacity(dragState.translation.width < -dragAreaThreshold && isTopCard(cardView: cardView) ? 1.0 : 0.0)
                                
                                Image(systemName: "heart.circle")
                                    .modifier(SymbolModifier())
                                    .opacity(dragState.translation.width > dragAreaThreshold && isTopCard(cardView: cardView) ? 1.0 : 0.0)
                            }//: ZSTACK
                        )
                        .offset(
                            x: self.isTopCard(cardView: cardView) ? dragState.translation.width : 0,
                            y: self.isTopCard(cardView: cardView) ? dragState.translation.height : 0
                        )
                        .scaleEffect(
                            self.isTopCard(cardView: cardView) && dragState.isDragging ? 0.85 : 1.0)
                        .rotationEffect(
                            self.isTopCard(cardView: cardView) ? Angle(degrees: Double(dragState.translation.width / 12)) : Angle(degrees: 0)
                        )
                        .animation(.interpolatingSpring(stiffness: 120, damping: 120), value: dragState.isDragging)
                        .gesture(
                            LongPressGesture(minimumDuration: 0.01)
                                .sequenced(before: DragGesture())
                                .updating(self.$dragState, body: {value, state, transaction in
                                    switch value {
                                    case.first(true):
                                        state = .pressing
                                    case .second(true, let drag):
                                        state = .dragging(translation: drag?.translation ?? .zero)
                                    default:
                                        break
                                    }
                                })
                                .onChanged({ value in
                                    guard case .second(true, let drag?) = value else{
                                        return
                                    }
                                    
                                    if drag.translation.width < -dragAreaThreshold {
                                        cardRemovalTransition = .leadingBottom
                                    }
                                    
                                    if drag.translation.width > dragAreaThreshold {
                                        cardRemovalTransition = .trailingBottom
                                    }
                                    
                                })
                                .onEnded({ value in
                                    guard case .second(true, let drag?) = value else{
                                        return
                                    }
                                    
                                    if drag.translation.width < -dragAreaThreshold || drag.translation.width > dragAreaThreshold {
                                        playSound(sound: "sound-rise", type: "mp3")
                                        moveCard()
                                    }
                                })
                        )
                        .transition(cardRemovalTransition)
                }
            }//: ZSTACK
            .padding(.horizontal)
            
            Spacer()
            
            
            // MARK: - FOOTER
            FooterView(showBookingAlert: $showBookingAlert)
                .opacity(dragState.isDragging ? 0.0 : 1.0)
                .animation(.default, value: dragState.isDragging)
            
        }//: VSTACK
        .alert(isPresented: $showBookingAlert) {
            Alert(title: Text("SUCCESS"), message: Text("Wishing a lovely and most preciousof the times together for the amazing couple"), dismissButton: .default(Text("Happy honeymoon")))
        }
        
    }
}


// MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

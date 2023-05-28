//
//  GalleryView.swift
//  4-Africa
//
//  Created by giangbb on 08/11/2022.
//

import SwiftUI

struct GalleryView: View {
    // MARK: - PROPERTIES
    @State private var selectedAnimal : String = "lion"
    
    private let animals : [Animal] = Bundle.main.decode("animals.json")
    private let haptics = UIImpactFeedbackGenerator(style: .medium)
    
    //SIMPLE GRID DEFINITION
    //let gridLayout: [GridItem] = [
    //    GridItem(.flexible()),
    //    GridItem(.flexible()),
    //    GridItem(.flexible())
    //]
    
    // EFFICIENT GRID DEFINITION
    //let gridLayout: [GridItem] = Array(repeating: GridItem(.flexible()), count: 3)
    
    //DYNAMIC GRID LAYOUT
    @State private var gridLayout : [GridItem] = [GridItem(.flexible())]
    @State private var gridColumn : Double = 3.0 //the number or grid's column
    
    func gridSwitch() {
        gridLayout = Array(repeating: GridItem(.flexible()), count: Int(gridColumn))
    }
    
    // MARK: - BODY
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            
            VStack(alignment: .center, spacing: 30) {
                // MARK: - IMAGE
                Image(selectedAnimal)
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .overlay(
                        Circle().stroke(Color.white, lineWidth: 8)
                    )
                
                // MARK: - SLIDER
                Slider(value: $gridColumn, in: 2...4, step: 1)
                    .padding(.horizontal)
                    .onChange(of: gridColumn) { value in
                        withAnimation {
                            gridSwitch()
                        }
                    }
                
                
                // MARK: - GRID
                LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                    ForEach(animals) { item in
                        Image(item.image)
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                            .overlay(
                                Circle().stroke(Color.white, lineWidth: 1)
                            )
                            .onTapGesture {
                                selectedAnimal = item.image
                                haptics.impactOccurred()
                            }
                        
                        
                    }//: LOOP
                }//: GRID
                .onAppear{
                    gridSwitch()
                }
            }//: VSTACK
            .padding(.horizontal, 10)
            .padding(.vertical, 15)
        }//: SCROLL
        .frame(maxWidth: .infinity, maxHeight: .infinity)   //expand the scroll view in both vertical and horizon
        .background(MotionAnimationView())
    }
}


// MARK: - PREVIEW
struct GalleryView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryView()
    }
}

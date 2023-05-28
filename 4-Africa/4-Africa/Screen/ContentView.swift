//
//  ContentView.swift
//  4-Africa
//
//  Created by giangbb on 08/11/2022.
//

import SwiftUI

struct ContentView: View {
    // MARK: -  PROPERTIES
    private let animals : [Animal] = Bundle.main.decode("animals.json")
    
    @State private var isGridViewActive: Bool = false
    
    @State private var gridLayout : [GridItem] = [GridItem(.flexible())]
    @State private var gridColumn : Int = 1 //the number or grid's column
    @State private var gridToolBarIcon : String = "square.grid.2x2"
    
    private let haptics = UIImpactFeedbackGenerator(style: .medium)
    
    func gridSwitch() {
        withAnimation {
            gridColumn = gridColumn % 3 + 1
            gridLayout = Array(repeating: GridItem(.flexible()), count: Int(gridColumn))
            switch gridColumn {
            case 1:
                gridToolBarIcon = "square.grid.2x2"
            case 2:
                gridToolBarIcon = "square.grid.3x2"
            case 3:
                gridToolBarIcon = "rectangle.grid.1x2"
            default:
                gridToolBarIcon = "square.grid.2x2"
            }
        }
        
    }
    
    var body: some View {
        NavigationView {
            Group{
                if !isGridViewActive {
                    List {
                        CoverImageView()
                            .frame(height: 300)
                            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        
                        
                        ForEach(animals) { animal in
                            NavigationLink(destination: AnimalDetailView(animal: animal)) {
                                AnimalListItemView(animal: animal)
                            }//: NAVIGATION LINK
                        }//: LOOP
        //                .listRowBackground(Color.clear)
                        
                        CreditView()
                            .modifier(CenterModifier())
                    }//: LIST
                    .listStyle(.plain)
                } else {
                    ScrollView(showsIndicators: false) {
                        LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                            ForEach(animals) { animal in
                                NavigationLink(destination: AnimalDetailView(animal: animal)) {
                                    AnimalGridItemView(animal: animal)
                                }//: LINK
                            }//: LOOP
                        }//: GRID
                        .padding()
                    }// SCROLL
                }
            }//: GROUP
            
            
            .navigationTitle("Africa")
            .navigationBarTitleDisplayMode(.large)
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack(spacing: 16){
                        //LIST
                        Button {
                            print("ListView is activated")
                            isGridViewActive = false
                            haptics.impactOccurred()
                        } label: {
                            Image(systemName: "square.fill.text.grid.1x2")
                                .font(.title2)
                                .foregroundColor(isGridViewActive ? .primary : .accentColor)
                        }
                        
                        //GIRD
                        Button {
                            print("GridView is activated")
                            
                            if (isGridViewActive){
                                gridSwitch()
                            }else{
                                isGridViewActive = true
                            }
                            
                            haptics.impactOccurred()
                            
                            
                        } label: {
                            Image(systemName: gridToolBarIcon)
                                .font(.title2)
                                .foregroundColor(isGridViewActive ? .accentColor : .primary)
                        }

                    }//: HSTACK
                }//: BUTONS
            }//: TOOLBAR
        }//: NAVIGATION
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

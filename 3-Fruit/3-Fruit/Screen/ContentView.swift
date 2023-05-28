//
//  ContentView.swift
//  3-Fruit
//
//  Created by solgo on 07/11/2022.
//

import SwiftUI

struct ContentView: View {
    // MARK: - PROPERTIES
    var fruits: [Fruit] = fruitsData
    
    @State private var isShowingSetting: Bool = false
    
    // MARK: - BODY
    var body: some View {
        NavigationView {
            List(fruits) { fruit in
                NavigationLink(destination: FruitDetailView(fruit: fruit)) {
                    FruitRowView(fruit: fruit)
                        .padding(.vertical, 4)
                }
            }
            .listStyle(.plain)
            .navigationTitle("Fruits")
            .navigationBarTitleDisplayMode(.large)
            .navigationBarItems(
                trailing: Button(action: {
                    isShowingSetting = true
                }, label: {
                    Image(systemName: "slider.horizontal.3")
                })//: BUTTON
                .sheet(isPresented: $isShowingSetting, content: {
                    SettingView()
                })
            )
            
            
//            List{
//                ForEach(fruits.shuffled()) { fruit in
//                    NavigationLink(destination: FruitDetailView(fruit: fruit)) {
//                        FruitRowView(fruit: fruit)
//                            .padding(.vertical, 4)
//                    }
//                }
//            }
//            .listStyle(.plain)
//            .navigationTitle("Fruits")
            
            
            
        }//: NAVIGATION
        .navigationViewStyle(.stack)    //force using stack style (if not force to stack -> view on ipad will be stranged)
    }
}

// MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

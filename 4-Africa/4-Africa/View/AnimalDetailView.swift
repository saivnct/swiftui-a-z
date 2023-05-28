//
//  AnimalDetailView.swift
//  4-Africa
//
//  Created by giangbb on 09/11/2022.
//

import SwiftUI

struct AnimalDetailView: View {
    // MARK: -  PROPERTIES
    let animal: Animal
    
    
    // MARK: -  BODY
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            VStack(alignment: .center, spacing: 20){
                //HERO IMAGE
                Image(animal.image)
                    .resizable()
                    .scaledToFit()
        
                
                //TITLE
                Text(animal.name.uppercased())
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.center)
                    .padding(.vertical, 8)
                    .foregroundColor(.primary)
                    .background(
                        Color.accentColor
                            .frame(height: 6)
                            .offset(y: 24)
                    )
                
                
                //HEADLINE
                Text(animal.headline)
                    .font(.headline)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.accentColor)
                    .padding(.horizontal)
                
                
                //GALLERY
                Group{
                    AnimalDetailHeadingView(headingImage: "photo.on.rectangle.angled", headingText: "Widerness in picture")
                    
                    AnimalDetailInsetGalleryView(animal: animal)
                }
                .padding(.horizontal)
                
                
                //FACTS
                Group{
                    AnimalDetailHeadingView(headingImage: "questionmark.circle", headingText: "Did you know?")
                    
                    AnimalDetailInsetFactView(animal: animal)
                }.padding(.horizontal)
                
                
                //DESCRIPTION
                Group{
                    AnimalDetailHeadingView(headingImage: "info.circle", headingText: "All about \(animal.name)")
                    
                    Text(animal.description)
                        .multilineTextAlignment(.leading)
                        .layoutPriority(1)
                        
                }.padding(.horizontal)
                
                
                //MAP
                Group{
                    AnimalDetailHeadingView(headingImage: "map", headingText: "National Parks")
                    
                    AnimalDetailInsetMapView()
                }.padding(.horizontal)
                
                
                //LINK
                Group{
                    AnimalDetailHeadingView(headingImage: "books.vertical", headingText: "Learn More")
                    
                    AnimalDetailIExternalWeblinkView(animal: animal)
                }.padding(.horizontal)
                
            }//: VSTACK
            .navigationTitle("Learn about \(animal.name)")
            .navigationBarTitleDisplayMode(.inline)
        }//: SCROLL
    }
}

// MARK: -  PREVIEW
struct AnimalDetailView_Previews: PreviewProvider {
    static let animals: [Animal] = Bundle.main.decode("animals.json")
    
    static var previews: some View {
        NavigationView {
            AnimalDetailView(animal: animals[0])
        }
        
    }
}

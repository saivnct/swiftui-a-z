//
//  AnimalDetailIExternalWeblinkView.swift
//  4-Africa
//
//  Created by giangbb on 10/11/2022.
//

import SwiftUI

struct AnimalDetailIExternalWeblinkView: View {
    // MARK: -  PROPERTIES
    let animal: Animal
    
    
    // MARK: -  BODY
    var body: some View {
        GroupBox {
            HStack {
                Image(systemName: "globe")
                Text("Wikipedia")
                Spacer()
                
                Group{
                    Link(animal.name, destination: URL(string: animal.link) ?? URL(string: "https://wikipedia.org")!)
                    Image(systemName: "arrow.up.right.square")
                }.foregroundColor(.accentColor)
            }//: HSTACK
        }//: BOX
    }
}


// MARK: -  PREVIEW
struct AnimalDetailIExternalWeblinkView_Previews: PreviewProvider {
    static let animals: [Animal] = Bundle.main.decode("animals.json")
    static var previews: some View {
        AnimalDetailIExternalWeblinkView(animal: animals[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}

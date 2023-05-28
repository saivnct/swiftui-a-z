//
//  AnimalDetailInsetMapView.swift
//  4-Africa
//
//  Created by giangbb on 10/11/2022.
//

import SwiftUI
import MapKit

struct AnimalDetailInsetMapView: View {
    // MARK: -  PROPERTIES
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599), span: MKCoordinateSpan(latitudeDelta: 60.0, longitudeDelta: 60.0))
    
    // MARK: -  BODY
    var body: some View {
        Map(coordinateRegion: $region)
            .overlay(alignment: .topTrailing, content: {
                NavigationLink(destination: MapView()) {
                    HStack{
                        Image(systemName: "mappin.circle")
                            .foregroundColor(.white)
                            .imageScale(.large)
                        
                        Text("Location")
                            .foregroundColor(.accentColor)
                            .fontWeight(.bold)
                    }//: HSTACK
                    .padding(.vertical,10)
                    .padding(.horizontal,40)
                    .background(
                        Color.black
                            .opacity(0.4)
                            .cornerRadius(8)
                    )
                }//: NAVIGATION
                .padding(12)
            })
            .frame(height: 256)
            .cornerRadius(12)
    }
}

struct AnimalDetailInsetMapView_Previews: PreviewProvider {
    static var previews: some View {
        AnimalDetailInsetMapView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}

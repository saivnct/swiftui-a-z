//
//  MapView.swift
//  4-Africa
//
//  Created by giangbb on 08/11/2022.
//

import SwiftUI
import MapKit

struct MapView: View {
    // MARK: -  PROPERTIES
    @State private var region: MKCoordinateRegion = {
        var mapCoordinates = CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599)
        var mapZoomLevel = MKCoordinateSpan(latitudeDelta: 70.0, longitudeDelta: 70.0)
        var mapRegion = MKCoordinateRegion(center: mapCoordinates, span: mapZoomLevel)
        return mapRegion
    }()
    
    
    let locations: [Location] = Bundle.main.decode("locations.json")
    
    // MARK: -  BODY
    var body: some View {
        // MARK: -  No1 BASIC MAP
//        Map(coordinateRegion: $region)
        
        // MARK: -  No2 ADVANED MAP
        Map(coordinateRegion: $region, annotationItems: locations) { location in
            //option 1 - OLD STYLE (always static)
//            MapPin(coordinate: location.locat, tint: .accentColor)
            
            //option 2 - NEW STYLE (always static)
//            MapMarker(coordinate: location.locat, tint: .accentColor)
            
            //option 3 - CUSTOM BASIC ANNOTATION (it could be interactive)
//            MapAnnotation(coordinate: location.locat) {
//                Image("logo")
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width: 32, height: 32, alignment: .center)
//            }
            
            //option 4 - COMPLEX MAP ANNOTATION (it could be interactive)
            MapAnnotation(coordinate: location.locat) {
                MapAnnotationView(location: location)
            }
            
        }//: MAP
        .overlay(
            HStack(alignment: .center, spacing: 12) {
                Image("compass")
                    .resizable()
                    .scaledToFit()
                .frame(width: 48, height: 48, alignment: .center)
                
                VStack(alignment: .leading, spacing: 3) {
                    HStack{
                        Text("Latitude")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.accentColor)
                        
                        Spacer()
                        
                        Text("\(region.center.latitude)")
                            .font(.footnote)
                            .foregroundColor(.white)
                        
                        
                    }//: HSTACK
                    
                    Divider()
                    
                    HStack{
                        Text("Longitude")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.accentColor)
                        
                        Spacer()
                        
                        Text("\(region.center.longitude)")
                            .font(.footnote)
                            .foregroundColor(.white)
                        
                        
                    }//: HSTACK
                    
                }//: VSTACK
            }//: HSTACK
                .padding(.vertical,12)
                .padding(.horizontal,16)
                .background(
                    Color.black
                        .cornerRadius(8)
                        .opacity(0.6)
                )
                .padding()
            
            , alignment: .top
        )
    }
}


// MARK: -  PREVIEW
struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}

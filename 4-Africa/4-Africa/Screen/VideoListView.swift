//
//  VideoListView.swift
//  4-Africa
//
//  Created by giangbb on 08/11/2022.
//

import SwiftUI

struct VideoListView: View {
    // MARK: -  PROPERTIES
    @State var videos: [Video] = Bundle.main.decode("videos.json")
    
    let hapticImpact = UIImpactFeedbackGenerator(style: .medium)
    
    // MARK: -  BODY
    var body: some View {
        NavigationView {
            List {
                ForEach(videos) { video in
                    NavigationLink(destination: VideoPlayerView(video: video)) {
                        VideoListItemView(video: video)
                            .padding(.vertical, 8)
                    }
                }//: LOOP
//                .listRowBackground(Color.clear)
                
            }//: LIST
            .listStyle(.plain)
            .navigationTitle("Video")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        videos.shuffle()
                        hapticImpact.impactOccurred()
                    } label: {
                        Image(systemName: "arrow.2.squarepath")
                    }

                }
            }
        }//: NAVIGATION
    }
    
    
    
}


// MARK: -  PREVIEW
struct VideoListView_Previews: PreviewProvider {
    static var previews: some View {
        VideoListView()
    }
}

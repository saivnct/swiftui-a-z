//
//  VideoPlayerView.swift
//  4-Africa
//
//  Created by giangbb on 10/11/2022.
//

import SwiftUI
import AVKit


struct VideoPlayerView: View {
    var video: Video
    
    var body: some View {
        VStack {
            VideoPlayer(player: playVideo(fileName: video.id, fileFormat: "mp4")) {
//                Text(video.name)
            }
            .overlay (
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 32, height: 32)
                    .padding(.top, 6)
                    .padding(.horizontal, 8)
                , alignment: .topLeading
            )
            
        }//: VSTACK
        .accentColor(.accentColor)
        .navigationTitle(video.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct VideoPlayerView_Previews: PreviewProvider {
    static let videos: [Video] = Bundle.main.decode("videos.json")
    
    static var previews: some View {
        
        NavigationView {
            VideoPlayerView(video: videos[1])
        }
    }
}

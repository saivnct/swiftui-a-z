//
//  ControlPanelView.swift
//  Pinch
//
//  Created by giangbb on 07/11/2022.
//

import SwiftUI

struct ControlPanelView: View {
    var onZoomOut: (() -> Void)? = nil
    var onReset: (() -> Void)?
    var onZoomIn: (() -> Void)?
    
    var body: some View {
        HStack{
            //SCALE DOWN
            ControlImgView(icon: "minus.magnifyingglass") {
                if let onZoomOut = onZoomOut{
                    onZoomOut()
                }
            }
            
            //RESET
            ControlImgView(icon: "arrow.up.left.and.down.right.magnifyingglass") {
                if let onReset = onReset{
                    onReset()
                }
            }
            
            //SCALE UP
            ControlImgView(icon: "plus.magnifyingglass") {
                if let onZoomIn = onZoomIn{
                    onZoomIn()
                }
            }
        }
        .padding(EdgeInsets(top: 12, leading: 20, bottom: 12, trailing: 20))
        .background(.ultraThinMaterial)
        .cornerRadius(12)
    }
    
    
}

struct ControlPanelView_Previews: PreviewProvider {
    static var previews: some View {
        ControlPanelView()
            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}

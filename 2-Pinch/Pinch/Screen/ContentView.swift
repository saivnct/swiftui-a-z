//
//  ContentView.swift
//  Pinch
//
//  Created by giangbb on 07/11/2022.
//

import SwiftUI

struct ContentView: View {
    @State private var isAnimating: Bool = false
    @State private var imageScale: CGFloat = 1
    @State private var imageOffset: CGSize = .zero
    
    let pages: [Page] = pagesData
    @State private var pageIndex: Int = 0
    
    
    func resetImgState(){
        withAnimation(.spring()){
            imageScale = 1
            imageOffset = .zero
        }
    }
    
    var body: some View {
        NavigationView {
            ZStack{
                Color.clear
                
                // MARK: - PAGE IMAGE
                Image(pages[pageIndex].imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(10)
                    .padding()
                    .shadow(color: .black.opacity(0.2), radius: 12, x: 2, y:2)
                    .opacity(isAnimating ? 1 : 0)
                    .animation(.linear(duration: 1), value: isAnimating)
                    .offset(x: imageOffset.width, y: imageOffset.height)
                    .scaleEffect(imageScale)
                //we must add offset modifier first, then scale effect after it
                    // MARK: -  1. TAP GESTURE
                    .onTapGesture(count: 2, perform: {
                        if imageScale == 1{
                            withAnimation(.spring()){
                                imageScale = 5
                            }
                        }else{
                            resetImgState()
                        }
                    })
                    // MARK: -  2. DRAG GESTURE
                    .gesture(
                        DragGesture()
                            .onChanged({ value in
                                withAnimation(.linear(duration: 0.5)){
                                    imageOffset = value.translation
                                }
                            })
                            .onEnded({ value in
                                if imageScale <= 1{
                                    resetImgState()
                                }
                            })
                    )
                    // MARK: -  3. MAGNIFICATION
                    .gesture(
                        MagnificationGesture()
                            .onChanged({ value in
                                withAnimation(.linear(duration: 1)){
                                    if imageScale >= 1 && imageScale <= 5 {
                                        imageScale = value
                                    }
                                    else if imageScale > 5{
                                        imageScale = 5
                                    }
                                }
                            }).onEnded({ value in
                                if imageScale > 5{
                                    withAnimation(.linear(duration: 1)){
                                        imageScale = 5
                                    }
                                }else if imageScale <= 1{
                                    resetImgState()
                                }
                            })
                    )
                
            }//: ZSTACK
            .navigationTitle("Pinch & Zoom")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear(){
                isAnimating = true
            }
            // MARK: -  INFO PANEL
            .overlay(
                InfoPanelView(scale: imageScale, offset: imageOffset)
                    .padding(.horizontal)
                    .padding(.top, 30)
                ,alignment: .top
            )
            // MARK: -  CONTROLS
            .overlay(
                Group{
                    ControlPanelView(onZoomOut: {
                        withAnimation(.spring()) {
                            if imageScale > 1 {
                                imageScale -= 1
                                
                                if imageScale <= 1 {
                                    resetImgState()
                                }
                            }
                        }
                    },onReset: {
                        resetImgState()
                    },onZoomIn: {
                        withAnimation(.spring()) {
                            if imageScale < 5 {
                                imageScale += 1
                                
                                if imageScale > 5 {
                                    imageScale = 5
                                }
                            }
                        }
                    })
                    .opacity(isAnimating ? 1 : 0)
                    .animation(.linear(duration: 1), value: isAnimating)
                }.padding(.bottom, 30)
                ,alignment: .bottom
            )
            // MARK: -  DRAWER
            .overlay(
                DrawerView(pages: pages, onSelectedItem: { id in
                    pageIndex = id
                    resetImgState()
                })
                    .opacity(isAnimating ? 1 : 0)
                    .animation(.linear(duration: 1), value: isAnimating)
                    .padding(.top, UIScreen.main.bounds.height / 12)
                ,alignment: .topTrailing
            )
        } //: NAVIGATION
        .navigationViewStyle(.stack)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

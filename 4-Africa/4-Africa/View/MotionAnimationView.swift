//
//  MotionAnimationView.swift
//  4-Africa
//
//  Created by giangbb on 10/11/2022.
//

import SwiftUI

struct MotionAnimationView: View {
    // MARK: -  PROPERTIES
    @State private var randomCircle = Int.random(in: 12...16)
    @State private var isAnimating = false
    
    // MARK: -  FUNCTION
    //1. RANDOM COORDINATE
    func randomCoordinate(max: CGFloat) -> CGFloat {
        return CGFloat.random(in: 0...max)
    }
    
    //2. RANDOM SIZE
    func randomSize() -> CGFloat {
        return CGFloat(Int.random(in: 10...300))
    }
    
    //3. RANDOM SCALE
    func randomScale() -> CGFloat {
        return CGFloat(Double.random(in: 0.1...2.0))
    }
    
    
    //4. RANDOM SPEED
    func randomSpeed() -> Double {
        return Double.random(in: 0.025...1.0)
    }
    
    //5. RANDOM DELAY
    func randomDelay() -> Double {
        return Double.random(in: 0...2)
    }
    
    
    // MARK: -  BODY
    var body: some View {
        //GeometryReader help us measure any view's size, it gives us access to their size and position of the parent view
        GeometryReader { geometry in
            
            //ex: print out the exact size of the screen in points
            //note: when we wrap any view inside geometry container -> the origin point will be changed from the center to top-left -> that's why TextView moved it position from center to top-left
//            Text("width: \(Int(geometry.size.width)) - heigh: \(geometry.size.height)")
            
            
            
            ZStack {
                ForEach(0...randomCircle, id: \.self) { item in
                    Circle()
                        .foregroundColor(.gray)
                        .opacity(0.15)
                        .frame(width: randomSize(), height: randomSize(), alignment: .center)
                        .scaleEffect(isAnimating ? randomScale() : 1)
                        .position(x: randomCoordinate(max: geometry.size.width), y: randomCoordinate(max: geometry.size.height))
                        .animation(Animation.interpolatingSpring(stiffness: 0.5, damping: 0.5)
                            .repeatForever(autoreverses: false)
                            .speed(randomSpeed())
                            .delay(randomDelay()), value: isAnimating)
                        .onAppear{
                            isAnimating = true
                        }
                }//: LOOP
            }//: ZSTACK
            .drawingGroup() //add this modifier, motion effect will not suffer any performance reduction
        }//: GEOMETRY
        
    }
}

// MARK: -  PREVIEW
struct MotionAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        MotionAnimationView()
    }
}

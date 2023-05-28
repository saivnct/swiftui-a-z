//
//  __FruitApp.swift
//  3-Fruit
//
//  Created by solgo on 07/11/2022.
//

import SwiftUI

@main
struct __FruitApp: App {
    //the benefit of @AppStorage is that it not only reads and write data to User Defaults, but it always watches each value change of the key and update UI immediately
    @AppStorage("isOnBoarding") var isOnBoarding: Bool = true
    
    var body: some Scene {
        WindowGroup {
            if isOnBoarding {
                OnboardingView()
            }else{
                ContentView()
            }
        }
    }
}

//
//  ContentView.swift
//  1-Restart
//
//  Created by giangbb on 03/11/2022.
//

import SwiftUI

//the Accent Color is a broad theme color applied to some views and UI controls
// developer can set it at the app level by specifying an Accent Color in the app's Asset

struct ContentView: View {
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = true
    
    var body: some View {
        ZStack{
            if isOnboardingViewActive{
                OnboardingView()
            }else{
                HomeView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//  HideKeyboardExt.swift
//  6-Devote
//
//  Created by giangbb on 16/11/2022.
//

import SwiftUI


//Dismiss keyboard when we run this function 
#if canImport(UIKit)
extension View{
    func hideKeyBoard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif

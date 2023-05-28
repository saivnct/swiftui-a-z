//
//  PageModel.swift
//  Pinch
//
//  Created by solgo on 07/11/2022.
//

import Foundation

struct Page: Identifiable{
    let id: Int
    let imageName: String
}


extension Page {
    var thumbnailName: String {
        return "thumb-\(imageName)"
    }
}

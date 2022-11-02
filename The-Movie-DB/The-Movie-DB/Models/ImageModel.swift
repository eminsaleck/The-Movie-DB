//
//  ImageModel.swift
//  The-Movie-DB
//
//  Created by LEMIN DAHOVICH on 02.11.2022.
//

import Foundation

struct ImageModel {
    var imageName: String
    var imageURL: URL
    var owner: String
    var cameraModel: String
    var lensModel: String
    var likes: Int
    var isLiked: Bool
}

extension ImageModel {
    init(url: URL) {
        self.imageName = ""
        self.imageURL = url
        
        owner = ""
        cameraModel = ""
        lensModel = ""
        likes = 0
        isLiked = false
    }
}

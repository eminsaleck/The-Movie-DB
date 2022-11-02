//
//  ProfilePhotosViewModel.swift
//  TabBarApp
//
//  Created by Greg Delgado on 10/2/19.
//  Copyright © 2019 greg. All rights reserved.
//

import Foundation

struct ProfilePhotosViewModel {
    private var photos = ModelFactory.dummyImages()
    
    var numberOfItems: Int {
        return photos.count
    }
    
    func photo(at index: Int) -> ImageModel {
        return photos[index]
    }
}

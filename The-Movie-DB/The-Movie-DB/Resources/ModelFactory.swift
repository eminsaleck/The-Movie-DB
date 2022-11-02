//
//  ModelFactory.swift
//  TabBarApp
//
//  Created by Greg Delgado on 9/22/19.
//  Copyright © 2019 greg. All rights reserved.
//

import Foundation

class ModelFactory {
    
    
    class func carouselImages() -> [ImageModel] {
        var images = [ImageModel]()
        (263...268).forEach{
            images.append(ImageModel(imageName: "", imageURL: URL(string: "https://picsum.photos/id/\($0)/900/600")!, owner: "Juan De La Cruz", cameraModel: "X-T30", lensModel: "XF50-140mm F2.8 R LM OIS WR", likes: 1238, isLiked: true))
        }
        
        return images
    }
    
    class func images(genre: String) -> [ImageModel] {
        var images = [ImageModel]()
        (263...268).forEach{
            images.append(ImageModel(imageName: "", imageURL: URL(string: "http://lorempixel.com/400/250/\(genre)/\($0)")!, owner: "Juan De La Cruz", cameraModel: "X-T30", lensModel: "XF50-140mm F2.8 R LM OIS WR", likes: 1238, isLiked: true))
        }
        return images
    }
    
    
    class func dummyImages() -> [ImageModel] {
        var images = [ImageModel]()
        (1...50).forEach{
            images.append(ImageModel(imageName: "", imageURL: URL(string: "https://picsum.photos/id/\($0)/900/600")!, owner: "Juan De La Cruz", cameraModel: "X-T30", lensModel: "XF50-140mm F2.8 R LM OIS WR", likes: 1238, isLiked: true))
        }
        
        return images
    }
    
    class func dummyProfile() -> Profile {
        let profile = Profile(firstname: "Juan", lastname: "De la Cruz", email: "abc123@example.com", username: "juan88", birthDate: "19701231", city: "Makati", gender: "M", occupations: ["Musician"], photographerType: "Amateur", awards: ["Best Actor"], applications: ["PhotoShop","Sketch"])
        return profile
    }
    
    class func dummyActivities() -> [Activity] {
        var activities = [Activity]()
        (1...30).forEach{ _ in
            activities.append(Activity(type: .random(), date: .now))
        }
        return activities.sorted { (lhs, rhs) -> Bool in
            return lhs.date > rhs.date
        }
    }
    

}

//
//  ProfileActivitiesViewModel.swift
//  TabBarApp
//
//  Created by Greg Delgado on 10/2/19.
//  Copyright © 2019 greg. All rights reserved.
//

import Foundation

struct ProfileActivitiesViewModel {
    var activities: [Activity]
    
    init() {
        activities = ModelFactory.dummyActivities()
    }
    
    func numberOfItems() -> Int {
        return activities.count
    }
    
    func viewModelForActivity(at index: Int) -> ActivityViewModel {
        return ActivityViewModel(activity: activity(at: index))
    }
    
    private func activity(at index: Int) -> Activity {
        return activities[index]
    }
    
}

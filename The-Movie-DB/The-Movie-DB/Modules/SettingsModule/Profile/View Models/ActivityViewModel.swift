//
//  ActivityViewModel.swift
//  TabBarApp
//
//  Created by Greg Delgado on 10/2/19.
//  Copyright © 2019 greg. All rights reserved.
//

import Foundation

struct ActivityViewModel {
    var activity: Activity
    
    var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mma dd/MM/YYYY"
        return formatter
    }()
    init(activity: Activity) {
        self.activity = activity
    }
    
    var activityDescription: String {
        return activity.type.activityTitle
    }
    
    var activityDate: String {
        return dateFormatter.string(from: activity.date)
    }
}

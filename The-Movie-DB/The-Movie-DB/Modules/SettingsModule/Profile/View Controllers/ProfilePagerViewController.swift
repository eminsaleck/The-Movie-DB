
//
//  ProfilePagerViewController.swift
//  TabBarApp
//
//  Created by Greg Delgado on 9/24/19.
//  Copyright © 2019 greg. All rights reserved.
//

import UIKit

class ProfilePagerViewController: TabPageViewController {
    
    override init() {
        super.init()
        let vc1 = ProfileDetailsViewController(viewModel: ProfileDetailsViewModel(profile: ModelFactory.dummyProfile()))
        
        let vc2 = ProfilePhotosViewController(viewModel: ProfilePhotosViewModel())
        
        let vc3 = ProfileActivitiesViewController(viewModel: ProfileActivitiesViewModel())
        
        let vc4 = ProfileLoginDetailsViewController(viewModel: ProfileLoginDetailsViewModel(profile: ModelFactory.dummyProfile()))
        

        tabItems = [(vc1, "Profile"), (vc2, "Photos"), (vc3, "Activities"), (vc4, "Login Details")]
        //option.tabWidth = view.frame.width / CGFloat(tabItems.count)
        option.hidesTopViewOnSwipeType = .all
        option.tabHeight = 44.0
        option.defaultColor = UIColor.black
        option.currentColor = UIColor.black
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    
    
   
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}



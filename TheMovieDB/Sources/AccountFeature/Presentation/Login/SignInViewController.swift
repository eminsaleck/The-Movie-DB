//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 27.01.2023.
//

import UIKit
import UI

class SignInViewController: UIViewController {
    
    private weak var signInButton: ShrinkingButton!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func startLoading() {
        signInButton.startAnimation()
    }
    
    func stopLoading() {
        signInButton.stopAnimation(revertAfterDelay: 0.1, completion: nil)
    }

    
}

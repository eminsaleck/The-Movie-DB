//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 27.01.2023.
//

import UIKit
import UI

class SignInView: UIView{
    
    private let viewModel: SignInViewModelProtocol
    
    private weak var signInButton: ShrinkingButton!
    
    init(frame: CGRect = .zero, viewModel: SignInViewModelProtocol) {
        self.viewModel = viewModel
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func startLoading() {
        signInButton.startAnimation()
    }
    
    func stopLoading() {
        signInButton.stopAnimation(revertAfterDelay: 0.1, completion: nil)
    }
}

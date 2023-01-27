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
    
    let signInButton: ShrinkingButton = {
        let button = ShrinkingButton()
        button.backgroundColor = .blue
        button.frame = CGRect(x: 0, y: 0, width: 500, height: 100)
        button.titleLabel?.font = .boldSystemFont(ofSize: 15)
        button.layer.cornerRadius = button.frame.height / 4
        button.setTitle(Strings.accountTitleDetailButton.localized(), for: .normal)
        return button
    }()
    
    init(frame: CGRect = .zero, viewModel: SignInViewModelProtocol) {
        self.viewModel = viewModel
        super.init(frame: frame)
        
        backgroundColor = .black
        setupBindables()
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupBindables() {
        signInButton.addAction(
            UIAction(handler: { [viewModel] _ in
                viewModel.signInDidTapped()
                self.startLoading()
            }),
            for: .touchUpInside
        )
    }
    
    func setupUI(){
        addSubview(signInButton)
        activateConstraints()
    }
    
    private func activateConstraints() {
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            signInButton.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 50),
            signInButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            signInButton.widthAnchor.constraint(equalToConstant: 200),
            signInButton.heightAnchor.constraint(equalToConstant: 50),
        ]
        )
    }
    func startLoading() {
        signInButton.startAnimation()
    }
    
    func stopLoading() {
        signInButton.stopAnimation(revertAfterDelay: 0.1, completion: nil)
    }
}


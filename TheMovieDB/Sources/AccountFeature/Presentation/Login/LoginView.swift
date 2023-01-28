//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 27.01.2023.
//

import Lottie
import UIKit
import UI

class LoginView: UIView{
    
    private let viewModel: LoginViewModelProtocol
    
    let loginButton: ShrinkingButton = {
        $0.backgroundColor = .blue
        $0.frame = CGRect(x: 0, y: 0, width: 200, height: 100)
        $0.titleLabel?.font = .boldSystemFont(ofSize: 15)
        $0.layer.cornerRadius = $0.frame.height / 4
        $0.setTitle(Localized.accountTitleDetailButton.localized(), for: .normal)
        return $0
    }(ShrinkingButton())
    
    private var animationView = LottieAnimationView()
    
    init(frame: CGRect = .zero, viewModel: LoginViewModelProtocol) {
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
        loginButton.addAction(
            UIAction(handler: { [viewModel] _ in
                viewModel.loginDidTapped()
                self.startLoading()
            }),
            for: .touchUpInside
        )
    }
    
    func setupUI(){
        animationView = .init(name: "loginLottie")
        animationView.loopMode = .loop
        animationView.animationSpeed = 1.5
        animationView.play()
        
        addSubview(loginButton)
        addSubview(animationView)
        activateConstraints()
    }
    
    func startLoading() {
        loginButton.startAnimation()
    }
    
    func stopLoading() {
        loginButton.stopAnimation(revertAfterDelay: 0.1, completion: nil)
    }
}

extension LoginView{
    
    private func activateConstraints() {
        animationView.translatesAutoresizingMaskIntoConstraints = false
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            loginButton.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 100),
            loginButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            loginButton.widthAnchor.constraint(equalToConstant: 200),
            loginButton.heightAnchor.constraint(equalToConstant: 50),
            
            animationView.widthAnchor.constraint(equalToConstant: 500),
            animationView.heightAnchor.constraint(equalToConstant: 500),
            animationView.centerXAnchor.constraint(equalTo: centerXAnchor),
            animationView.bottomAnchor.constraint(equalTo: loginButton.topAnchor)
        ]
        )
    }
}

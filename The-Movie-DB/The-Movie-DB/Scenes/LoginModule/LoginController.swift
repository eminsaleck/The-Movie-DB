//
//  AuthController.swift
//  The-Movie-DB
//
//  Created by LEMIN DAHOVICH on 01.11.2022.
//

import UIKit
import Lottie

protocol SignInViewControllerDelegate: UIViewController {

    func signInViewController(_ loginController: LoginController, didTapSignInButton tapped: Bool)

}

final class LoginController: UIViewController {
    
    weak var viewModel: LoginViewModelProtocol?
    var coordinator: LoginCoordinatorProtocol?
    weak var delegate: SignInViewControllerDelegate?

    private let loginButton: UIButton = {
        $0.setTitle("Login", for: .normal)
        $0.backgroundColor = .systemBlue
        $0.setTitleColor(.white, for: .normal)
        $0.layer.cornerRadius = 22
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIButton())
   
    private let labelInfo: UILabel = {
        $0.text = "TheMovieDB 2022-Present"
        $0.backgroundColor = .clear
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = .monospacedSystemFont(ofSize: 11, weight: .light)
        $0.textColor = .white
        return $0
    }(UILabel())

    private var animationView: LottieAnimationView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)

        animationView = .init(name: "loginLottie")
        animationView?.loopMode = .loop
        animationView?.animationSpeed = 1.5
        animationView?.play()
        setupConstraints()
        keyboardObservers()
        loginButton.addTarget(self, action: #selector(didTapLoginButton(_:)), for: .touchUpInside)
    }
  
    deinit {
        print("LoginViewController deinit")
    }
    
    @objc private func didTapLoginButton(_ sender: Any) {
        coordinator?.showAuth()
    }
}

extension LoginController{
    func setupConstraints(){
        guard let animationView = animationView else { return }
        animationView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(loginButton)
        view.addSubview(labelInfo)
        view.addSubview(animationView)
        
        let offset = 50.0
        
        NSLayoutConstraint.activate([
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -offset),
            loginButton.widthAnchor.constraint(equalToConstant: offset * 6),
            loginButton.heightAnchor.constraint(equalToConstant: offset),
            
            labelInfo.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: offset / 5),
            labelInfo.centerXAnchor.constraint(equalTo: loginButton.centerXAnchor),
            
            animationView.widthAnchor.constraint(equalToConstant: offset * 7),
            animationView.heightAnchor.constraint(equalToConstant: offset * 7),
            animationView.centerXAnchor.constraint(equalTo: loginButton.centerXAnchor),
            animationView.bottomAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: -offset)
            
        ])
    }
}

extension LoginController{
    
    func keyboardObservers(){
        NotificationCenter.default.addObserver(self, selector: #selector(LoginController.keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(LoginController.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    @objc func keyboardWillShow(notification: NSNotification) {
            
        guard let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {
           return
        }
        self.view.frame.origin.y = 0 - keyboardSize.height
    }

    @objc func keyboardWillHide(notification: NSNotification) {
      self.view.frame.origin.y = 0
    }
}

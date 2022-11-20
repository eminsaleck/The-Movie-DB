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
    weak var delegate: SignInViewControllerDelegate?

    private let loginButton: UIButton = {
        $0.setTitle("Login", for: .normal)
        $0.backgroundColor = .systemBlue
        $0.setTitleColor(.white, for: .normal)
        $0.layer.cornerRadius = 22
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIButton())
    
    private let loginField: UITextField = {
        $0.leftViewMode = UITextField.ViewMode.always
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        let image = UIImage(named: "user")
        imageView.image = image
        $0.leftView = imageView
        $0.placeholder = "Username"
        $0.backgroundColor = .darkGray
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.layer.cornerRadius = 10
        $0.textAlignment = .center
        return $0
    }(UITextField())
    
    private let passwordField: UITextField = {
        $0.leftViewMode = UITextField.ViewMode.always
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        let image = UIImage(named: "padlock")
        imageView.image = image
        $0.leftView = imageView
        $0.placeholder = "Password"
        $0.backgroundColor = .darkGray
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.layer.cornerRadius = 10
        $0.textAlignment = .center
        $0.isSecureTextEntry = true
        return $0
    }(UITextField())
    
    private let labelInfo: UILabel = {
        $0.text = "TheMovieDB 2022-Present"
        $0.backgroundColor = .clear
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = .monospacedSystemFont(ofSize: 11, weight: .light)
        $0.textColor = .white
        return $0
    }(UILabel())
    
    private let labelWelcome: UILabel = {
        $0.text = "Welcome Back!"
        $0.backgroundColor = .clear
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = .monospacedSystemFont(ofSize: 36, weight: .bold)
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
        delegate?.signInViewController(self, didTapSignInButton: true)
    }
}

extension LoginController{
    func setupConstraints(){
        guard let animationView = animationView else { return }
        animationView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(loginButton)
        view.addSubview(loginField)
        view.addSubview(passwordField)
        view.addSubview(labelInfo)
        view.addSubview(labelWelcome)
        view.addSubview(animationView)
        
        let offset = 50.0
        
        NSLayoutConstraint.activate([
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -offset),
            loginButton.widthAnchor.constraint(equalToConstant: offset * 6),
            loginButton.heightAnchor.constraint(equalToConstant: offset),
            
            labelInfo.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: offset / 5),
            labelInfo.centerXAnchor.constraint(equalTo: loginButton.centerXAnchor),
            
            passwordField.widthAnchor.constraint(equalTo: loginButton.widthAnchor),
            passwordField.heightAnchor.constraint(equalTo: loginButton.heightAnchor),
            passwordField.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: offset * 3),
            passwordField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            loginField.widthAnchor.constraint(equalTo: loginButton.widthAnchor),
            loginField.heightAnchor.constraint(equalTo: loginButton.heightAnchor),
            loginField.bottomAnchor.constraint(equalTo: passwordField.topAnchor, constant: -offset / 5),
            loginField.centerXAnchor.constraint(equalTo: passwordField.centerXAnchor),
            
            labelWelcome.bottomAnchor.constraint(equalTo: loginField.topAnchor, constant: -offset ),
            labelWelcome.centerXAnchor.constraint(equalTo: loginField.centerXAnchor),
            
            animationView.widthAnchor.constraint(equalToConstant: offset * 7),
            animationView.heightAnchor.constraint(equalToConstant: offset * 7),
            animationView.centerXAnchor.constraint(equalTo: labelInfo.centerXAnchor),
            animationView.bottomAnchor.constraint(equalTo: labelWelcome.bottomAnchor, constant: -offset)
            
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

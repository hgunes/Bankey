//
//  ViewController.swift
//  Bankey
//
//  Created by Harun Gunes on 04/05/2022.
//

import UIKit

class LoginViewController: UIViewController {
  
  let loginView = LoginView()
  let signInButton = UIButton()
  let errorMessageLabel = UILabel()
  
  var username: String? {
    return loginView.usernameTextField.text
  }
  
  var password: String? {
    return loginView.passwordTextField.text
  }
  

  override func viewDidLoad() {
    super.viewDidLoad()
    
    style()
    layout()
  }


}

extension LoginViewController {
  
  private func style() {
    view.backgroundColor = .systemBackground
    
    signInButton.translatesAutoresizingMaskIntoConstraints = false
    signInButton.backgroundColor = .systemBlue
    signInButton.layer.cornerRadius = 5
    signInButton.titleLabel?.textColor = .systemBackground
    signInButton.setTitle("Sign In", for: .normal)
    signInButton.addTarget(self, action: #selector(signIn), for: .primaryActionTriggered)

    errorMessageLabel.translatesAutoresizingMaskIntoConstraints = false
    errorMessageLabel.textAlignment = .center
    errorMessageLabel.textColor = .systemRed
    errorMessageLabel.numberOfLines = 0
    errorMessageLabel.isHidden = true
  }
  
  
  private func layout() {
    view.addSubview(loginView)
    view.addSubview(signInButton)
    view.addSubview(errorMessageLabel)
    
    NSLayoutConstraint.activate([
      loginView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
      loginView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
      view.trailingAnchor.constraint(equalToSystemSpacingAfter: loginView.trailingAnchor, multiplier: 1),
      
      signInButton.topAnchor.constraint(equalToSystemSpacingBelow: loginView.bottomAnchor, multiplier: 2),
      signInButton.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
      view.trailingAnchor.constraint(equalToSystemSpacingAfter: signInButton.trailingAnchor, multiplier: 1),
      
      errorMessageLabel.topAnchor.constraint(equalToSystemSpacingBelow: signInButton.bottomAnchor, multiplier: 2),
      errorMessageLabel.leadingAnchor.constraint(equalTo: signInButton.leadingAnchor),
      errorMessageLabel.trailingAnchor.constraint(equalTo: signInButton.trailingAnchor),
      
    ])
  }
}

extension LoginViewController {
  @objc func signIn() {
    errorMessageLabel.isHidden = true
    
    login()
    
  }
  
  private func login() {
    guard let username = username, let password = password else {
      assertionFailure("🔴 Username / password should never be nil!")
      return
    }
    
    if username.isEmpty || password.isEmpty {
      configureView(withMessage: "Username / password cannot be blank!")
      return
    }

  }
  
  
  func configureView(withMessage message: String) {
    errorMessageLabel.isHidden = false
    errorMessageLabel.text = message
  }

}

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
  let primaryTitleLabel = UILabel()
  let secondaryTitleLabel = UILabel()
  
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
    signInButton.configuration = .filled()
    signInButton.configuration?.imagePadding = 8 // for indicator spacing
    signInButton.setTitle("Sign In", for: [])
    signInButton.addTarget(self, action: #selector(signIn), for: .primaryActionTriggered)
    
    errorMessageLabel.translatesAutoresizingMaskIntoConstraints = false
    errorMessageLabel.textAlignment = .center
    errorMessageLabel.textColor = .systemRed
    errorMessageLabel.numberOfLines = 0
    errorMessageLabel.isHidden = true
    
    primaryTitleLabel.translatesAutoresizingMaskIntoConstraints = false
    primaryTitleLabel.textAlignment = .center
    primaryTitleLabel.text = "Bankey"
    primaryTitleLabel.font = UIFont.boldSystemFont(ofSize: 32)
    
    secondaryTitleLabel.translatesAutoresizingMaskIntoConstraints = false
    secondaryTitleLabel.textAlignment = .center
    secondaryTitleLabel.text = "Your premium source for all the things in banking!"
    secondaryTitleLabel.font = UIFont.systemFont(ofSize: 22, weight: .regular)
    secondaryTitleLabel.numberOfLines = 0
  }
  
  
  private func layout() {
    view.addSubview(loginView)
    view.addSubview(signInButton)
    view.addSubview(errorMessageLabel)
    view.addSubview(secondaryTitleLabel)
    view.addSubview(primaryTitleLabel)
    
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
      
      loginView.topAnchor.constraint(equalToSystemSpacingBelow: secondaryTitleLabel.bottomAnchor, multiplier: 3),
      secondaryTitleLabel.leadingAnchor.constraint(equalTo: errorMessageLabel.leadingAnchor),
      secondaryTitleLabel.trailingAnchor.constraint(equalTo: errorMessageLabel.trailingAnchor),
      
      secondaryTitleLabel.topAnchor.constraint(equalToSystemSpacingBelow: primaryTitleLabel.bottomAnchor, multiplier: 3),
      primaryTitleLabel.leadingAnchor.constraint(equalTo: secondaryTitleLabel.leadingAnchor),
      primaryTitleLabel.trailingAnchor.constraint(equalTo: secondaryTitleLabel.trailingAnchor),
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
    
    if username == "Harun" && password == "gunes" {
      signInButton.configuration?.showsActivityIndicator = true
    } else {
      configureView(withMessage: "Incorrect username / password")
    }
    
  }
  
  
  func configureView(withMessage message: String) {
    errorMessageLabel.isHidden = false
    errorMessageLabel.text = message
  }
  
}

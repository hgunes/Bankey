//
//  ViewController.swift
//  Bankey
//
//  Created by Harun Gunes on 04/05/2022.
//

import UIKit

protocol LoginViewControllerDelegate: AnyObject {
  func didLogin()
}

class LoginViewController: UIViewController {
  
  let loginView = LoginView()
  let signInButton = UIButton()
  let errorMessageLabel = UILabel()
  let primaryTitleLabel = UILabel()
  let secondaryTitleLabel = UILabel()
  
  weak var delegate: LoginViewControllerDelegate?
  
  var username: String? {
    return loginView.usernameTextField.text
  }
  
  var password: String? {
    return loginView.passwordTextField.text
  }
  
  var leadingEdgeOnScreen: CGFloat = 16
  var leadingEdgeOffScreen: CGFloat = -1000
  
  var titleLeadingAnchor: NSLayoutConstraint?
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    style()
    layout()
  }
  
  override func viewDidDisappear(_ animated: Bool) {
    super.viewDidDisappear(animated)
    signInButton.configuration?.showsActivityIndicator = false
  }
  
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    animate()
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
    
    titleLeadingAnchor = primaryTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: leadingEdgeOffScreen)
    titleLeadingAnchor!.isActive = true
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
    }
    
    if username == "Harun" && password == "gunes" {
      signInButton.configuration?.showsActivityIndicator = true
      delegate?.didLogin()
    } else {
      configureView(withMessage: "Incorrect username / password")
    }
    
  }
  
  
  func configureView(withMessage message: String) {
    errorMessageLabel.isHidden = false
    errorMessageLabel.text = message
  }
  
}

extension LoginViewController {
  private func animate() {
    let animator1 = UIViewPropertyAnimator(duration: 0.25, curve: .easeInOut) {
      self.titleLeadingAnchor?.constant = self.leadingEdgeOnScreen
      self.view.layoutIfNeeded()
    }
    animator1.startAnimation()
  }
}

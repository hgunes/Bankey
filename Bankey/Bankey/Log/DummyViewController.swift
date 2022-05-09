//
//  DummyViewController.swift
//  Bankey
//
//  Created by Harun Gunes on 09/05/2022.
//

import UIKit

protocol LogoutDelegate: AnyObject {
  func didLogout()
}

class DummyViewController: UIViewController {
  
  let stackView = UIStackView()
  let label = UILabel()
  let logoutButton = UIButton(type: .system)
  
  weak var delegate: LogoutDelegate?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = .systemBackground
    
    style()
    layout()
  }
}

extension DummyViewController {
  
  func style() {
    stackView.translatesAutoresizingMaskIntoConstraints = false
    stackView.axis = .vertical
    stackView.spacing = 20
    
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "Welcome!"
    label.font = UIFont.preferredFont(forTextStyle: .title1)
    
    logoutButton.translatesAutoresizingMaskIntoConstraints = false
    logoutButton.configuration = .filled()
    logoutButton.setTitle("Logout", for: [])
    logoutButton.addTarget(self, action: #selector(logoutButtonTapped), for: .primaryActionTriggered)
  }
  
  
  func layout() {
    stackView.addArrangedSubview(label)
    stackView.addArrangedSubview(logoutButton)
    
    view.addSubview(stackView)
    
    NSLayoutConstraint.activate([
      stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
    ])
    
  }
}


extension DummyViewController {
  
  @objc func logoutButtonTapped() {
    delegate?.didLogout()
  }
}

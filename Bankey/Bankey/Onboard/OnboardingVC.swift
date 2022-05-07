//
//  OnboardingVC.swift
//  Bankey
//
//  Created by Harun Gunes on 07/05/2022.
//

import UIKit

class OnboardingVC: UIViewController {
  
  let stackView = UIStackView()
  let label = UILabel()
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = .systemBackground
    
    style()
    layout()
  }
}


extension OnboardingVC {
  func style() {
    stackView.translatesAutoresizingMaskIntoConstraints = false
    stackView.axis = .vertical
    stackView.spacing = 20
    
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "Welcome"
    label.font = UIFont.preferredFont(forTextStyle: .title1)
  }
  
  
  func layout() {
    stackView.addArrangedSubview(label)
    view.addSubview(stackView)
    
    NSLayoutConstraint.activate([
      stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
    ])
  }
}

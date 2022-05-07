//
//  OnboardingVC.swift
//  Bankey
//
//  Created by Harun Gunes on 07/05/2022.
//

import UIKit

class OnboardingVC: UIViewController {
  
  let stackView = UIStackView()
  let imageView = UIImageView()
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
    
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.contentMode = .scaleAspectFit
    imageView.image = UIImage(named: "delorean")
    
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = UIFont.preferredFont(forTextStyle: .title2)
    label.adjustsFontForContentSizeCategory = true
    label.textAlignment = .center
    label.numberOfLines = 0
    label.text = "Bankey is faster, easier to use, and has a brand new look and feel that will make you feel lika you are back in 1989."
  }
  
  
  func layout() {
    stackView.addArrangedSubview(imageView)
    stackView.addArrangedSubview(label)
    
    view.addSubview(stackView)
    
    NSLayoutConstraint.activate([
      stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
      stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
      view.trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 1)
    ])
  }
}

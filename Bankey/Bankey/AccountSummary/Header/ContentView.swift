//
//  ContentView.swift
//  Bankey
//
//  Created by Harun Gunes on 22/05/2022.
//

import UIKit

let padding: CGFloat = 8

class ContentView: UIView {
  
  let bankeyLabel = HeaderLabel(size: 28)
  let nameLabel = HeaderLabel(size: 20)
  let greetingLabel = HeaderLabel(size: 20)
  let dateLabel = HeaderLabel(size: 20)
  
  let imageView = UIImageView()
  
  let stacView = UIStackView()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    configure()
    configureImageView()
  }
  
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
  private func configure() {
    translatesAutoresizingMaskIntoConstraints = false
    backgroundColor = appColor
    
    stacView.translatesAutoresizingMaskIntoConstraints = false
    addSubview(stacView)
    
    bankeyLabel.text = "Bankey"
    nameLabel.text = "Harun"
    
    stacView.addArrangedSubview(bankeyLabel)
    stacView.addArrangedSubview(greetingLabel)
    stacView.addArrangedSubview(nameLabel)
    stacView.addArrangedSubview(dateLabel)
    
    stacView.axis = .vertical
    stacView.distribution = .fillProportionally
    
    
    
    NSLayoutConstraint.activate([
      stacView.topAnchor.constraint(equalTo: self.topAnchor, constant: padding),
      stacView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 12),
//      stacView.widthAnchor.constraint(equalTo: bankeyLabel.widthAnchor, constant: padding),
      stacView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -padding),
    ])
  }
  
  
  func configureImageView() {
    imageView.translatesAutoresizingMaskIntoConstraints = false
    addSubview(imageView)
    
    imageView.image = UIImage(systemName: "sun.max.fill")
    imageView.tintColor = .yellow
    
    NSLayoutConstraint.activate([
      imageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
      imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant:  -padding),
      imageView.heightAnchor.constraint(equalToConstant: 100),
      imageView.widthAnchor.constraint(equalToConstant: 100),
    ])
  }
}

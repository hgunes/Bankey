//
//  ContentView.swift
//  Bankey
//
//  Created by Harun Gunes on 22/05/2022.
//

import UIKit

class ContentView: UIView {
  
  let bankeyLabel = HeaderLabel(size: 32)
  let nameLabel = HeaderLabel(size: 24)
  let greetingLabel = HeaderLabel(size: 24)
  let dateLabel = HeaderLabel(size: 24)
  
  let stacView = UIStackView()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    configure()
  }
  
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
  private func configure() {
    translatesAutoresizingMaskIntoConstraints = false
    backgroundColor = appColor
    
    stacView.translatesAutoresizingMaskIntoConstraints = false
    addSubview(stacView)
    
    stacView.addArrangedSubview(bankeyLabel)
    stacView.addArrangedSubview(nameLabel)
    stacView.addArrangedSubview(greetingLabel)
    stacView.addArrangedSubview(dateLabel)
    
    bankeyLabel.text = "Bankey"
    nameLabel.text = "Harun,"
    greetingLabel.text = "Good morning,"
    dateLabel.text = "22.06.2022"
    
    stacView.axis = .vertical
    stacView.distribution = .fillEqually
    
    let padding: CGFloat = 8
    
    NSLayoutConstraint.activate([
      stacView.topAnchor.constraint(equalTo: self.topAnchor, constant: padding),
      stacView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 12),
      stacView.widthAnchor.constraint(equalTo: bankeyLabel.widthAnchor, constant: padding),
      stacView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -padding),
    ])
  }
}

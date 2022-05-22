//
//  ContentView.swift
//  Bankey
//
//  Created by Harun Gunes on 22/05/2022.
//

import UIKit

class ContentView: UIView {
  
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
  }
}

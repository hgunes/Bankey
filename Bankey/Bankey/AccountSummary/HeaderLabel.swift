//
//  HeaderLabel.swift
//  Bankey
//
//  Created by Harun Gunes on 22/05/2022.
//

import UIKit

class HeaderLabel: UILabel {
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
  }
  
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
  convenience init(size: CGFloat) {
    self.init(frame: .zero)
    translatesAutoresizingMaskIntoConstraints = false
    font = UIFont(name: "AvenirNext-DemiBold", size: size)
  }
}

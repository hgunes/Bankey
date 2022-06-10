//
//  AccountSummaryHeaderView.swift
//  Bankey
//
//  Created by Harun Gunes on 22/05/2022.
//

import UIKit

class AccountSummaryHeaderView: UIView {
  
  let contentView = ContentView()
  let shakeyBell = ShakeyBellView()
  
  struct ViewModel {
    let name: String
    let greeting: String
    let date: Date
    
    var dateFormatted: String {
      return date.monthDayYearString
    }
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    commonInit()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    commonInit()
  }
  
  override var intrinsicContentSize: CGSize {
    return CGSize(width: UIView.noIntrinsicMetric, height: 144)
  }
  
  private func commonInit() {
    addSubview(contentView)
    
    contentView.translatesAutoresizingMaskIntoConstraints = false
    contentView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
    contentView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
    contentView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
    contentView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    
    configureShakeyBell()
  }
  
  
  private func configureShakeyBell() {
    addSubview(shakeyBell)
    
    NSLayoutConstraint.activate([
      shakeyBell.trailingAnchor.constraint(equalTo: trailingAnchor),
      shakeyBell.bottomAnchor.constraint(equalTo: bottomAnchor)
    ])
  }
  
  
  func configureViewModel(viewModel: ViewModel) {
    DispatchQueue.main.async {
      self.contentView.nameLabel.text = viewModel.name
      self.contentView.greetingLabel.text = viewModel.greeting
      self.contentView.nameLabel.text = viewModel.dateFormatted
    }
    
  }
}

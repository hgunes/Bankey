//
//  AccountSummaryCell.swift
//  Bankey
//
//  Created by Harun Gunes on 28/05/2022.
//

import UIKit

class AccountSummaryCell: UITableViewCell {
  
  static let reuseID = "AccountSummaryCell"
  static let rowHeight: CGFloat = 100
  
  let typeLabel = UILabel()
  let underlineView = UIView()
  let nameLabel = UILabel()
  let balanceStackView = UIStackView()
  let balanceLabel = UILabel()
  let balanceAmountLabel = UILabel()
  let chevromImageView = UIImageView()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    setup()
    layout()
  }
  
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

extension AccountSummaryCell {
  private func setup() {
    typeLabel.translatesAutoresizingMaskIntoConstraints = false
    typeLabel.font = UIFont.preferredFont(forTextStyle: .caption1)
    typeLabel.adjustsFontForContentSizeCategory = true
    typeLabel.text = "Account type"
    
    underlineView.translatesAutoresizingMaskIntoConstraints = false
    underlineView.backgroundColor = appColor
    
    nameLabel.translatesAutoresizingMaskIntoConstraints = false
    nameLabel.font = UIFont.preferredFont(forTextStyle: .body)
    nameLabel.text = "Harun Gunes"
    
    balanceStackView.translatesAutoresizingMaskIntoConstraints = false
    balanceStackView.axis = .vertical
    balanceStackView.addArrangedSubview(balanceLabel)
    balanceStackView.addArrangedSubview(balanceAmountLabel)
    balanceStackView.spacing = 0
    
    balanceLabel.translatesAutoresizingMaskIntoConstraints = false
    balanceLabel.font = UIFont.preferredFont(forTextStyle: .body)
    balanceLabel.textAlignment = .right
    balanceLabel.text = "Some balance"
    
    balanceAmountLabel.translatesAutoresizingMaskIntoConstraints = false
    balanceAmountLabel.font = UIFont.preferredFont(forTextStyle: .body)
    balanceAmountLabel.textAlignment = .right
    balanceAmountLabel.text = "$9000.99"
    
    chevromImageView.translatesAutoresizingMaskIntoConstraints = false
    chevromImageView.image = UIImage(systemName: "chevron.right")
    
    contentView.addSubview(typeLabel)
    contentView.addSubview(underlineView)
    contentView.addSubview(nameLabel)
    contentView.addSubview(balanceStackView)
    contentView.addSubview(chevromImageView)
  }
  
  
  private func layout() {
    NSLayoutConstraint.activate([
      typeLabel.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 2),
      typeLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2),
      
      underlineView.topAnchor.constraint(equalToSystemSpacingBelow: typeLabel.bottomAnchor, multiplier: 1),
      underlineView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2),
      underlineView.widthAnchor.constraint(equalToConstant: 60),
      underlineView.heightAnchor.constraint(equalToConstant: 4),
      
      nameLabel.topAnchor.constraint(equalToSystemSpacingBelow: underlineView.bottomAnchor, multiplier: 2),
      nameLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2),
      
      balanceStackView.topAnchor.constraint(equalToSystemSpacingBelow: underlineView.bottomAnchor, multiplier: 0),
      balanceStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32),
      balanceStackView.leadingAnchor.constraint(equalToSystemSpacingAfter: nameLabel.trailingAnchor, multiplier: 0.5),
      
      chevromImageView.centerYAnchor.constraint(equalTo: balanceStackView.centerYAnchor),
      chevromImageView.leadingAnchor.constraint(equalToSystemSpacingAfter: balanceStackView.trailingAnchor, multiplier: 1),
      chevromImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
    ])
    
  }
}

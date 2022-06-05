//
//  ShakeyBellView.swift
//  Bankey
//
//  Created by Harun Gunes on 04/06/2022.
//

import UIKit

class ShakeyBellView: UIView {
  
  let imageView = UIImageView()
  let buttonView = UIButton()

  let buttonRadius: CGFloat = 16
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    configure()
    style()
    layout()
  }
  
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
  override var intrinsicContentSize: CGSize {
    return CGSize(width: 48, height: 48)
  }
  
}

extension ShakeyBellView {
  private func configure() {
    let singleTap = UITapGestureRecognizer(target: self, action: #selector(imageViewTapped))
    imageView.addGestureRecognizer(singleTap)
    imageView.isUserInteractionEnabled = true
  }
  
  
  private func style() {
    translatesAutoresizingMaskIntoConstraints = false
    imageView.translatesAutoresizingMaskIntoConstraints = false
    let image = UIImage(systemName: "bell.fill")?.withTintColor(.white, renderingMode: .alwaysOriginal)
    imageView.image = image
    
    buttonView.translatesAutoresizingMaskIntoConstraints = false
    buttonView.layer.cornerRadius = buttonRadius / 2
    buttonView.backgroundColor = .systemRed
    buttonView.titleLabel?.font = .systemFont(ofSize: 13)
    buttonView.setTitle("9", for: .normal)
    buttonView.setTitleColor(.white, for: .normal)
  }
  
  
  private func layout() {
    addSubview(imageView)
    addSubview(buttonView)
    
    NSLayoutConstraint.activate([
      imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
      imageView.centerYAnchor.constraint(equalTo: centerYAnchor),
      imageView.heightAnchor.constraint(equalToConstant: 24),
      imageView.widthAnchor.constraint(equalToConstant: 24)
    ])
    
    NSLayoutConstraint.activate([
      buttonView.topAnchor.constraint(equalTo: imageView.topAnchor),
      buttonView.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: -9),
      buttonView.widthAnchor.constraint(equalToConstant: buttonRadius),
      buttonView.heightAnchor.constraint(equalToConstant: buttonRadius),
    ])
  }
}

// MARK: - Actions
extension ShakeyBellView {
  @objc func imageViewTapped() {
    shakeWith(duration: 1.0, angle: .pi/8, yOffset: 0.0)
  }
  
  
  private func shakeWith(duration: Double, angle: CGFloat, yOffset: CGFloat) {
    let numberOfFrames: Double = 6
    let frameDuration = Double(1/numberOfFrames)
    
    imageView.setAnchorPoint(CGPoint(x: 0.5, y: yOffset))
    
    UIView.animateKeyframes(withDuration: duration, delay: 0, options: [],
                            animations: {
      UIView.addKeyframe(withRelativeStartTime: 0.0,
                         relativeDuration: frameDuration) {
        self.imageView.transform = CGAffineTransform(rotationAngle: -angle)
      }
      UIView.addKeyframe(withRelativeStartTime: frameDuration,
                         relativeDuration: frameDuration) {
        self.imageView.transform = CGAffineTransform(rotationAngle: +angle)
      }
      UIView.addKeyframe(withRelativeStartTime: frameDuration*2,
                         relativeDuration: frameDuration) {
        self.imageView.transform = CGAffineTransform(rotationAngle: -angle)
      }
      UIView.addKeyframe(withRelativeStartTime: frameDuration*3,
                         relativeDuration: frameDuration) {
        self.imageView.transform = CGAffineTransform(rotationAngle: +angle)
      }
      UIView.addKeyframe(withRelativeStartTime: frameDuration*4,
                         relativeDuration: frameDuration) {
        self.imageView.transform = CGAffineTransform(rotationAngle: -angle)
      }
      UIView.addKeyframe(withRelativeStartTime: frameDuration*5,
                         relativeDuration: frameDuration) {
        self.imageView.transform = CGAffineTransform.identity
      }
    },
                            completion: nil
    )
  }
}

extension UIView {
  func setAnchorPoint(_ point: CGPoint) {
    var newPoint = CGPoint(x: bounds.size.width * point.x, y: bounds.size.height * point.y)
    var oldPoint = CGPoint(x: bounds.size.width * layer.anchorPoint.x, y: bounds.size.height * layer.anchorPoint.y)
    
    newPoint = newPoint.applying(transform)
    oldPoint = oldPoint.applying(transform)
    
    var position = layer.position
    
    position.x -= oldPoint.x
    position.x += newPoint.x
    
    position.y -= oldPoint.y
    position.y += newPoint.y
    
    layer.position = position
    layer.anchorPoint = point
  }
}

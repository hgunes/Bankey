//
//  MainViewController.swift
//  Bankey
//
//  Created by Harun Gunes on 12/05/2022.
//

import UIKit

class MainViewController: UITabBarController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = .systemBackground
    
    setupViews()
    setupTabBar()
  }
  
  
  private func setupViews() {
    let summaryVC = AccountSummaryViewController()
    let transfersVC = TransfersViewController()
    let moreVC = MoreViewController()
    
    summaryVC.setTabBarImage(imageName: "list.dash.header.rectangle", title: "Summary")
    transfersVC.setTabBarImage(imageName: "arrow.left.arrow.right", title: "Transfers")
    moreVC.setTabBarImage(imageName: "ellipsis.circle", title: "More")
    
    let summaryNavigation = UINavigationController(rootViewController: summaryVC)
    let transfersNavigation = UINavigationController(rootViewController: transfersVC)
    let moreNavigation = UINavigationController(rootViewController: moreVC)
    
    summaryNavigation.navigationBar.tintColor = appColor
    hideNavBarLine(summaryNavigation.navigationBar)
    
    let tabBarList = [summaryNavigation, transfersNavigation, moreNavigation]
    viewControllers = tabBarList
  }
  
  
  private func hideNavBarLine(_ navigationBar: UINavigationBar) {
    let img = UIImage()
    navigationBar.shadowImage = img
    navigationBar.setBackgroundImage(img, for: .default)
    navigationBar.isTranslucent = false
  }
  
  
  private func setupTabBar() {
    tabBar.tintColor = appColor
    tabBar.isTranslucent = false
  }
  
  
}
// MARK: - ViewControllers

class AccountSummaryViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .systemBackground
    title = "Account summary"
  }
}

class TransfersViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .systemBlue
    title = "Transfers"
  }
}

class MoreViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .systemPurple
    title = "More"
  }
}

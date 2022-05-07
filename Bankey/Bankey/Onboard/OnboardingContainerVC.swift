//
//  OnboardingContainerVC.swift
//  Bankey
//
//  Created by Harun Gunes on 07/05/2022.
//

import UIKit

class OnboardingContainerVC: UIViewController {
  
  let pageViewController: UIPageViewController
  var pages = [UIViewController]()
  var currentVC: UIViewController {
    didSet {
      
    }
  }
  
  
  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    self.pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
    
    let page1 = VC1()
    let page2 = VC2()
    let page3 = VC3()
    
    pages.append(page1)
    pages.append(page2)
    pages.append(page3)
    
    currentVC = pages.first!
    
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
  }
  
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = .systemPurple
    
    addChild(pageViewController)
    view.addSubview(pageViewController.view)
    pageViewController.didMove(toParent: self)
    
    pageViewController.view.translatesAutoresizingMaskIntoConstraints = false
    pageViewController.dataSource = self
    
    NSLayoutConstraint.activate([
      view.topAnchor.constraint(equalTo: pageViewController.view.topAnchor),
      view.leadingAnchor.constraint(equalTo: pageViewController.view.leadingAnchor),
      view.trailingAnchor.constraint(equalTo: pageViewController.view.trailingAnchor),
      view.bottomAnchor.constraint(equalTo: pageViewController.view.bottomAnchor),
    ])
    
    pageViewController.setViewControllers([pages.first!], direction: .forward, animated: false)
    
  }
  
}

extension OnboardingContainerVC: UIPageViewControllerDataSource {
  func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
    return getPreviousVC(from: viewController)
  }
  
  
  func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
    getNextVC(from: viewController)
  }
  
  
  private func getPreviousVC(from viewController: UIViewController) -> UIViewController? {
    guard let index = pages.firstIndex(of: viewController), index - 1 >= 0 else { return nil }
    
    currentVC = pages[index - 1]
    return currentVC
  }
  
  
  private func getNextVC(from viewController: UIViewController) -> UIViewController? {
    guard let index = pages.firstIndex(of: viewController), index + 1 < pages.count else { return nil }
    
    currentVC = pages[index + 1]
    return currentVC
  }
  
  
  func presentationCount(for pageViewController: UIPageViewController) -> Int {
    return pages.count
  }
  
  
  func presentationIndex(for pageViewController: UIPageViewController) -> Int {
    return pages.firstIndex(of: self.currentVC) ?? 0
  }
}


class VC1: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .purple
  }
}

class VC2: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .green
  }
}

class VC3: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .red
  }
}
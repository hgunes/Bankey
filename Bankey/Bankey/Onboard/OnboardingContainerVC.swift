//
//  OnboardingContainerVC.swift
//  Bankey
//
//  Created by Harun Gunes on 07/05/2022.
//

import UIKit

protocol OnboardingContainerVCDelegate: AnyObject {
  func didFinishOnboarding()
}

class OnboardingContainerVC: UIViewController {
  
  let pageViewController: UIPageViewController
  var pages = [UIViewController]()
  var currentVC: UIViewController
  let closeButton = UIButton(type: .system)
  let doneButton = UIButton(type: .system)
  
  weak var delegate: OnboardingContainerVCDelegate?
  
  
  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    self.pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
    
    let page1 = OnboardingVC(heroImage: "delorean", title: "Bankey is faster, easier to use, and has a brand new look and feel that will make you feel lika you are back in 1989.")
    let page2 = OnboardingVC(heroImage: "world", title: "Bankey is faster, easier to use, and has a brand new look and feel that will make you feel lika you are back in 1989.")
    let page3 = OnboardingVC(heroImage: "thumbs", title: "Bankey is faster, easier to use, and has a brand new look and feel that will make you feel lika you are back in 1989.")
    
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
    
    setup()
    style()
    layout()
  }
  
  private func setup() {
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
    currentVC = pages.first!
  }
  
  
  private func style() {
    closeButton.translatesAutoresizingMaskIntoConstraints = false
    closeButton.setTitle("Close", for: [])
    closeButton.addTarget(self, action: #selector(closeButtonTapped), for: .primaryActionTriggered)
    view.addSubview(closeButton)
    
    doneButton.translatesAutoresizingMaskIntoConstraints = false
    doneButton.setTitle("Done", for: [])
    doneButton.addTarget(self, action: #selector(doneButtonTapped), for: .primaryActionTriggered)
    view.addSubview(doneButton)
  }
  
  
  private func layout() {
    NSLayoutConstraint.activate([
      closeButton.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
      closeButton.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 2),
      
      view.trailingAnchor.constraint(equalToSystemSpacingAfter: doneButton.trailingAnchor, multiplier: 2),
      view.safeAreaLayoutGuide.bottomAnchor.constraint(equalToSystemSpacingBelow: doneButton.bottomAnchor, multiplier: 3)
    ])
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
  
  
  @objc func closeButtonTapped() {
    delegate?.didFinishOnboarding()
  }
  
  
  @objc func doneButtonTapped() {
    delegate?.didFinishOnboarding()
  }
}

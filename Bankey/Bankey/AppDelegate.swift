//
//  AppDelegate.swift
//  Bankey
//
//  Created by Harun Gunes on 04/05/2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?
  
  let loginVC = LoginViewController()
  let onboardingContainerVC = OnboardingContainerVC()
  let dummyVC = DummyViewController()
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    
    window = UIWindow(frame: UIScreen.main.bounds)
    window?.makeKeyAndVisible()
    
    loginVC.delegate = self
    onboardingContainerVC.delegate = self
    dummyVC.delegate = self
    
    window?.rootViewController = loginVC
//    window?.rootViewController = OnboardingContainerVC()
//    window?.rootViewController = dummyVC
    
    return true
  }

}

extension AppDelegate {
  func setRootVC(_ vc: UIViewController, animated: Bool = true) {
    guard animated, let window = self.window else {
      self.window?.rootViewController = vc
      self.window?.makeKeyAndVisible()
      return
    }
    
    window.rootViewController = vc
    window.makeKeyAndVisible()
    UIView.transition(with: window,
                      duration: 0.3,
                      options: .transitionCrossDissolve,
                      animations: nil,
                      completion: nil)
  }
}

extension AppDelegate: LoginViewControllerDelegate {
  func didLogin() {
    if LocalState.hasOnboarded  {
      setRootVC(dummyVC)
    } else {
      setRootVC(onboardingContainerVC)
    }
    
  }
}

extension AppDelegate: OnboardingContainerVCDelegate {
  func didFinishOnboarding() {
    LocalState.hasOnboarded = true
    setRootVC(dummyVC)
  }
  
  
}

extension AppDelegate: LogoutDelegate {
  func didLogout() {
    setRootVC(loginVC)
  }
}


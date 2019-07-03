//
//  SceneDelegate.swift
//  CatchUp
//
//  Created by Bas Thomas Broek on 02/07/2019.
//  Copyright © 2019 Bas Thomas Broek. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
  var window: UIWindow?

  @available(iOS 13, *)
  func stateRestorationActivity(for scene: UIScene) -> NSUserActivity? {
    return scene.userActivity
  }

  @available(iOS 13, *)
  func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    guard let userActivity = connectionOptions.userActivities.first ?? session.stateRestorationActivity else { return }
//    let userActivity = Friend(name: "Bas", lastSeen: Date()).userActivity
    if !configure(window: window, with: userActivity) {
      print("Failed to restore from \(userActivity)")
    }
  }

  func configure(window: UIWindow?, with activity: NSUserActivity) -> Bool {
//    guard activity.title == Friend.userActivityTitle else { return false }
//    guard
//      let name = activity.userInfo?["name"] as? String,
//      let lastSeen = activity.userInfo?["lastSeen"] as? Date else { fatalError("Could not get valid user info from activity") }
//
//    guard let friendDetailViewController = FriendDetailViewController.loadFromStoryboard() else { fatalError("Could not load view controller from storyboard") }
//    friendDetailViewController.friend = Friend(name: name, lastSeen: lastSeen)
//
//    if let splitViewController = window?.rootViewController as? UISplitViewController {
//      splitViewController.showDetailViewController(UINavigationController(rootViewController: friendDetailViewController), sender: nil)
//      return true
//    }
    return false
  }
}

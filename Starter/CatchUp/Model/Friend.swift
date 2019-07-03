//
//  Friend.swift
//  CatchUp
//
//  Created by Bas Thomas Broek on 02/07/2019.
//  Copyright © 2019 Bas Thomas Broek. All rights reserved.
//

import Foundation

struct Friend: CustomStringConvertible {
  let name: String
  var lastSeen: Date

  var description: String {
    "I've last seen \(name) on \(lastSeen)"
  }

  static let userActivityType = "nl.basbroek.friend"
  static let userActivityTitle = "showFriendDetail"
  var userActivity: NSUserActivity {
    let userActivity = NSUserActivity(activityType: Friend.userActivityType)
    userActivity.title = Friend.userActivityTitle
    userActivity.userInfo = [
      "name": name,
      "lastSeen": lastSeen
    ]
    return userActivity
  }
}

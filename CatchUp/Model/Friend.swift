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
}

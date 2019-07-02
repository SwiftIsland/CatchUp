//
//  FriendDetailViewController.swift
//  CatchUp
//
//  Created by Bas Thomas Broek on 02/07/2019.
//  Copyright © 2019 Bas Thomas Broek. All rights reserved.
//

import UIKit
import PencilKit

class FriendDetailViewController: UIViewController {

  func configureView() {
    if let friend = friend {
        title = friend.name
    }

    let canvas = PKCanvasView(frame: view.bounds)
    view.addSubview(canvas)
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    configureView()
  }

  var friend: Friend? {
    didSet { configureView() }
  }
}

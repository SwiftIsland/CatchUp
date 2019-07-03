//
//  FriendDetailViewController.swift
//  CatchUp
//
//  Created by Bas Thomas Broek on 02/07/2019.
//  Copyright © 2019 Bas Thomas Broek. All rights reserved.
//

import UIKit

class FriendDetailViewController: UIViewController {
  @IBOutlet weak var imageView: UIImageView!
  @IBOutlet weak var doneButton: UIButton!
  @IBAction func doneButtonPressed(_ sender: Any) {
    // Part 5
  }
  
  var showsDoneButton = false {
    didSet {
      doneButton?.isHidden = !showsDoneButton
    }
  }
  
  func configureView() {
    if let friend = friend {
        title = friend.name
        imageView?.image = UIImage(named: "\(friend.name.lowercased()).jpg")
    }
  }

  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    if #available(iOS 13.0, *) {
      view.window?.windowScene?.userActivity = friend?.userActivity
    }
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    configureView()
    doneButton.isHidden = !showsDoneButton
  }

  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    if #available(iOS 13.0, *) {
      view.window?.windowScene?.userActivity = nil
    }
  }

  var friend: Friend? {
    didSet { configureView() }
  }
}

extension FriendDetailViewController {
  static func loadFromStoryboard() -> FriendDetailViewController? {
    let storyboard = UIStoryboard(name: "Main", bundle: .main)
    return storyboard.instantiateViewController(withIdentifier: "FriendDetailViewController") as? FriendDetailViewController
  }
}

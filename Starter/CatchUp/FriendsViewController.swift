//
//  FriendsViewController.swift
//  CatchUp
//
//  Created by Bas Thomas Broek on 02/07/2019.
//  Copyright © 2019 Bas Thomas Broek. All rights reserved.
//

import UIKit

class FriendsViewController: UITableViewController {

  var detailViewController: FriendDetailViewController?
  var friends: [Friend] = []

  override func viewDidLoad() {
    super.viewDidLoad()
    navigationItem.leftBarButtonItem = editButtonItem
//    tableView.dragDelegate = self

    let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(insertNewObject(_:)))
    navigationItem.rightBarButtonItem = addButton
    if let split = splitViewController {
        let controllers = split.viewControllers
        detailViewController = (controllers[controllers.count - 1] as! UINavigationController).topViewController as? FriendDetailViewController
    }
  }

  override func viewWillAppear(_ animated: Bool) {
    clearsSelectionOnViewWillAppear = splitViewController!.isCollapsed
    super.viewWillAppear(animated)
  }

  @objc
  func insertNewObject(_ sender: Any) {
    let alert = UIAlertController(title: "Add Friend", message: nil, preferredStyle: .alert)
    let addAction = UIAlertAction(title: "Add", style: .default) { _ in
      guard let text = alert.textFields?.first?.text, text.isEmpty == false else { fatalError("No valid name entered") }
      let friend = Friend(name: text, lastSeen: Date())
      DispatchQueue.main.async {
        self.friends.insert(friend, at: 0)
        let indexPath = IndexPath(row: 0, section: 0)
        self.tableView.insertRows(at: [indexPath], with: .automatic)
      }
    }
    alert.addTextField { textField in
      textField.placeholder = "Friend Name"
    }
    alert.addAction(addAction)
    alert.addAction(.init(title: "Cancel", style: .cancel))
    alert.preferredAction = addAction

    present(alert, animated: true)
  }

  // MARK: - Segues

  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "showDetail" {
        if let indexPath = tableView.indexPathForSelectedRow {
            let friend = friends[indexPath.row]
            let controller = (segue.destination as! UINavigationController).topViewController as! FriendDetailViewController
            controller.friend = friend
            controller.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
            controller.navigationItem.leftItemsSupplementBackButton = true
        }
    }
  }

  // MARK: - Table View

  override func numberOfSections(in tableView: UITableView) -> Int {
    1
  }

  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    friends.count
  }

  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

    let object = friends[indexPath.row]
    cell.textLabel!.text = object.description
    let longPressRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(didLongPressCell))
    cell.addGestureRecognizer(longPressRecognizer)
    return cell
  }

  @objc func didLongPressCell(_ gesture: UILongPressGestureRecognizer) {
    // Part 4
  }

  override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
    true
  }

  override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
    if editingStyle == .delete {
        friends.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .fade)
    } else if editingStyle == .insert {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
  }
}

//extension FriendsViewController: UITableViewDragDelegate {
//  func tableView(_ tableView: UITableView, itemsForBeginning session: UIDragSession, at indexPath: IndexPath) -> [UIDragItem] {
//    let selectedFriend = friends[indexPath.row]
//
//    let userActivity = selectedFriend.userActivity
//    let itemProvider = NSItemProvider(object: userActivity)
//
//    let dragItem = UIDragItem(itemProvider: itemProvider)
//    dragItem.localObject = selectedFriend
//
//    return [dragItem]
//  }
//}

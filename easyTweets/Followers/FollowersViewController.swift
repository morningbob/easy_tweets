//
//  FollowersViewController.swift
//  easyTweets
//
//  Created by Jessie Hon on 2021-03-26.
//

import UIKit

class FollowersViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
  @IBOutlet weak var tableView: UITableView!
  
  var followers = [User]()

  override func viewDidLoad() {
    super.viewDidLoad()
    
    tableView.delegate = self
    tableView.dataSource = self

  }
    
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return followers.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = tableView.dequeueReusableCell(withIdentifier: "FollowerCell", for: indexPath) as! FollowerCell
    
    cell.usernameLabel.text = followers[indexPath.row].username
    cell.nameLabel.text = followers[indexPath.row].name
    return cell
    
  }
  

}

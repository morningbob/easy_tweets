//
//  FollowersViewController.swift
//  easyTweets
//
//  Created by Jessie Hon on 2021-03-26.
//

import UIKit
import CoreData

class FollowersViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
  @IBOutlet weak var tableView: UITableView!
  
  var followers = [UserEntity]()
  var dataController : DataController!
  var users = [User]()
  var userId : String = ""

  override func viewDidLoad() {
    super.viewDidLoad()
    
    tableView.delegate = self
    tableView.dataSource = self

  }
  
  @IBAction func saveFollowersAction(_ sender: UIBarButtonItem) {
    // create user objects
    createUsers()
    saveContext()
  }
  
  func createUsers() {
    //let user = fetchUser(userId: self.userId)
    fetchUser(userId: self.userId)
    users = followers.map { follower in
      let user = User(context: dataController.viewContext)
      user.id = follower.id
      user.username = follower.username
      user.name = follower.name
      user.followee = user
      return user
    }
    
  }
  
  func saveContext() {
    do {
      try dataController.viewContext.save()
      self.presentAlert(title: "Followers", message: "The user and the followers are saved.")
    } catch {
      self.presentAlert(title: "Followers", message: "There is error when saving followers.")
    }
  }
  
  func fetchUser(userId: String) {  //-> User
    // build the request
    let fetchRequest: NSFetchRequest<User> = User.fetchRequest()
    let predicate = NSPredicate(format: "id == %@", self.userId)
    fetchRequest.predicate = predicate
    let users = try? dataController.viewContext.execute(fetchRequest)
    print("executed")
    print(users)
    //return users
  }
  
  func presentAlert(title: String, message: String) {
    let alert = UIAlertController(
         title: title,
         message: message,
         preferredStyle: .alert
     )
     alert.addAction(
         UIAlertAction(
             title: "OK",
             style: .default,
             handler: nil
         )
     )
     present(alert, animated: true, completion: nil)
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

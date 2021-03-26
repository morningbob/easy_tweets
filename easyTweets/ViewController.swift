//
//  ViewController.swift
//  easyTweets
//
//  Created by Jessie Hon on 2021-03-24.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var keywordTextField: UITextField!
  @IBOutlet weak var usernameTextField: UITextField!
  @IBOutlet weak var followersTextField: UITextField!
  
  var tweets = [Tweet]()
  var userId : String = ""
  var followers = [User]()
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
  }

  
  @IBAction func searchButton(_ sender: UIButton) {
    // send the request
    TwitterAPIClient.searchKeyword(keyword: keywordTextField.text ?? "") { response, error in
      if response != nil {
        print("successfully got tweets with the keyword.")
        print(response?.data)
        self.tweets = response?.data ?? [Tweet]()
        // navigate to display result
        DispatchQueue.main.async {
          let resultVC = self.storyboard!.instantiateViewController(identifier: "ResultViewController") as! ResultViewController
          resultVC.tweets = self.tweets
          self.navigationController!.pushViewController(resultVC, animated: true)
        }
      } else {
        print(error?.localizedDescription ?? "")
        
      }
    }
  }
  
  @IBAction func searchUser(_ sender: Any) {
    TwitterAPIClient.searchUserId(username: usernameTextField.text ?? "") {
      response, error in
      if response != nil {
        print("successfully got user's id")
        print(response?.data.id)
        self.userId = response!.data.id
        self.searchUserTweets()
      } else {
        print(error?.localizedDescription ?? "")
      }
    }
    
  }
  
  
  @IBAction func searchFollowers(_ sender: Any) {
    TwitterAPIClient.searchUserId(username: followersTextField.text ?? "") {
      response, error in
      if response != nil {
        print("successfully got user's id")
        print(response?.data.id)
        self.userId = response!.data.id
        self.searchFollowers()
      } else {
        print(error?.localizedDescription ?? "")
      }
    }
  }
  
  func searchFollowers() {
    TwitterAPIClient.searchUserFollowers(userId: self.userId) {
      response, error in
      if response != nil {
        print("successfully got user's followers")
        print(response?.data)
        self.followers = response!.data
        DispatchQueue.main.async {
          let followersVC = self.storyboard!.instantiateViewController(identifier: "FollowersViewController") as! FollowersViewController
          followersVC.followers = self.followers
          self.navigationController!.pushViewController(followersVC, animated: true)
        }
      } else {
        print(error?.localizedDescription ?? "")
      }
    }
  }
  
  func searchUserTweets() {
    TwitterAPIClient.searchUserTweets(userId: self.userId) {
      response, error in
      if response != nil {
        print("successfully got user's tweets")
        print(response?.data)
        self.tweets = response?.data ?? [Tweet]()
        DispatchQueue.main.async {
          let resultVC = self.storyboard!.instantiateViewController(identifier: "ResultViewController") as! ResultViewController
          resultVC.tweets = self.tweets
          self.navigationController!.pushViewController(resultVC, animated: true)
        }
      } else {
        print(error?.localizedDescription ?? "")
      }
    }
  }
  
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
    //let resultVC = segue.destination as! ResultViewController
    
    //resultVC.tweets = self.tweets
  }
}



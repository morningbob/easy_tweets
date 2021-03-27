//
//  ResultViewController.swift
//  easyTweets
//
//  Created by Jessie Hon on 2021-03-24.
//

import UIKit

class ResultViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

  @IBOutlet weak var tableView: UITableView!
  
  var tweets = [TweetResponse]()
  var dataController : DataController!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    //print(tweets[0].text)
    tableView.delegate = self
    tableView.dataSource = self
  }
  
  
  @IBAction func saveTweetsAction(_ sender: Any) {
    
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return tweets.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = tableView.dequeueReusableCell(withIdentifier: "TweetCell", for: indexPath) as! TweetCell
    
    cell.userIdLabel.text = tweets[indexPath.row].id
    cell.tweetLabel.text = tweets[indexPath.row].text
    return cell
    
  }
  

}

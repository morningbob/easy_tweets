//
//  TweetCell.swift
//  easyTweets
//
//  Created by Jessie Hon on 2021-03-25.
//

import UIKit

internal final class TweetCell: UITableViewCell {
  
  @IBOutlet weak var userIdLabel: UILabel!
  
  @IBOutlet weak var tweetLabel: UILabel!
  
  override func prepareForReuse() {
      super.prepareForReuse()
      userIdLabel.text = nil
      tweetLabel.text = nil
  }
}

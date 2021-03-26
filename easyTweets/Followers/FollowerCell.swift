//
//  FollowerCell.swift
//  easyTweets
//
//  Created by Jessie Hon on 2021-03-26.
//

import UIKit

internal final class FollowerCell: UITableViewCell {
  

  @IBOutlet weak var usernameLabel: UILabel!
  
  @IBOutlet weak var nameLabel: UILabel!
  
  override func prepareForReuse() {
      super.prepareForReuse()
      usernameLabel.text = nil
      nameLabel.text = nil
  }
}

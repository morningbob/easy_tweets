//
//  SearchUserTweetsResponse.swift
//  easyTweets
//
//  Created by Jessie Hon on 2021-03-26.
//

import Foundation

struct SearchUserTweetsResponse : Codable {
  let data: [Tweet]
  let meta: Meta
  
}

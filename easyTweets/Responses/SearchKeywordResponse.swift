//
//  SearchKeywordResponse.swift
//  easyTweets
//
//  Created by Jessie Hon on 2021-03-25.
//

import Foundation

struct SearchKeywordResponse : Codable {
  
  let data : [TweetResponse]
  let meta : Meta
}

struct TweetResponse : Codable {
  
  let id : String
  let text : String
}

struct Meta : Codable {
  let newest_id : String
  let oldest_id : String
  let result_count : Int
  let next_token : String
}

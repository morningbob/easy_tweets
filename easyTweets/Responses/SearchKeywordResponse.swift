//
//  SearchKeywordResponse.swift
//  easyTweets
//
//  Created by Jessie Hon on 2021-03-25.
//

import Foundation

struct SearchKeywordResponse : Codable {
  
  let data : [Tweet]
  let meta : Meta
}

struct Tweet : Codable {
  
  let id : String
  let text : String
}

struct Meta : Codable {
  let newest_id : String
  let oldest_id : String
  let result_count : Int
  let next_token : String
}

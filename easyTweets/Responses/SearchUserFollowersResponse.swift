//
//  SearchUserFollowersResponse.swift
//  easyTweets
//
//  Created by Jessie Hon on 2021-03-26.
//

import Foundation

struct SearchUserFollowersResponse : Codable {
  let data: [UserEntity]
  let meta: FollowersMeta
}

struct FollowersMeta : Codable {
  let result_count: Int
  let next_token: String
}

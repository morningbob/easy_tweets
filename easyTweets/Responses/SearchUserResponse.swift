//
//  SearchUserResponse.swift
//  easyTweets
//
//  Created by Jessie Hon on 2021-03-25.
//

import Foundation

struct SearchUserResponse : Codable {
  let data: UserEntity
  //let meta: Meta
}

struct UserEntity : Codable {
  let id : String
  let name : String
  let username : String
}

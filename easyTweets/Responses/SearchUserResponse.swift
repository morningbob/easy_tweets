//
//  SearchUserResponse.swift
//  easyTweets
//
//  Created by Jessie Hon on 2021-03-25.
//

import Foundation

struct SearchUserResponse : Codable {
  let data: User
  //let meta: Meta
}

struct User : Codable {
  let id : String
  let name : String
  let username : String
}

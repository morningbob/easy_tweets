//
//  SearchUserError.swift
//  easyTweets
//
//  Created by Jessie Hon on 2021-03-25.
//

import Foundation

struct SearchUserError : Codable {
  let errors: [ErrorDetail]
}

extension SearchUserError: LocalizedError {
  var errorDescription: String? {
    return "User not found."
  }
}

struct ErrorDetail : Codable {
  let detail: String
  let title: String
  
}


//
//  SearchKeywordError.swift
//  easyTweets
//
//  Created by Jessie Hon on 2021-03-25.
//

import Foundation

struct SearchKeywordError : Codable {
  let title: String
  let type: String
  let status: Int
  let detail: String
}

extension SearchKeywordError: LocalizedError {
  var errorDescription: String? {
    return detail
  }
}


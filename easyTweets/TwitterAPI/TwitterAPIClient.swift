//
//  TwitterAPIClient.swift
//  easyTweets
//
//  Created by Jessie Hon on 2021-03-24.
//

import Foundation

class TwitterAPIClient {
  
  static let token = "AAAAAAAAAAAAAAAAAAAAALbUNwEAAAAAUFIiOyNdOm%2Fzt%2FJDaIFls0Rb60A%3D6iESHbRfmQNjhddvPeURjNbhfydCpacBV3yHZMN5eSiuAWARTg"
  
  enum Endpoints {
    static let base = "https://api.twitter.com/2/tweets"
    //static let tokenParam = ""
    
    case search(String)
    
    var stringValue: String {
      switch self {
      case .search(let query):
        return Endpoints.base + "/search/recent?query=\(query)"
      }
    }
    
    var url: URL {
      return URL(string: stringValue)!
    }
  }
  
  class func taskForKeywordSearchGETRequest<RequestType: Encodable, ResponseType: Decodable>(url: URL, responseType: ResponseType.Type, body: RequestType, completion: @escaping (ResponseType?, Error?) -> Void) {
    
  }
  
}

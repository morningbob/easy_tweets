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
  
  class func taskForKeywordSearchGETRequest<ResponseType: Decodable>(url: URL, responseType: ResponseType.Type, completion: @escaping (ResponseType?, Error?) -> Void) {
    
    var request = URLRequest(url: url)
    request.httpMethod = "GET"
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    request.addValue("application/json", forHTTPHeaderField: "Accept")
    request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
    
    let task = URLSession.shared.dataTask(with: request) { data, response, error in
      guard let data = data else {
        completion(nil, error)
        return
      }
      
      let decoder = JSONDecoder()
      
      do {
        let responseObject = try decoder.decode(SearchKeywordResponse.self, from: data)
        completion(responseObject as! ResponseType, nil)
      } catch {
        do {
          let errorResponse = try decoder.decode(SearchKeywordError.self, from: data)
          completion(nil, errorResponse as! Error)
        } catch {
          completion(nil, error)
        }
      }
    }
    task.resume()
  }
  
  class func searchKeyword(keyword: String, completion: @escaping (SearchKeywordResponse?, Error?) -> Void) {
    
    taskForKeywordSearchGETRequest(url: Endpoints.search(keyword).url, responseType: SearchKeywordResponse.self) { response, error in
      
      if let response = response {
        completion(response, nil)
      } else {
        completion(nil, error)
      }
    }
    
  }
  
}

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
    static let base = "https://api.twitter.com/2/"
    
    case searchKeyword(String)
    case searchUserId(String)
    case searchUserTweets(String)
    case searchUserFollowers(String)
    
    var stringValue: String {
      switch self {
      case .searchKeyword(let query):
        return Endpoints.base + "tweets/search/recent?query=\(query)"
      
      case .searchUserId(let username):
        return Endpoints.base + "users/by/username/\(username)"
      
      case .searchUserTweets(let id):
        return Endpoints.base + "users/\(id)/tweets"
        
      case .searchUserFollowers(let id):
        return Endpoints.base + "users/\(id)/followers"
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
  
  class func taskForSearchUserGETRequest<ResponseType: Decodable>(url: URL, responseType: ResponseType.Type, completion: @escaping (ResponseType?, Error?) -> Void) {
    
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
      print("Response data: \(String(data: data, encoding: .utf8))")
      do {
        let responseObject = try decoder.decode(SearchUserResponse.self, from: data)
        completion(responseObject as! ResponseType, nil)
      } catch {
        do {
          let errorResponse = try decoder.decode(SearchUserError.self, from: data)
          completion(nil, errorResponse as! Error)
        } catch {
          completion(nil, error)
        }
      }
    }
    task.resume()
  }
  
  class func taskForSearchUserTweetsGETRequest<ResponseType: Decodable>(url: URL, responseType: ResponseType.Type, completion: @escaping (ResponseType?, Error?) -> Void) {
    
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
      //print("Response data: \(String(data: data, encoding: .utf8))")
      do {
        let responseObject = try decoder.decode(SearchUserTweetsResponse.self, from: data)
        completion(responseObject as! ResponseType, nil)
      } catch {
        do {
          let errorResponse = try decoder.decode(SearchUserError.self, from: data)
          completion(nil, errorResponse as! Error)
        } catch {
          completion(nil, error)
        }
      }
    }
    task.resume()
  }
  
  class func taskForSearchUserFollowersGETRequest<ResponseType: Decodable>(url: URL, responseType: ResponseType.Type, completion: @escaping (ResponseType?, Error?) -> Void) {
    
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
      print("Response data: \(String(data: data, encoding: .utf8))")
      do {
        let responseObject = try decoder.decode(SearchUserFollowersResponse.self, from: data)
        completion(responseObject as! ResponseType, nil)
      } catch {
        do {
          let errorResponse = try decoder.decode(SearchUserError.self, from: data)
          completion(nil, errorResponse as! Error)
        } catch {
          completion(nil, error)
        }
      }
    }
    task.resume()
  }
  
  class func searchKeyword(keyword: String, completion: @escaping (SearchKeywordResponse?, Error?) -> Void) {
    
    taskForKeywordSearchGETRequest(url: Endpoints.searchKeyword(keyword).url, responseType: SearchKeywordResponse.self) { response, error in
      
      if let response = response {
        completion(response, nil)
      } else {
        completion(nil, error)
      }
    }
    
  }
  
  class func searchUserId (username: String, completion: @escaping (SearchUserResponse?, Error?) -> Void) {
    
    taskForSearchUserGETRequest(url: Endpoints.searchUserId(username).url, responseType: SearchUserResponse.self) { response, error in
      
      if let response = response {
        completion(response, nil)
      } else {
        completion(nil, error)
      }
    }
    
  }
  
  class func searchUserTweets (userId: String, completion: @escaping (SearchUserTweetsResponse?, Error?) -> Void) {
    
    taskForSearchUserTweetsGETRequest(url: Endpoints.searchUserTweets(userId).url, responseType: SearchUserTweetsResponse.self) { response, error in
      
      if let response = response {
        completion(response, nil)
      } else {
        completion(nil, error)
      }
    }
    
  }
  
  class func searchUserFollowers (userId: String, completion: @escaping (SearchUserFollowersResponse?, Error?) -> Void) {
    
    taskForSearchUserFollowersGETRequest(url: Endpoints.searchUserFollowers(userId).url, responseType: SearchUserFollowersResponse.self) { response, error in
      
      if let response = response {
        completion(response, nil)
      } else {
        completion(nil, error)
      }
    }
    
  }
  
}

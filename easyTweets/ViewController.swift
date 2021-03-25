//
//  ViewController.swift
//  easyTweets
//
//  Created by Jessie Hon on 2021-03-24.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var keywordTextField: UITextField!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }

  
  @IBAction func searchButton(_ sender: UIButton) {
    // send the request
    TwitterAPIClient.searchKeyword(keyword: "good") { response, error in
      if response != nil {
        print("successfully logged in")
        print(response?.data)
      } else {
        print(error?.localizedDescription ?? "")
        
      }
    }
  }
}


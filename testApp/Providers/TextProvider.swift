//
//  TextProvider.swift
//  testJatApp
//
//  Created by Николай Войтович on 8/24/18.
//  Copyright © 2018 Николай Войтович. All rights reserved.
//

import Alamofire

protocol TextProvider {
  func obtainText(accessToken: String, completion: @escaping (Result<Data>) -> Void)
}

class TextProviderImpl: TextProvider {
  func obtainText(accessToken: String, completion: @escaping (Result<Data>) -> Void) {
    let headers: [String: String] = ["Authorization" : "Bearer \(accessToken)"]
    
    Alamofire.request(ApiConstants.baseUrl + ApiConstants.Endpoint.text, method: .get, headers: headers).responseData { dataResponse in
      if let error = dataResponse.error {
        completion(.failure(error))
        return
      }
      if let data = dataResponse.value {
        completion(.success(data))
      }
    }
  }
}

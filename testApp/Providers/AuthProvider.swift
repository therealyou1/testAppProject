//
//  AuthProvider.swift
//  testJatApp
//
//  Created by Николай Войтович on 8/21/18.
//  Copyright © 2018 Николай Войтович. All rights reserved.
//

import Foundation
import Alamofire

protocol AuthProvider {
  func register(name: String, email: String, password: String, completion: @escaping (Result<Data>) -> Void)
  func login(email: String, password:String, completion: @escaping (Result<Data>) -> Void)
}


class AuthProviderlmpl: AuthProvider {
  
   func register(name: String, email: String, password: String, completion: @escaping (Result<Data>) -> Void) {
    let parameters: [String: String] = ["name": name, "email": email, "password": password]
    
    Alamofire.request(ApiConstants.baseUrl + ApiConstants.Endpoint.signup, method: .post, parameters: parameters).responseData { dataResponse in
      if let error = dataResponse.error {
        completion(.failure(error))
        return
      }
      if let data = dataResponse.value {
        completion(.success(data))
      }
    }
  }
  
  func login(email: String, password: String, completion: @escaping (Result<Data>) -> Void) {
    let parameters: [String: String] = ["email" : email, "password": password]
    
    Alamofire.request(ApiConstants.baseUrl + ApiConstants.Endpoint.login, method: .post, parameters: parameters, encoding: JSONEncoding.default).responseData { dataResponse in
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

//
//  AuthServise.swift
//  testJatApp
//
//  Created by Николай Войтович on 8/21/18.
//  Copyright © 2018 Николай Войтович. All rights reserved.
//

import Foundation


protocol AuthService {
  func signup(name: String, email: String, password: String, completion: @escaping (Result<Void>) -> Void )
  func login(email: String, password: String, completion: @escaping (Result<Void>) -> Void)
}

class AuthServiceImpl  {
  let authProvider : AuthProvider
  let keychain: KeychainService
  
  init(authProvider: AuthProvider = AuthProviderlmpl(), keychain: KeychainService = KeychainServicelmpl()) {
    self.authProvider = authProvider
    self.keychain = keychain
  }
}

extension AuthServiceImpl : AuthService {
  func signup(name: String, email: String, password: String, completion: @escaping (Result<Void>) -> Void) {
    authProvider.register(name: name, email: email, password: password) { result in
      switch result {
      case .success(let signupResponseData):
        do {
          let accessToken = try JSONDecoder().decode(AccessToken.self, from: signupResponseData)
          self.saveTokenToKeychain(accessToken)
          completion(.success(()))
        } catch {
          completion(.failure(error))
        }
      case .failure(let error):
        completion(.failure(error))
      }
    }
  }
  
  func login(email: String, password: String, completion: @escaping (Result<Void>) -> Void) {
    authProvider.login(email: email, password: password) { result in
      switch result {
      case .success(let loginResponseData):
        do {
          let accessToken = try JSONDecoder().decode(AccessToken.self, from: loginResponseData)
          self.saveTokenToKeychain(accessToken)
          completion(.success(()))
        } catch {
          completion(.failure(error))
        }
      case .failure(let error):
        completion(.failure(error))
      }
    }
  }
  
  private func saveTokenToKeychain(_ accessToken: AccessToken) {
    keychain.set(accessToken.accessToken, for: .accessToken)
  }
}

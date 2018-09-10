//
//  File.swift
//  testJatApp
//
//  Created by Николай Войтович on 8/22/18.
//  Copyright © 2018 Николай Войтович. All rights reserved.
//

import Foundation
import KeychainSwift

protocol KeychainService {
  func get(forKey key: KeychainKey) -> String?
  func set(_ string: String, for key: KeychainKey)
}

class KeychainServicelmpl : KeychainService {
  let keychain: KeychainSwift
  
  func get(forKey key: KeychainKey) -> String? {
    return keychain.get(key.rawValue)
  }
  
  func set(_ string: String, for key: KeychainKey) {
    keychain.set(string, forKey: key.rawValue)
  }
  
  init(keychainSwift: KeychainSwift = KeychainSwift()) {
    self.keychain = keychainSwift
  }
}

enum KeychainKey: String {
  case accessToken
}

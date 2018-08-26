//
//  ApiConstants.swift
//  testJatApp
//
//  Created by Николай Войтович on 8/21/18.
//  Copyright © 2018 Николай Войтович. All rights reserved.
//

import Foundation

enum ApiConstants {
  static let baseUrl = "https://apiecho.cf/api/"
  enum Endpoint {
    static let signup = "signup/"
    static let login = "login/"
    static let text = "get/text/"
  }
}

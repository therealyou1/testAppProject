//
//  AccessToken.swift
//  testJatApp
//
//  Created by Николай Войтович on 8/21/18.
//  Copyright © 2018 Николай Войтович. All rights reserved.
//

import Foundation


struct AccessToken: Decodable {
  let accessToken: String
  
  init(from decoder: Decoder) throws {
    let rootContainer = try decoder.container(keyedBy: RootCodingKeys.self)
    let dataContainer = try rootContainer.nestedContainer(keyedBy: DataCodingKeys.self, forKey: .data)
    accessToken = try dataContainer.decode(String.self, forKey: .accessToken)
  }
  
  enum RootCodingKeys: String, CodingKey {
    case success
    case data
  }
  
  enum DataCodingKeys: String, CodingKey {
    case accessToken = "access_token"
  }
}

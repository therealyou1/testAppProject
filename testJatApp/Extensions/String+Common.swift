//
//  String+Common.swift
//  testJatApp
//
//  Created by Николай Войтович on 8/24/18.
//  Copyright © 2018 Николай Войтович. All rights reserved.
//

import Foundation

extension String {
  func occurenciesOfEachCharacter() -> [Character: Int] {
    return reduce([:], { dictionary, character -> [Character: Int] in
      var dictionary = dictionary
      let currentCount = dictionary[character] ?? 0
      dictionary[character] = currentCount + 1
      return dictionary
    })
  }
}

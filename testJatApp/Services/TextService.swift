//
//  TextService.swift
//  testJatApp
//
//  Created by Николай Войтович on 8/24/18.
//  Copyright © 2018 Николай Войтович. All rights reserved.
//

import Foundation

struct CharacterOccurency {
  let char: Character
  let numberOfOccurencies: Int
}

protocol TextService {
  func obtainText(completion: @escaping (Result<String>) -> Void)
  func makeOccurencyModels(fromDictionary dictionary: [Character: Int]) -> [CharacterOccurency]
}

class TextServiceImpl {
  let textProvider: TextProvider
  let keychainService: KeychainService
  
  init(textProvider: TextProvider = TextProviderImpl(), keychainService: KeychainService = KeychainServicelmpl()) {
    self.textProvider = textProvider
    self.keychainService = keychainService
  }
}

extension TextServiceImpl: TextService {
  func obtainText(completion: @escaping (Result<String>) -> Void) {
    guard let accessToken = keychainService.get(forKey: .accessToken) else { return }
    textProvider.obtainText(accessToken: accessToken) { result in
      switch result {
      case .success(let textData):
        do {
          let dataText = try JSONDecoder().decode(DataText.self, from: textData)
          completion(.success(dataText.data))
        } catch {
          completion(.failure(error))
        }
      case .failure(let error):
        completion(.failure(error))
      }
    }
  }
  
  func makeOccurencyModels(fromDictionary dictionary: [Character : Int]) -> [CharacterOccurency] {
    var finalArray = [CharacterOccurency]()
    for (key, value) in dictionary {
      let characterOccurency = CharacterOccurency(char: key, numberOfOccurencies: value)
      finalArray.append(characterOccurency)
    }
    return finalArray.sorted(by: { $0.char < $1.char })
  }
}

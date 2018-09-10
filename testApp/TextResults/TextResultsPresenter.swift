//
//  TextResultsPresenter.swift
//  testJatApp
//
//  Created by Николай Войтович on 8/24/18.
//  Copyright © 2018 Николай Войтович. All rights reserved.
//

import Foundation

protocol TextResultsPresenterInterface {
  var view: TextResultsViewInterface? { get set }
  func obtainTextResults()
}

class TextResultsPresenter {
  let textService: TextService = TextServiceImpl()
  weak var view: TextResultsViewInterface?
}

extension TextResultsPresenter: TextResultsPresenterInterface {
  func obtainTextResults() {
    textService.obtainText { textResult in
      switch textResult {
      case .success(let text):
        let occurenciesOfEachCharacter = text.occurenciesOfEachCharacter()
        let array = self.textService.makeOccurencyModels(fromDictionary: occurenciesOfEachCharacter)
        self.view?.configure(withCharacterOccurencies: array)
      case .failure(let error): print(error)
      }
    }
  }
}

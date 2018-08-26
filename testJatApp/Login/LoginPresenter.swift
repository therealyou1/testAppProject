//
//  LoginPresenter.swift
//  testJatApp
//
//  Created by Николай Войтович on 8/24/18.
//  Copyright © 2018 Николай Войтович. All rights reserved.
//

import Foundation

protocol LoginPresenterInterface {
  var view: LoginViewInterface? { get set }
  func login(email: String, password: String)
}

class LoginPresenter {
  let authService: AuthService = AuthServiceImpl()
  weak var view: LoginViewInterface?
}

extension LoginPresenter: LoginPresenterInterface {
  func login(email: String, password: String) {
    authService.login(email: email, password: password) { result in
      switch result {
      case .success:
        self.view?.userWasSuccessfullyLogginedIn()
      case .failure(let error):
        print(error)
      }
    }
  }
}

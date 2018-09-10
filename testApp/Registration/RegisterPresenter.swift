//
//  RegisterPresenter.swift
//  testJatApp
//
//  Created by Николай Войтович on 8/24/18.
//  Copyright © 2018 Николай Войтович. All rights reserved.
//

import Foundation

protocol RegisterPresenterInterface {
  var view: RegisterViewInterface? { get set }
  func register(username: String ,email: String, password: String)
}

class RegisterPresenter {
  let authService: AuthService = AuthServiceImpl()
  weak var view: RegisterViewInterface?
}

extension RegisterPresenter: RegisterPresenterInterface {
  func register(username: String, email: String, password: String) {
    authService.signup(name: username, email: email, password: password) { result in
      switch result {
      case .success:
        self.view?.userWarSuccesfulySignUp()
      case .failure(let error):
        print(error)
      }
    }
  }
  
  
}

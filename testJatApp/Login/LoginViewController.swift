//
//  ViewController.swift
//  testJatApp
//
//  Created by Николай Войтович on 8/21/18.
//  Copyright © 2018 Николай Войтович. All rights reserved.
//

import UIKit

protocol LoginViewInterface: class {
  func userWasSuccessfullyLogginedIn()
}

class LoginViewController: UIViewController {
  var presenter: LoginPresenterInterface = LoginPresenter()
  
  @IBOutlet weak var emailTextFieldOutlet: UITextField!
  @IBOutlet weak var passwordTextFieldOutlet: UITextField!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    presenter.view = self
  }

  @IBAction func showTextAction(_ sender: Any) {
    guard let email = emailTextFieldOutlet.text, let password = passwordTextFieldOutlet.text else { return }
    presenter.login(email: email, password: password)
  }
}

extension LoginViewController: LoginViewInterface {
  func userWasSuccessfullyLogginedIn() {
    performSegue(withIdentifier: "showResult", sender: nil)
  }
}

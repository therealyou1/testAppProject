//
//  RegisterViewController.swift
//  testJatApp
//
//  Created by Николай Войтович on 8/21/18.
//  Copyright © 2018 Николай Войтович. All rights reserved.
//

import UIKit

protocol RegisterViewInterface : class {
  func userWarSuccesfulySignUp()
}

class RegisterViewController: UIViewController {
  var presenter : RegisterPresenterInterface = RegisterPresenter()

  @IBOutlet weak var usernameTextField: UITextField!
  @IBOutlet weak var emailTextField: UITextField!
  @IBOutlet weak var passwordTextFiled: UITextField!
  override func viewDidLoad() {
        super.viewDidLoad()
    presenter.view = self
    }
  @IBAction func showTextAction(_ sender: Any) {
    guard let username = usernameTextField.text, let email = emailTextField.text, let password = passwordTextFiled.text else {return}
    presenter.register(username: username, email: email, password: password)
  }
}

extension RegisterViewController : RegisterViewInterface {
  func userWarSuccesfulySignUp() {
    performSegue(withIdentifier: "showTextResult", sender: nil)
  }
}

//
//  TextResultsViewController.swift
//  testJatApp
//
//  Created by Николай Войтович on 8/24/18.
//  Copyright © 2018 Николай Войтович. All rights reserved.
//

import UIKit

protocol TextResultsViewInterface: class {
  func configure(withCharacterOccurencies characterOccurencies: [CharacterOccurency])
}

class TextResultsViewController: UIViewController {
  var presenter: TextResultsPresenterInterface = TextResultsPresenter()
  
  private var charactersOccurencies = [CharacterOccurency]()
  
  @IBOutlet weak var tableView: UITableView!
  override func viewDidLoad() {
    super.viewDidLoad()
    presenter.view = self
    
    presenter.obtainTextResults()
  }
}

extension TextResultsViewController: TextResultsViewInterface {
  func configure(withCharacterOccurencies characterOccurencies: [CharacterOccurency]) {
    charactersOccurencies = characterOccurencies
    tableView.reloadData()
  }
}

extension TextResultsViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return charactersOccurencies.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: TextResultTableViewCell.identifier, for: indexPath) as? TextResultTableViewCell
    let item = charactersOccurencies[indexPath.row]
    cell?.configure(characterOccurency: item)
    return cell!
  }
}

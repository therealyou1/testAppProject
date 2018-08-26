//
//  TextResultTableViewCell.swift
//  testJatApp
//
//  Created by Николай Войтович on 8/24/18.
//  Copyright © 2018 Николай Войтович. All rights reserved.
//

import UIKit

class TextResultTableViewCell: UITableViewCell {
  static let identifier = "TextResultTableViewCell"
  @IBOutlet weak var characterLabel: UILabel!
  @IBOutlet weak var countLabel: UILabel!
  
  func configure(characterOccurency: CharacterOccurency) {
    characterLabel.text = String(characterOccurency.char)
    countLabel.text = String(characterOccurency.numberOfOccurencies)
  }
}

//
//  MacBookUIFactory.swift
//  hw16
//
//  Created by Nur-Magomed Arsakhanov on 27.02.2025.
//

import UIKit

class MacBookUIFactory: UIFactory {
    
    func createButton(name: String) -> UIButton {
        print("MacBook specific logic")
        var button: UIButton = UIButton()
        button.titleLabel?.text = name
        return button
    }
    
    func createLabel(labelText: String) -> UILabel {
        print("MacBook specific logic")
        var label: UILabel = UILabel()
        label.text = labelText
        return label
    }
    
    func createTextField(text: String) -> UITextField {
        print("MacBook specific logic")
        var textField: UITextField = UITextField()
        textField.text = text
        return textField
    }
    
}

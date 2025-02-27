//
//  IPadUIFactory.swift
//  hw16
//
//  Created by Nur-Magomed Arsakhanov on 27.02.2025.
//

import UIKit

class IPadUIFactory: UIFactory {
    
    func createButton(name: String) -> UIButton {
        print("iPad specific logic")
        var button: UIButton = UIButton()
        button.titleLabel?.text = name
        return button
    }
    
    func createLabel(labelText: String) -> UILabel {
        print("iPad specific logic")
        var label: UILabel = UILabel()
        label.text = labelText
        return label
    }
    
    func createTextField(text: String) -> UITextField {
        print("iPad specific logic")
        var textField: UITextField = UITextField()
        textField.text = text
        return textField
    }
    
}

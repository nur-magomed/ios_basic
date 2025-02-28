//
//  IPhoneUIFactory.swift
//  hw16
//
//  Created by Nur-Magomed on 27.02.2025.
//

import UIKit

class IPhoneUIFactory: UIFactory {
    
    func createButton(name: String) -> UIButton {
        print("iPhone specific logic")
        var button: UIButton = UIButton()
        button.titleLabel?.text = name
        return button
    }
    
    func createLabel(labelText: String) -> UILabel {
        print("iPhone specific logic")
        var label: UILabel = UILabel()
        label.text = labelText
        return label
    }
    
    func createTextField(text: String) -> UITextField {
        print("iPhone specific logic")
        var textField: UITextField = UITextField()
        textField.text = text
        return textField
    }
    
}

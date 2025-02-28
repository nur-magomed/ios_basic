//
//  UIFactory.swift
//  hw16
//
//  Created by Nur-Magomed on 27.02.2025.
//

import UIKit

protocol UIFactory {
    
    func createButton(name: String) -> UIButton
    func createLabel(labelText: String) -> UILabel
    func createTextField(text: String) -> UITextField
    
}

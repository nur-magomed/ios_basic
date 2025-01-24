//
//  UserTableViewCell.swift
//  HW10
//
//  Created by Nur-Magomed Arsakhanov on 19.01.2025.
//

import UIKit

class UserTableViewCell: UITableViewCell {


    @IBOutlet weak private var userNameLabel: UILabel!
    
    public func setUserName(_ name: String) {
        userNameLabel?.text = name
    }
    
}

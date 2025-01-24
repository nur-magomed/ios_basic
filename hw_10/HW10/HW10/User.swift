//
//  User.swift
//  HW10
//
//  Created by Nur-Magomed Arsakhanov on 19.01.2025.
//

import Foundation

class User {
    
    var id: Int
    var firstName: String
    var lastName: String
    var fatherName: String
    var jobPosition: String
    var address: String

    
    init(id: Int, firstName: String, lastName: String, fatherName: String, jobPosition: String, address: String) {
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
        self.fatherName = fatherName
        self.jobPosition = jobPosition
        self.address = address
    }
    
    public var fullName: String {
        return "\(firstName) \(lastName) \(fatherName)"
    }
    
}



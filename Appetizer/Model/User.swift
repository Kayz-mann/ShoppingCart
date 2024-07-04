//
//  User.swift
//  Appetizer
//
//  Created by Balogun Kayode on 04/07/2024.
//

import Foundation


struct User: Codable {
    var firstName = ""
    var lastName = ""
    var email = ""
    var birthdate = Date()
    var extraNapkins = false
    var frequentRefills = false

}

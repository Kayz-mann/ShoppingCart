//
//  AccountViewModel.swift
//  Appetizer
//
//  Created by Balogun Kayode on 04/07/2024.
//

import SwiftUI

final class AccountViewModel: ObservableObject {
    
//    @Published var firstName = ""
//    @Published var lastName = ""
//    @Published var email = ""
//    @Published var birthdate = Date()
//    @Published var extraNapkins = false
//    @Published var frequentRefills = false
    @Published var user = User()
    @Published var alertItem: AlertItem?
    @AppStorage("user") private var userData: Data?
    
    var isValidForm: Bool {
        guard !user.firstName.isEmpty && !user.lastName.isEmpty && !user.email.isEmpty else  {
            alertItem = AlertContext.invalidForm
            return false
        }
        guard user.email.isValidEmail else {
            alertItem = AlertContext.invalidEmail
            return false
        }
        
        return true
        
    }
    
    func saveChanges()  {
        guard isValidForm else {return}
        
        do {
            let data = try JSONEncoder().encode(user)
            self.userData = data
            alertItem = AlertContext.userSaveSuccess
        } catch {
            alertItem = AlertContext.invalidUserData
        }
        
       
    }
    
    func retrieveUser() {
        //save user data by persisting
        guard let userData = userData else {return}
        
        do {
            user = try JSONDecoder().decode(User.self, from: userData)
        } catch {
            alertItem = AlertContext.invalidUserData
        }
    }


}


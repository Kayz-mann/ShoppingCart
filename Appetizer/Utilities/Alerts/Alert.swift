//
//  Alert.swift
//  Appetizer
//
//  Created by Balogun Kayode on 02/07/2024.
//

import SwiftUI


struct AlertItem: Identifiable {
    let id = UUID()
    let title: Text
    let message: Text
    let dismissButton: Alert.Button
}

struct AlertContext {
 //Network Alert
    static let invalidData = AlertItem(title: Text("Server Error"), message:Text( "Data received from the server is invalid please contact support"), dismissButton: .default(Text("OK")))
    
    static let invalidResponse = AlertItem(title: Text("Server Error"), message:Text("Invalid response from the server. Please try again later"), dismissButton: .default(Text("OK")))
    
    static let invalidURL = AlertItem(title: Text("Server Error"), message: Text("The was an issue connecting to the server. If this persists please contact support"), dismissButton: .default(Text("OK")))
    
    static let unableToComplete = AlertItem(title: Text("Server Error"), message: Text("Unable to complete your request at this time. Please check your internet connection..."), dismissButton: .default(Text("OK")))
    
//    Account Alert
    
    static let invalidForm = AlertItem(title: Text("Invalid Form"), message: Text("Please ensure all fields in the form have been filled out"), dismissButton: .default(Text("OK")))
    
    static let invalidEmail = AlertItem(title: Text("Invalid Email"), message: Text("Please ensure your email is correct"), dismissButton: .default(Text("OK")))
    
    static let userSaveSuccess = AlertItem(title: Text("Profile Save"), message: Text("Profile has been saved successfully"), dismissButton: .default(Text("OK")))
    
    static let invalidUserData = AlertItem(title: Text("Profile Error"), message: Text("There was an error recieving your profile"), dismissButton: .default(Text("OK")))



}

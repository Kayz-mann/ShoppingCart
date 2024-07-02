//
//  AppetizerListViewModel.swift
//  Appetizer
//
//  Created by Balogun Kayode on 02/07/2024.
//

import SwiftUI

final class AppetizerListViewModel: ObservableObject {
    @Published var appetizers: [Appetizer] = []
    @Published var alertItem: AlertItem?
    
    
    func getAppetizers() {
        NetworkManager.shared.getAppetizers{
            [self]
            result in
            DispatchQueue.main.async {
                switch result {
                case .success(let appetizers):
                    //set data
                    self.appetizers = appetizers
                    print(appetizers)
                case .failure(let error):
                    switch error {
                    case .invalidResponse:
                        self.alertItem = AlertContext.invalidResponse
                    
                    case .invalidURL:
                        self.alertItem = AlertContext.invalidURL
                        
                    case .invalidData:
                        self.alertItem = AlertContext.invalidData
                        
                    case .unableToComplete:
                        self.alertItem = AlertContext.unableToComplete
                    }
                }
            }
 
        }
    }

}

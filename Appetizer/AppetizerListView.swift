//
//  AppetizerListView.swift
//  Appetizer
//
//  Created by Balogun Kayode on 01/07/2024.
//

import SwiftUI

struct AppetizerListView: View {
    @State private var appetizers: [Appetizer] = []
    
    var body: some View {
        NavigationView {
            List(appetizers, id: \.id) {
                appetizer in
                AppetizerListCell(appetizer: appetizer)
            }
            .navigationTitle("Appetizers")
            .background(Color.white.edgesIgnoringSafeArea(.all))
        }
        .onAppear {
            //sort of like an onscreen mount or load thing fetch data
            getAppetizers()
        }
    }
    
    func getAppetizers() {
        NetworkManager.shared.getAppetizers{
            result in
            DispatchQueue.main.async {
                switch result {
                case .success(let appetizers):
                    //set data
                    self.appetizers = appetizers
                    print(appetizers)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
 
        }
    }
}

struct AppetizerListView_Preview: PreviewProvider {
    static var previews: some View {
        AppetizerListView()
    }
}


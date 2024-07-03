//
//  AppetizerListView.swift
//  Appetizer
//
//  Created by Balogun Kayode on 01/07/2024.
//

import SwiftUI

struct AppetizerListView: View {
    @StateObject var viewModel = AppetizerListViewModel()
    @State private var appetizers: [Appetizer] = []
    
    
    var body: some View {
        ZStack {
            NavigationView {
                List(viewModel.appetizers, id: \.id) {
                    appetizer in
                    AppetizerListCell(appetizer: appetizer)
                }
                .navigationTitle("Appetizers")
                .background(Color.white.edgesIgnoringSafeArea(.all))
            }
            .onAppear {
                //sort of like an onscreen mount or load thing fetch data
                viewModel.getAppetizers()
            }
            
            if viewModel.isLoading {
                LoadingView()
            }
        }
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(title: alertItem.title, 
                  message: alertItem.message,
                  dismissButton: alertItem.dismissButton)
        }
    }
    
    
}

struct AppetizerListView_Preview: PreviewProvider {
    static var previews: some View {
        AppetizerListView()
    }
}


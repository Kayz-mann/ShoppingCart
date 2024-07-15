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
//    @State private var isShowingDetail = false
//    @State private var selectedAppetizer: Appetizer?
    
    
    var body: some View {
        ZStack {
            NavigationView {
                List(viewModel.appetizers, id: \.id) {
                    appetizer in
                    AppetizerListCell(appetizer: appetizer)
                        .listRowSeparator(.hidden) //hide border lines
                        .onTapGesture {
                            viewModel.selectedAppetizer = appetizer
                            viewModel.isShowingDetail = true
                        }
                }
                //showing detail true? disable scroll
                .disabled(viewModel.isShowingDetail)
                .navigationTitle("Appetizers")
                .listStyle(.plain)
                .background(Color.white.edgesIgnoringSafeArea(.all))
            }
            .onAppear {
                //sort of like an onscreen mount or load thing fetch data
                viewModel.getAppetizers()
            }.blur(radius: viewModel.isShowingDetail ? 20 : 0)
            
            if viewModel.isLoading {
                LoadingView()
            }
            
            if viewModel.isShowingDetail {
                AppetizerDetailView(appetizer: viewModel.selectedAppetizer ?? MockData.sampleAppetizer, isShowingDetail: $viewModel.isShowingDetail)
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


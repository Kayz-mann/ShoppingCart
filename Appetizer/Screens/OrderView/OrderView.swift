//
//  OrderView.swift
//  Appetizer
//
//  Created by Balogun Kayode on 01/07/2024.
//

import SwiftUI

struct OrderView: View {
    @State private var orderItems = MockData.orderItems
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    List {
                        ForEach(orderItems) {appetizer in
                            AppetizerListCell(appetizer: appetizer)
                        }.onDelete(perform: deleteItems)
                    }.listStyle(PlainListStyle())
                    
                    Button {
                        print("Order placed!")
                    } label: {
                        APButton(title: "$99.99 -- Place Order")
                    }.padding(.bottom, 20)
                }
                
                if orderItems.isEmpty {
                    EmptyState(imageName: "empty-order", message: "You have no items in your order. Please add products")
                }
                               
            }.navigationTitle("Orders")

        }
    }
    
    func deleteItems(at offSets: IndexSet) {
        orderItems.remove(atOffsets: offSets)
    }
}

struct OrderView_Preview: PreviewProvider {
    static var previews: some View {
        OrderView()
    }
}

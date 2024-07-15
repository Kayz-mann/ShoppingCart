//
//  OrderView.swift
//  Appetizer
//
//  Created by Balogun Kayode on 01/07/2024.
//

import SwiftUI

struct OrderView: View {
//    @State private var orderItems = MockData.orderItems
    @EnvironmentObject var order: Order
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    List {
                        ForEach(order.items) {appetizer in
                            AppetizerListCell(appetizer: appetizer)
                        }.onDelete(perform: order.deleteItems)
                    }.listStyle(PlainListStyle())
                    
                    Button {
                        print("Order placed!")
                    } label: {
//                        APButton(title: "$\(order.totalPrice, specifier: "%.2f") - Place Order")
                        Text("$\(order.totalPrice, specifier: "%.2f") - Place Order")
                    }
                    .modifier(StandardButtonStyle())
                    .padding(.bottom, 20)
                }
                
                if order.items.isEmpty {
                    EmptyState(imageName: "empty-order", message: "You have no items in your order. Please add products")
                }
                               
            }.navigationTitle("Orders")

        }
    }
    
}

struct OrderView_Preview: PreviewProvider {
    static var previews: some View {
        OrderView()
    }
}

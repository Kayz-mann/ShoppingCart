//
//  ContentView.swift
//  Appetizer
//
//  Created by Balogun Kayode on 01/07/2024.
//

import SwiftUI

struct AppetizerTabView: View {
    @EnvironmentObject var order: Order
    
    var body: some View {
        TabView {
            AppetizerListView()
                .tabItem {
//                    Image(systemName: "house")
//                    Text("Home")
                    Label("Home", systemImage: "house")
                }
            
            AccountView()
                .tabItem {
//                    Image(systemName: "person")
//                    Text("Account")
                    Label("Account", systemImage: "person")

                }
            
            OrderView()
                .tabItem {
//                    Image(systemName: "bag")
//                    Text("Order")
                    Label("Order", systemImage: "bag")

                }
            //check number of items in cart with a badge
                .badge(order.items.count)
        }.accentColor(.brandPrimary)
    }
}

#Preview {
    AppetizerTabView()
}

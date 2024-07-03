//
//  OrderView.swift
//  Appetizer
//
//  Created by Balogun Kayode on 01/07/2024.
//

import SwiftUI

struct OrderView: View {
    var body: some View {
        NavigationView {
            Text("Order View")
                .navigationTitle("Orders")
        }
    }
}

struct OrderView_Preview: PreviewProvider {
    static var previews: some View {
        OrderView()
    }
}

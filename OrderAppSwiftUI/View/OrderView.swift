//
//  OrderView.swift
//  OrderAppSwiftUI
//
//  Created by Ahmed Yamany on 17/11/2022.
//

import SwiftUI

struct OrderView: View {
    @EnvironmentObject var order: Order
    var body: some View {
        NavigationView {
            List{
                Section{
                    ForEach(order.items) { item in
                        Text(item.name)
                    }
                }
                
                Section{
                    NavigationLink {
                        Text("Hello World!")
                    } label: {
                        Text("Place Order")
                    }

                }
            }
            .navigationTitle("Order")
            .listStyle(.insetGrouped)
        }
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
            OrderView()
                .environmentObject(Order())

        
    }
}

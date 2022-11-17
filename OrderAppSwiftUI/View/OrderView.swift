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
                    .onDelete(perform: deleteItems)
                }
                
                Section{
                    NavigationLink {
                        CheckoutView()
                    } label: {
                        Text("Place Order")
                    }

                }
                .disabled(order.items.isEmpty)
            }
            .navigationTitle("Order")
            .listStyle(.insetGrouped)
            .toolbar {
                EditButton()
            }
        }
    }
    
    private func deleteItems(at offsets: IndexSet){
        order.items.remove(atOffsets: offsets)
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
            OrderView()
                .environmentObject(Order())

        
    }
}

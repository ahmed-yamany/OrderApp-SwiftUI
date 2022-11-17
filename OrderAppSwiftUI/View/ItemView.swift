//
//  ItemView.swift
//  OrderAppSwiftUI
//
//  Created by Ahmed Yamany on 17/11/2022.
//

import SwiftUI

struct ItemView: View {
    @EnvironmentObject var order: Order
    let item: MenuItem
    var body: some View {
        VStack{
            ZStack(alignment: .bottomTrailing){
                Image(item.mainImage)
                    .resizable()
                    .scaledToFit()
                Text(item.name)
                    .padding(10)
                    .background(Color.black)
                    .foregroundColor(.white)
                    .offset(x: -5, y: -5)
            }
            Text(item.description)
                .padding()
            Button("Order me") {
                order.add(item: item)
            }
            Spacer()
        }
    }
}

struct ItemView_Previews: PreviewProvider {
    static var previews: some View {
        ItemView(item: MenuItem.example)
            .environmentObject(Order())
    }
}

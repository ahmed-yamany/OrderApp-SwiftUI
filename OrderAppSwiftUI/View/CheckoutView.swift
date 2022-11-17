//
//  CheckoutView.swift
//  OrderAppSwiftUI
//
//  Created by Ahmed Yamany on 17/11/2022.
//

import SwiftUI

struct CheckoutView: View {
    @EnvironmentObject var order: Order
    @State var paymentMethod = "Cash"
    @State var addLoyalityDetail = false
    @State var loyalityNumber = ""
    @State var tipAmount = 15
    
    @State var showingPaymentAlert = false
    
    let paymentTypes = ["Cash", "Credit Card", "iDine Points"]
    let tipAmounts = [10, 15, 20, 25, 0]
    
    var totalPrice: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        let total = Double (order.total)
        let tipValue = total / 100 * Double(tipAmount)
        return formatter.string (from: NSNumber (value: total + tipValue)) ?? "$0"
    }


    var body: some View {
        Form{
            Section{
                Picker("How do you want to pay", selection: $paymentMethod) {
                    ForEach(paymentTypes, id: \.self) {
                        Text($0)
                    }
                }
                Toggle("Add iDine loyalty card", isOn: $addLoyalityDetail.animation())
                if addLoyalityDetail{
                    TextField("Enter your loyal id", text: $loyalityNumber)
                }
            }
            
            Section(header:Text("Add a tip?")) {
                Picker("Percentage?", selection: $tipAmount) {
                    ForEach(tipAmounts, id: \.self) {
                        Text("\($0)")
                    }
                }.pickerStyle(.segmented)
            }
            
            Section {
                Button("Confirm Order") {
                    showingPaymentAlert.toggle()
                }
            } header: {
                Text("Total \(totalPrice)")
            }

        }
        .navigationTitle("Payment")
        .navigationBarTitleDisplayMode(.inline)
        .alert(isPresented: $showingPaymentAlert) {
            Alert(title: Text("Order Confirmed"), message: Text("Your total was \(totalPrice) – thank you!"), dismissButton: .default(Text("ok")))
        }
        

    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView()
            .environmentObject(Order())
    }
}

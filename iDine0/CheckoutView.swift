//
//  CheckoutView.swift
//  iDine0
//
//  Created by Student on 10/10/21.
//

import SwiftUI

struct CheckoutView: View {
    @State private var paymentType = "Cash"
    @EnvironmentObject var order: Order
    @State private var addLoyaltyDetails = false
    @State private var loyaltyNumber = ""
    @State private var tipAmount = 15
    
    let tipAmounts = [10, 15, 20, 25, 0]
    
    let paymentTypes = ["Cash", "Credit Card", "iDine Points"]
    
    var body: some View {
        Form {
            Section {
                Picker("How do you want to pay?", selection: $paymentType) {
                    ForEach(paymentTypes, id: \.self) {
                        Text($0)
                        Toggle("Add iDine loyalty card", isOn: $addLoyaltyDetails.animation())

                        if addLoyaltyDetails {
                            TextField("Enter your iDine ID", text: $loyaltyNumber)
                        }
                    }
                }
            }
            Section(header: Text("Add a tip?")) {
                Picker("Percentage:", selection: $tipAmount) {
                    ForEach(tipAmounts, id: \.self) {
                        Text("\($0)%")
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            Section(header:
                Text("TOTAL: $100")
            ) {
                Button("Confirm order") {
                    // place the order
                }
            }
        }
        .navigationTitle("Payment")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView().environmentObject(Order())
    }
}

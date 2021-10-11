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
    @State private var showingPaymentAlert = false
    
    let tipAmounts = [10, 15, 20, 25, 0]
    
    let paymentTypes = ["Cash", "Credit Card", "iDine Points"]
    
    var totalPrice: String {
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        
        let total = Double(order.total)
        let tipValue = total / 100 * Double(tipAmount)
        
        return formatter.string(from: NSNumber(value: total + tipValue)) ?? "$0"
        
    }
    
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
                    showingPaymentAlert.toggle()
                }
            }
            Section(header:
                        Text("TOTAL: \(totalPrice)")
                        .font(.largeTitle)
            ) {
                
            }
            .alert(isPresented: $showingPaymentAlert) {
                Alert(title: Text("Order confirmed"), message: Text("Your total was \(totalPrice) – thank you!"), dismissButton: .default(Text("OK")))
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
}

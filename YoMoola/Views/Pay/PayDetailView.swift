//
//  PayDetailView.swift
//  YoMoola
//
//  Created by Blue Heron on 2/5/23.
//

import SwiftUI

private let iconSize: CGFloat = 40
private let coinSize: CGFloat = 30

// ----------------------------------------
// # PayDetailView
// ----------------------------------------
struct PayDetailView: View {
    init() {
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor(Color.accentColorDark)]
    }
    @FocusState var isInputActive: Bool
    @State var agreeToDifference = false
    @State var coinAmount: String = "50"
    @State var creditCardModal = false
    @State var payReceiveBool: Bool = true
    var costDifference: String {
        let coinAmountInt = Int(coinAmount) ?? 0
        return String(requestedAmount - coinAmountInt)
    }
    var invoiceNumber = "8271"
    var requestedAmount: Int = 75
    
    // ----------------------------------------
    // ## body
    // ----------------------------------------
    var body: some View {
        FullScreenBackgroundScrollView(backgroundImage: "background-2") {
            Spacer().frame(height: 100)
            
            // ----------------------------------------
            // ### main content
            // ----------------------------------------
            WhiteCardVStack {
                VStack(alignment: .leading) {
                    MerchantInformation
                    InvoiceDetails
                    RequestedCoinAmount
                    Divider()
                        .padding(.vertical)
                    WithdrawFrom
                    Divider()
                        .padding(.vertical)
                    TransferDetails
                    PayButton
                }
                .padding(10)
            }
            .padding()
            .padding(.horizontal)
            
            Spacer().frame(height: 150)
        }
        .foregroundColor(.text)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                HStack {
                    Text("Transfer")
                        .foregroundColor(.accentColorDark)
                        .fontWeight(.bold)
                        .font(.title3)
                    
                }
            }
        }
    }
    
    // ----------------------------------------
    // ## Components
    // ----------------------------------------
    // --- MerchantInformation
    var MerchantInformation: some View {
        VStack(alignment: .leading) {
            // --- Wallet Name
            HStack(spacing: 10.0) {
                CircleImage(image: "yomoola-logo-padding-bg-green", width: iconSize * 1.25)
                Text("Wallet Name")
                    .font(.title2)
            }
        }
    }
    // --- InvoiceDetails
    var InvoiceDetails: some View {
        HStack {
            Spacer().frame(width: 5)
            VStack(alignment: .leading, spacing: 8) {
                // --- HStack Invoice Number
                HStack {
                    Text("Invoice")
                        .font(.title2)
                        .fontWeight(.medium)
                    Spacer()
                    Text("#\(invoiceNumber)")
                        .font(.title2)
                        .fontWeight(.medium)
                }
                // --- VStack invoice items
                // TODO: invoice item object
                VStack(alignment: .leading, spacing: 8) {
                    ItemInvoice(quantity: 1, itemName: "Raspberry Gummies", cost: 8.75)
                    ItemInvoice(quantity: 1, itemName: "Marionberry Gummies", cost: 8.75)
                    ItemInvoice(quantity: 2, itemName: "Maui Wowie All-In-One", cost: 25.50)
                    ItemInvoice(quantity: 1, itemName: "Green Crack All-In-One", cost: 25.50)
                }
                .foregroundColor(.textGray)
                //.padding(.leading)
                HStack { Spacer() }
            }
        }
        .padding(.vertical)
    }
    var RequestedCoinAmount: some View {
        VStack(alignment: .leading) {
            Text("Transfer Total")
                .font(.title3)
            HStack {
                CircleImage(image: "coin-icon-USDC", width: coinSize)
                Spacer()
                Text(String(requestedAmount))
                    .foregroundColor(.white)
                    .fontWeight(.medium)
                    .font(.title2)
                    .multilineTextAlignment(.trailing)
                    .fixedSize(horizontal: true, vertical: true)
                    .keyboardType(.numberPad)
            }
            .padding(.vertical, 10)
            .padding(.horizontal, 15)
            .background(Capsule().fill(Color.accentColorDark.opacity(0.5)))
        }
        .padding(.bottom)
    }
    // --- WithdrawFrom
    var WithdrawFrom: some View {
        VStack(alignment: .leading) {
            // --- Withdraw from
            Text("Withdraw from")
                .font(.title3)
            // --- Select the coin
            HStack(spacing: 10.0) {
                CircleImage(image: "coin-icon-USDC", width: iconSize)
                Text("USDC")
                    .font(.title2)
                Spacer()
                Text("50")
                    .font(.title2)
            }
            .padding()
            .background(Capsule().fill(Color.accentColorLight))
            .padding(.bottom)
            // --- Input Amount
            HStack {
                CircleImage(image: "coin-icon-USDC", width: coinSize)
                Spacer()
                TextField("Coin quantity", text: $coinAmount)
                    .font(.title2)
                    .multilineTextAlignment(.trailing)
                    .keyboardType(.numberPad)
                    .focused($isInputActive)
                    .toolbar {
                        ToolbarItemGroup(placement: .keyboard) {
                            Spacer()
                            Button(action: {
                                isInputActive = false
                            }) {
                                JournalKeyboardSaveButton()
                            }
                        }
                    }
            }
            .padding(.vertical, 10)
            .padding(.horizontal, 18)
            .overlay(
                Capsule(style: .continuous)
                    .stroke(Color.accentColorDark, style: StrokeStyle(lineWidth: 3))
            )
            // --- Total Balance
            HStack {
                Spacer()
                Text("My Total Balance:")
                    .foregroundColor(.text)
                    //.underline()
                Text("$50")
                    .foregroundColor(.accentColorDark)
                    .fontWeight(.bold)
                    .font(.title3)
            }
        }
    }
    // --- TransferDetails
    var TransferDetails: some View {
        VStack(spacing: 15) {
            Text("Transfer Details")
                .fontWeight(.medium)
                .font(.title2)
                .foregroundColor(.text)
            
            // --- Charge the difference
            HStack {
                Text("Charge the difference:")
                Text("$\(costDifference)")
                    .foregroundColor(.accentColorDark)
                    .fontWeight(.bold)
                    .font(.title3)
            }
            
            // --- Credit Card Modal
            Button(action: { creditCardModal.toggle() }) {
                HStack(spacing: 10.0) {
                    Image(systemName: "creditcard.circle")
                        .resizable()
                        .scaledToFit()
                        .frame(width: iconSize)
                    Text("Visa **** 2988")
                    Spacer()
                }
                .foregroundColor(.accentColor)
                .padding()
                .background(RoundedRectangle(cornerRadius: cardCornerRadius, style: .continuous).fill(Color.accentColorLight))
                .padding(.vertical, 5.0)
            }
            .sheet(isPresented: $creditCardModal) {
                Text("Credit Card Selection")
            }
            
            // --- Agree to charge my credit card
            Button(action: { agreeToDifference.toggle() }) {
                HStack(alignment: .top) {
                    Text(Image(systemName: agreeToDifference ? "checkmark.square.fill" : "square"))
                        .foregroundColor(.accentColorDark)
                        .font(.subheadline)
                    Text("Agree to YoMoola charging Visa **** 2988")
                        .foregroundColor(.accentColorDark)
                        .font(.subheadline)
                        .multilineTextAlignment(.leading)
                    Spacer()
                }
            }
        }
        .foregroundColor(.text)
    }
    var PayButton: some View {
        HStack {
            Spacer()
            Button(action: { print("TODO pay workflow") }) {
                HStack {
                    Text("Pay")
                        .foregroundColor(.white)
                        .fontWeight(.medium)
                        .font(.title2)
                }
            }
            .padding(.vertical, 6.0)
            .padding(.horizontal)
            .padding(.horizontal)
            .background(Capsule().fill(Color.accentColor))
            Spacer()
        }
    }
}

struct PayDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PayDetailView()
    }
}

/*
 TODO
 - change the value on the bottom if the USDC value changes.
 
 1 × Raspberry Gummies
 8.75

 1 × Marionberry Gummies
 8.75

 1 × Sour Apple Gummies
 8.75

 1 × Maui Wowie All In One
 25.50

 1 × Green Crack Live Resin All-In-One
 25.50

 Subtotal
 $77.25

 Tax
 $22.75

 Total
 $100.00
 */

struct ItemInvoice: View {
    var quantity: Int
    var itemName: String
    var cost: Float
    var total: String {
        "$\(String(Float(quantity) * cost))"
    }
    var body: some View {
        HStack {
            Text("\(String(quantity)) x \(itemName)")
            Spacer()
            Text(total)
        }
        .foregroundColor(.textGray)
    }
}
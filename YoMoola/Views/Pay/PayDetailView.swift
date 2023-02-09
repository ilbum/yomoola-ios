//
//  PayDetailView.swift
//  YoMoola
//
//  Created by Blue Heron on 2/5/23.
//

import SwiftUI

// TODO: round up at the purchase the difference and add the credit card fee

private let iconSize: CGFloat = 40
private let coinSize: CGFloat = 30

// ----------------------------------------
// # PayDetailView
// ----------------------------------------
struct PayDetailView: View {
    init(dataCreditCards: [CreditCardItem]) {
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor(Color.accentColorDark)]
        self.dataCreditCards = dataCreditCards
        _activeCreditCard = .init(initialValue: dataCreditCards[0])
    }
    // ---- Parameters
    var dataCreditCards: [CreditCardItem]
    @State var activeCreditCard: CreditCardItem
    
    // ---- Properties
    @FocusState var isInputActive: Bool
    @State var agreeToDifference = false
    @State var coinAmount: String = "50"
    @State var creditCardModal = false
    @State var payReceiveBool: Bool = true
    var costDifference: Float {
        let coinAmountInt = Float(coinAmount) ?? 0
        
        return (invoiceTotal + (invoiceTotal * 0.0255)) - coinAmountInt
    }
    var costDifferenceString: String { "$\(String(costDifference))" }
    var invoiceItems = [
        InvoiceItem(quantity: 1, name: "Raspberry Gummies", price: 8.75),
        InvoiceItem(quantity: 1, name: "Marionberry Gummies", price: 8.75),
        InvoiceItem(quantity: 2, name: "Maui Wowie All-In-One", price: 25.50),
        InvoiceItem(quantity: 1, name: "Green Crack All-In-One", price: 25.50)
    ]
    var invoiceNumber = "8271"
    var invoiceSubtotal: Float {
        var subTotal: Float = 0.0
        for invoiceItem in invoiceItems { subTotal += invoiceItem.price }
        return subTotal
    }
    var invoiceTaxes: Float {
        return invoiceSubtotal * 0.25
    }
    var invoiceTaxesString: String { "$\(String(invoiceTaxes))" }
    var invoiceTotal: Float {
        return invoiceSubtotal + invoiceTaxes
    }
    var invoiceTotalString: String { String(invoiceTotal) }
    var walletName = "Merchant Name"
    
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
                    Text(walletName)
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
                CircleImage(image: "merchant-1", width: iconSize * 1.25)
                Text(walletName)
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
                    ForEach(invoiceItems) { InvoiceItem in
                        InvoiceItemRow(quantity: InvoiceItem.quantity, itemName: InvoiceItem.name, cost: InvoiceItem.price)
                    }
                    HStack {
                        Text("Regulatory & State Taxes")
                        Spacer()
                        Text(invoiceTaxesString)
                    }
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
                Text(invoiceTotalString)
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
            
            // --- Credit Card Modal
            Button(action: { creditCardModal.toggle() }) {
                CreditCardRow(creditCard: activeCreditCard)
            }
            .sheet(isPresented: $creditCardModal) {
                CreditCardModal(activeCreditCard: $activeCreditCard, dataCreditCards: dataCreditCards)
            }
            
            // --- Charge the difference
            VStack {
                Text("Purchase the difference:")
                Text(costDifferenceString)
                    .foregroundColor(.accentColorDark)
                    .fontWeight(.bold)
                    .font(.title3)
            }
            
            // --- Agree to charge my credit card
            Button(action: { agreeToDifference.toggle() }) {
                HStack(alignment: .top) {
                    Text(Image(systemName: agreeToDifference ? "checkmark.square.fill" : "square"))
                        .foregroundColor(.accentColorDark)
                        .font(.subheadline)
                    Text("Agree to YoMoola charging credit card \(dataCreditCards[0].type) \(dataCreditCards[0].displayNumber). This includes a 2.75% coin purchasing fee.")
                        .foregroundColor(.accentColorDark)
                        .font(.subheadline)
                        .multilineTextAlignment(.leading)
                    Spacer()
                }
                .padding(.bottom)
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
            .background(Capsule().fill(agreeToDifference ? Color.accentColor : Color.gray))
            Spacer()
        }
    }
}

struct PayDetailView_Previews: PreviewProvider {
    static var dataCreditCards = [
        CreditCardItem(name: "Chase", type: "Visa", number: "4024007128069472"),
        CreditCardItem(name: "Bank of America", type: "Visa", number: "4916280452115283")
    ]
    static var previews: some View {
        PayDetailView(dataCreditCards: dataCreditCards)
    }
}

// ----------------------------------------
// # PayDetailView Components
// ----------------------------------------
struct InvoiceItemRow: View {
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

struct CreditCardModal: View {
    @Environment(\.dismiss) private var dismiss
    // ---- Parameters
    @Binding var activeCreditCard: CreditCardItem
    @State var dataCreditCards: [CreditCardItem]
    var body: some View {
        NavigationView {
            List {
                ForEach(dataCreditCards) { creditCard in
                    Button(action: {
                        activeCreditCard = creditCard
                        dismiss()
                    }) {
                        HStack(spacing: 15) {
                            ResizedSfSymbolImage(image: "creditcard.circle.fill", width: 60)
                                .foregroundColor(Color.accentColor)
                            VStack(alignment: .leading, spacing: 5) {
                                Text(creditCard.name)
                                    .font(.title3)
                                Text(creditCard.type)
                            }
                            Spacer()
                            Text(creditCard.displayNumber)
                        }
                        .padding(.vertical, 6)
                    }
                }
            }
            .navigationTitle("Credit Cards")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button(action: { dismiss() }) {
                        Image(systemName: "chevron.down")
                            .foregroundColor(.accentColor)
                    }
                }
            }
        }
    }
}

//
//  PayDetailView.swift
//  YoMoola
//
//  Created by Blue Heron on 2/5/23.
//

import CodeScanner
import SwiftUI

private let iconSize: CGFloat = 40
private let coinSize: CGFloat = 30

// ----------------------------------------
// # PayDetailView
// ----------------------------------------
struct PayDetailView: View {
    // ----------------------------------------
    // ## properties
    // ----------------------------------------
    init(dataCreditCards: [CreditCardModel]) {
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor(Color.accentColorDark)]
        self.dataCreditCards = dataCreditCards
        _activeCreditCard = .init(initialValue: dataCreditCards[0])
    }
    // ---- Parameters
    var dataCreditCards: [CreditCardModel]
    @State var activeCreditCard: CreditCardModel
    
    // ---- Properties
    @FocusState private var isInputActive: Bool
    @State private var agreeToDifference = false
    @State private var coinAmount: String = "50"
    @State private var creditCardModal = false
    @State private var paySuccessBool = false // TODO: update this post view done
    @State private var showScanner = true
    private var showContent: Bool { showScanner }
    private var costDifference: Float {
        let coinAmountInt = Float(coinAmount) ?? 0
        return (invoiceTotal + (invoiceTotal * 0.0255)) - coinAmountInt
    }
    private var costDifferenceString: String { "$\(String(costDifference))" }
    private var invoiceItems = [
        InvoiceModel(quantity: 1, name: "Raspberry Gummies", price: 8.75),
        InvoiceModel(quantity: 1, name: "Marionberry Gummies", price: 8.75),
        InvoiceModel(quantity: 2, name: "Maui Wowie All-In-One", price: 25.50),
        InvoiceModel(quantity: 1, name: "Green Crack All-In-One", price: 25.50)
    ]
    private var invoiceNumber = "8271"
    private var invoiceSubtotal: Float {
        var subTotal: Float = 0.0
        for invoiceItem in invoiceItems { subTotal += invoiceItem.price }
        return subTotal
    }
    private var invoiceTaxes: Float {
        return invoiceSubtotal * 0.25
    }
    private var invoiceTaxesString: String { "$\(String(invoiceTaxes))" }
    private var invoiceTotal: Float {
        return invoiceSubtotal + invoiceTaxes
    }
    private var invoiceTotalString: String { String(invoiceTotal) }
    private var walletid = "harborside"
    private var walletName = "Harborside"
    
    // ----------------------------------------
    // MARK: body
    // ----------------------------------------
    var body: some View {
        FullScreenBackgroundScrollView(backgroundImage: "background-2") {
            Spacer().frame(height: 100)
            // ----------------------------------------
            // ### main content
            // ----------------------------------------
            if !showContent {
                if paySuccessBool {
                    PaySuccessCard
                } else {
                    PayCard
                }
            }
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
            ToolbarItem(placement: .primaryAction) {
                Button {
                    showScanner.toggle()
                } label: {
                    Label("Scan", systemImage: "qrcode.viewfinder")
                }
                .sheet(isPresented: $showScanner) {
                    CodeScannerView(codeTypes: [.qr], simulatedData: "Harborside", completion: handleScan)
                }
            }
        }
//        if showScanner {
//            CameraView(showScanner: $showScanner)
//        } else {
//            FullScreenBackgroundScrollView(backgroundImage: "background-2") {
//                Spacer().frame(height: 100)
//                // ----------------------------------------
//                // ### main content
//                // ----------------------------------------
//                if paySuccessBool {
//                    PaySuccessCard
//                } else {
//                    PayCard
//                }
//                Spacer().frame(height: 150)
//            }
//            .foregroundColor(.text)
//            .navigationBarTitleDisplayMode(.inline)
//            .toolbar {
//                ToolbarItem(placement: .principal) {
//                    HStack {
//                        Text(walletName)
//                            .foregroundColor(.accentColorDark)
//                            .fontWeight(.bold)
//                            .font(.title3)
//
//                    }
//                }
//            }
//        }
    }
    
    // ----------------------------------------
    // ## Subviews
    // ----------------------------------------
    // ----- PayCard
    var PayCard: some View {
        PayDetailWhiteCard {
            MerchantInformation
            InvoiceDetails
            RequestedCoinAmount
            Divider()
                .padding(.vertical)
            WithdrawFrom
            Divider()
                .padding(.vertical)
            TransferDetails
            Pay
        }
    }
    // ----- PaySuccessCard
    var PaySuccessCard: some View {
        VStack {
            PayDetailWhiteCard {
                HStack {
                    MerchantInformation
                    Spacer()
                    Text("\(Image(systemName: "checkmark"))")
                        .foregroundColor(.accentColorDark)
                        .fontWeight(.bold)
                        .font(.largeTitle)
                }
                InvoiceDetails
                RequestedCoinAmount
            }
            PayDetailWhiteCard {
                TitleUnderline(title: "Transfer Details")
                CoinsTransferredRow
                CreditCardChargeRow
            }
        }
    }
    
    // ----------------------------------------
    // MARK: PayCard Components
    // PaySuccessCard shares some of these views
    // ----------------------------------------
    // ----- InvoiceDetails
    var InvoiceDetails: some View {
        HStack {
            Spacer().frame(width: 5)
            VStack(alignment: .leading, spacing: 8) {
                // ----- HStack Invoice Number
                HStack {
                    Text("Invoice")
                        .font(.title2)
                        .fontWeight(.medium)
                    Spacer()
                    Text("#\(invoiceNumber)")
                        .font(.title2)
                        .fontWeight(.medium)
                }
                // ----- VStack invoice items
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
    // ----- MerchantInformation
    var MerchantInformation: some View {
        VStack(alignment: .leading) {
            // ----- Wallet Name
            HStack(spacing: 10.0) {
                CircleImage(image: "merchant-1", width: iconSize * 1.25)
                VStack(alignment: .leading) {
                    Text(walletName)
                        .font(.title2)
                    Text("@\(walletid)")
                        .foregroundColor(.textGray)
                        .font(.callout)
                }
            }
        }
    }
    // ----- RequestedCoinAmount
    var RequestedCoinAmount: some View {
        TransferCapsule(title: "Transfer Total", coinString: invoiceTotalString)
    }
    // ----- Pay
    var Pay: some View {
        HStack {
            Spacer()
            if agreeToDifference {
                Button {
                    withAnimation(Animation.easeIn(duration: screenAnimationDuration)) {
                        paySuccessBool = true
                    }
                } label: {
                    PayButton(color: Color.accentColor)
                }
            } else {
                PayButton(color: Color.gray)
            }
            Spacer()
        }
        .padding(.bottom)
    }
    // ----- TransferDetails
    var TransferDetails: some View {
        VStack(spacing: 15) {
            Text("Transfer Details")
                .fontWeight(.medium)
                .font(.title2)
                .foregroundColor(.text)
            
            // ----- Credit Card Modal
//            Button(action: { creditCardModal.toggle() }, label: {
//                CreditCardRow(creditCard: activeCreditCard)
//            })
//            .sheet(isPresented: $creditCardModal) {
//                CreditCardModal(activeCreditCard: $activeCreditCard, dataCreditCards: dataCreditCards)
//            }
            
            // ----- Charge the difference
            VStack {
                Text("Purchase the difference:")
                Text(costDifferenceString)
                    .foregroundColor(.accentColorDark)
                    .fontWeight(.bold)
                    .font(.title3)
            }
            
            // ----- Agree to charge my credit card
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
    // ----- WithdrawFrom
    var WithdrawFrom: some View {
        VStack(alignment: .leading) {
            // ----- Withdraw from
            Text("Withdraw from")
                .font(.title3)
            // ----- Select the coin
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
            // ----- Input Amount
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
            // ----- Total Balance
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
    // ----------------------------------------
    // MARK: PaySuccessCard Components
    // ----------------------------------------
    var CoinsTransferredRow: some View {
        TransferCapsule(title: "Coins Transferred", coinString: coinAmount)
            .padding(.top)
    }
    var CreditCardChargeRow: some View {
        VStack {
            HStack(alignment: .top) {
                VStack(alignment: .leading) {
                    Text(activeCreditCard.name)
                    Text(activeCreditCard.type + " " + activeCreditCard.displayNumber)
                }
                Spacer()
                Text("$\(String(costDifference))")
            }
            .foregroundColor(.accentColorDark)
        }
        .padding(.bottom)
    }
    
    // ----------------------------------------
    // MARK: Functions
    // ----------------------------------------
    func handleScan(result: Result<ScanResult, ScanError>) {
        showScanner = false
        
    }
}

struct PayDetailView_Previews: PreviewProvider {
    static var dataCreditCards = [
        CreditCardModel(name: "Chase", type: "Visa", number: "4024007128069472"),
        CreditCardModel(name: "Bank of America", type: "Visa", number: "4916280452115283")
    ]
    static var previews: some View {
        PayDetailView(dataCreditCards: dataCreditCards)
    }
}

// ----------------------------------------
// # PayDetailView Components
// ----------------------------------------
struct CreditCardModal: View {
    @Environment(\.dismiss) private var dismiss
    // ---- Parameters
    @Binding var activeCreditCard: CreditCardModel
    @State var dataCreditCards: [CreditCardModel]
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
            .navigationTitle("Payment Method")
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

private struct InvoiceItemRow: View {
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

private struct PayButton: View {
    var color: Color
    var body: some View {
        HStack {
            Text("Pay")
                .foregroundColor(.white)
                .fontWeight(.medium)
                .font(.title2)
        }
        .padding(.vertical, 6.0)
        .padding(.horizontal)
        .padding(.horizontal)
        .background(Capsule().fill(color))
    }
}

private struct PayDetailWhiteCard<Content: View>: View {
    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }
    var content: () -> Content
    var body: some View {
        WhiteCardVStack {
            VStack(alignment: .leading) {
                content()
            }
            .padding(10)
        }
        .padding()
        .padding(.horizontal)
    }
}

private struct TitleUnderline: View {
    var title: String
    var body: some View {
        HStack {
            Spacer()
            Text(title)
                .foregroundColor(.accentColorDark)
                .fontWeight(.bold)
                .font(.title)
                .padding(.horizontal)
                .overlay(Rectangle().frame(height: 1).offset(y: 10), alignment: .bottom).foregroundColor(.accentColorDark)
            Spacer()
        }
    }
}

private struct TransferCapsule: View {
    var title: String
    var coinString: String
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.title3)
            HStack {
                CircleImage(image: "coin-icon-USDC", width: coinSize)
                Spacer()
                Text(coinString)
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
}

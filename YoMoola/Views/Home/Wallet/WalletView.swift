//
//  WalletView.swift
//  YoMoola
//
//  Created by Blue Heron on 2/3/23.
//

import SwiftUI

struct WalletView: View {
    var body: some View {
        List {
            CurrentBalance
                //.padding(.vertical, 5.0)
                .listRowSeparator(.hidden)
            ActionsRow
                .padding(.bottom, 5.0)
            CryptoMarketRow(imageString: "coin-icon-USDC", name: "USD Coin", ticker: "$1 × 50", value: "50.00", percentChange: 0.00)
//            CryptoMarketRow(imageString: "coin-icon-ETH", name: "Ethereum", ticker: "$1,679.53 × 0", value: "0.00", percentChange: 0.55)
//            CryptoMarketRow(imageString: "coin-icon-BTC", name: "Bitcoin", ticker: "$23,247.90 × 0", value: "0.00", percentChange: 0.01)
        }
        .listStyle(.inset)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                HStack {
                    Text("Wallet")
                        .foregroundColor(.accentColorDark)
                        .fontWeight(.bold)
                        .font(.title3)
                    
                }
            }
        }
        .toolbar {
            Button(action: { print("TODO refresh") }) {
                Label {
                    Text("Refresh")
                } icon: {
                    Image(systemName: "clock.arrow.circlepath")
                }
            }
        }
    }
    
    // ----------------------------------------
    // # Components
    // ----------------------------------------
    var CurrentBalance: some View {
        HStack {
            Text("")
            Spacer()
            VStack {
                Text("Current Balance")
                    .padding(.bottom, -4.0)
                // Balance Value
                Text(balance)
                    .font(.title)
                    .fontWeight(.bold)
                // Percentage Change
                PercentageChangeCapsule(percentChange: walletPercentChange)
            }
            Spacer()
            Text("")
        }
        .foregroundColor(.text)
        .padding()
        .background(RoundedRectangle(cornerRadius: 20.0).fill(Color.accentColorLight))
    }
    var ActionsRow: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .top, spacing: 10.0) {
                WalletActionButton(action: { print("") }, text: "Deposit")
                    .padding(.leading)
                WalletActionButton(action: { print("") }, text: "Transfer")
                WalletActionButton(action: { print("") }, text: "Exchange")
                WalletActionButton(action: { print("") }, text: "Withdraw")
                    .padding(.trailing)
            }
        }
    }
}

struct WalletView_Previews: PreviewProvider {
    static var previews: some View {
        WalletView()
    }
}

// ----------------------------------------
// # MarketView Components
// ----------------------------------------
private struct WalletActionButton: View {
    var action: () -> Void
    var text: String
    var body: some View {
        ActionButton(action: action, text: text)
            .foregroundColor(.white)
    }
}

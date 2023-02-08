//
//  WalletView.swift
//  YoMoola
//
//  Created by Blue Heron on 2/3/23.
//

import SwiftUI

struct WalletView: View {
    var body: some View {
        NavigationView {
            FullScreenBackgroundScrollView(backgroundImage: "background-1") {
                TopSection
                    .padding(.top)
                    .padding(.top)
                BalanceSection
                    .padding(.bottom, 15.0)
                Actions
                    .padding(.bottom)
                WhiteCardButton(action: { print("TODO home bell") }) {
                    HStack {
                        Image("coin-icon-USDC")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 40.0)
                            .padding(.trailing, 10.0)
                        VStack(alignment: .leading) {
                            Text("USD Coin")
                                .fontWeight(.bold)
                            Text("USDC")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                        Spacer()
                        VStack(alignment: .trailing) {
                            Text("$1.00")
                            Spacer()
                            HStack {
                                Text("▲ 0.00%")
                            }
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.horizontal, 6)
                            .background(Capsule().fill(Color.accentColor))
                        }
                    }
                    .foregroundColor(.text)
                }
                .padding(.horizontal)
            }
            .foregroundColor(.white)
            .background(Color.accentColor)
        }
    }
    
    // ----------------------------------------
    // # Components
    // ----------------------------------------
    var TopSection: some View {
        HStack(spacing: 15.0) {
            Text("Wallet")
                .font(.title2)
                .fontWeight(.bold)
            Spacer()
            WhiteCardButton(action: { print("TODO home bell") }) {
                Text(Image(systemName: "clock.arrow.circlepath"))
                    .font(.title3)
            }
            .foregroundColor(.accentColorDark)
        }
        .padding()
    }
    var BalanceSection: some View {
        HStack {
            Spacer()
            VStack {
                Text("Current Balance")
                    .padding(.bottom, -4.0)
                // Balance Value
                Text(balance)
                    .font(.title)
                    .fontWeight(.bold)
            }
            Spacer()
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 25, style: .continuous).fill(Color.black.opacity(0.09)))
        .padding(.horizontal)
    }
    var Actions: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .top, spacing: 10.0) {
                ActionButton(action: { print("") }, text: "Deposit")
                    .padding(.leading)
                ActionButton(action: { print("") }, text: "Transfer")
                ActionButton(action: { print("") }, text: "Exchange")
                ActionButton(action: { print("") }, text: "Withdraw")
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

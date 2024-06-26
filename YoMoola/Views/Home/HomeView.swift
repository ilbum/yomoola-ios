//
//  HomeView.swift
//  YoMoola
//
//  Created by Blue Heron on 2/3/23.
//

import SwiftUI

// ----------------------------------------
// # HomeView
// ----------------------------------------
struct HomeView: View {
    var body: some View {
        /*
         --- Please note ---
            The "NavigationView" placement is inconsistent. The
            "TabNavigator" does not render the icon when placed in "ContentView"
         */
        NavigationView {
            FullScreenBackgroundScrollView(backgroundImage: "background-1") {
                VStack {
                    TopSection
                        .padding(.top).padding(.top)
                    BalanceSection
                    
                    // ----- Card Content
                    // Market
                    // Charts
                    // Wallet
                    // Transactions
                    Card
                        .padding(.top)
                }
                .padding(.vertical)
            }
            .foregroundColor(.white)
            .background(Color.accentColor)
        }
    }
    
    // ----------------------------------------
    // ## Components
    // ----------------------------------------
    var TopSection: some View {
        HStack(spacing: 15.0) {
            CircleImageBordered(image: "profile-male-1", width: profileSize)
            Text("John Anderson")
                .font(.title3)
                .fontWeight(.bold)
            Spacer()
            WhiteCardButton(action: { print("TODO home bell") }) {
                Text(Image(systemName: "bell"))
                    .font(.title3)
            }
            .foregroundColor(.accentColorDark)
        }
        .padding()
    }
    var BalanceSection: some View {
        VStack {
            Text("Current Balance")
                .padding(.bottom, -4.0)
            // Balance Value
            Text(balance)
                .font(.title)
                .fontWeight(.bold)
            // Percentage Change
            PercentageChangeCapsuleWhite(percentChange: walletPercentChange)
        }
    }
    
    // ----------------------------------------
    // ### Card Content
    // ----------------------------------------
    var Card: some View {
        VStack {
            // ----- Market
            MarketRow
                .padding().padding([.top, .horizontal])
            // ----- Charts
            CardCharts
                .padding(.bottom)
            // ----- Wallet
            WalletRow
            WalletActionsRow
                .padding(.bottom)
            
            // ----- Transactions
            VStack {
                CardTransactionTitle
                    .padding(.bottom)
                CardTransactions
                    .padding(.bottom)
            }
            .padding([.horizontal, .bottom])
            .padding([.horizontal, .bottom])
            .padding(.bottom)
            .padding(.bottom)
            .padding(.bottom)
        }
        .foregroundColor(Color.accentColorDark)
        .background(Color.accentColorLight)
        .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
    }
    var MarketRow: some View {
        NavigationLink(destination: MarketView()) {
            TitleAndSeeAllRow(title: "Market")
        }
    }
    var CardCharts: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .top, spacing: 15.0) {
                HomeViewChartImage(imageString: "home-screen-bitcoin")
                    .padding(.leading).padding(.leading)
                HomeViewChartImage(imageString: "home-screen-ethereum")
                    .padding(.trailing).padding(.trailing)
            }
        }
    }
    var WalletRow: some View {
        NavigationLink(destination: WalletView()) {
            VStack(alignment: .leading) {
                TitleAndSeeAllRow(title: "Wallet")
                    .padding(.horizontal).padding(.horizontal)
            }
        }
    }
    var WalletActionsRow: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .top, spacing: 0) {
                NavigationLink(destination: WalletView()) {
                    HomeDarkGreenCardCtaButtons(action: { print("") }, icon: "cube", text: "Deposit")
                        .padding(.leading).padding(.leading)
                }
                NavigationLink(destination: WalletView()) {
                    HomeDarkGreenCardCtaButtons(action: { print("") }, icon: "paperplane", text: "Transfer")
                }
                NavigationLink(destination: WalletView()) {
                    HomeDarkGreenCardCtaButtons(action: { print("") }, icon: "chart.xyaxis.line", text: "Exchange")
                }
                NavigationLink(destination: WalletView()) {
                    HomeDarkGreenCardCtaButtons(action: { print("") }, icon: "dollarsign", text: "Withdraw")
                        .padding(.trailing).padding(.trailing)
                }
            }
        }
    }
    var CardTransactionTitle: some View {
        TitleAndSeeAllRow(title: "Recent Transactions")
    }
    var CardTransactions: some View {
        VStack(spacing: 15.0) {
            TransactionEntry(type: "transfer", toWallet: "YoMoola's Wallet", amount: 50)
            TransactionEntry(type: "transfer", toWallet: "YoMoola's Wallet", amount: -50)
            TransactionEntry(type: "transfer", toWallet: "YoMoola's Wallet", amount: 50)
            TransactionEntry(type: "transfer", toWallet: "YoMoola's Wallet", amount: -50)
        }
    }
    
    // ----------------------------------------
    // ## Constants
    // ----------------------------------------
    let profileSize: CGFloat = 80.0
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}


// ----------------------------------------
// # HomeView Components
// ----------------------------------------
private struct HomeViewChartImage: View {
    var imageString: String
    var body: some View {
        Image(imageString)
            .resizable()
            .scaledToFit()
            .frame(width: 225.0)
    }
}

private struct TitleAndSeeAllRow: View {
    var title: String
    var body: some View {
        HStack {
            Text(title)
                .font(.title2)
                .fontWeight(.bold)
            Spacer()
            Text("See All \(Image(systemName: "chevron.right"))")
                .foregroundColor(.accentColor)
        }
    }
}

private struct TransactionEntry: View {
    var type: String
    var toWallet: String
    var amount: Int
    var amountPositive: Bool {
        if amount > 0 {
            return true
        } else {
            return false
        }
    }
    var amountFormatted: String {
        var amountString = String(amount)
        if let i = amountString.firstIndex(of: "-") {
            amountString.remove(at: i)
        }
        return "\(amountPositive ? "+$" : "-$")\(amountString)"
    }
    
    var body: some View {
        HStack {
            ResizedImage(image: "coin-icon-USDC", width: 25)
                .foregroundColor(Color(UIColor.secondarySystemBackground))
            Text(toWallet)
                .foregroundColor(.text)
            Spacer()
            Text(amountFormatted)
                .foregroundColor(amountPositive ? Color.accentColor : Color.red)
        }
        .padding(.horizontal, 20.0)
        .padding(.vertical, 13.0)
        .background(Capsule().fill(Color.white))
    }
}

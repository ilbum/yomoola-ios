//
//  MarketView.swift
//  YoMoola
//
//  Created by Blue Heron on 2/7/23.
//

import SwiftUI

// ----------------------------------------
// # MarketView
// ----------------------------------------
struct MarketView: View {
    @State var searchString = ""
    var body: some View {
        List {
            SearchSection
                //.padding([.horizontal, .top])
                .padding(.horizontal)
                .listRowSeparator(.hidden)
            Actions
                .padding(.bottom, 5.0)
            CryptoRow(imageString: "coin-icon-BTC", name: "Bitcoin", ticker: "BTC", value: "23,247.90", percentChange: 0.01)
            CryptoRow(imageString: "coin-icon-ETH", name: "Ethereum", ticker: "ETH", value: "1,679.53", percentChange: 0.55)
            CryptoRow(imageString: "coin-icon-USDC", name: "USD Coin", ticker: "USDC", value: "1.00", percentChange: 0.00)
        }
        .listStyle(.inset)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                HStack {
                    Text("Market")
                        .foregroundColor(.accentColorDark)
                        .fontWeight(.bold)
                        .font(.title3)
                    
                }
            }
        }
        .toolbar {
            Button(action: { print("TODO options") }) {
                Label {
                    Text("Menu Options")
                } icon: {
                    Image(systemName: "ellipsis")
                        .rotationEffect(.degrees(90))
                }
            }
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
    // ## Components
    // ----------------------------------------
    var SearchSection: some View {
        HStack {
            Text(Image(systemName: "magnifyingglass"))
                .font(.title3)
                .foregroundColor(.accentColor)
            TextField("Search", text: $searchString)
        }
    }
    var Actions: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .top, spacing: 10.0) {
                MarketActionButton(action: { print("") }, text: "All Coins")
                    .padding(.leading)
                MarketActionButton(action: { print("") }, text: "Most Trade")
                MarketActionButton(action: { print("") }, text: "Most Lose")
                MarketActionButton(action: { print("") }, text: "Favorites")
                    .padding(.trailing)
            }
        }
    }
}

struct MarketView_Previews: PreviewProvider {
    static var previews: some View {
        MarketView()
    }
}

// ----------------------------------------
// # MarketView Components
// ----------------------------------------
struct CryptoRow: View {
    var imageString: String
    var name: String
    var ticker: String
    var value: String
    var percentChange: Float
    var changeString: String {
        if percentChange >= 0 {
            return "▲ +%\(percentChange)"
        } else {
            return "▼ -%\(abs(percentChange))"
        }
    }
    private let imageWidth: CGFloat = 50.0
    var body: some View {
        HStack(spacing: 15.0) {
            HStack {
                Text("")
                CircleImage(image: imageString, width: imageWidth)
            }
            VStack(alignment: .leading, spacing: 4.0) {
                Text(name)
                    .fontWeight(.medium)
                Text(ticker)
                    .foregroundColor(.textGray)
                    .font(.callout)
            }
            Spacer()
            VStack(alignment: .trailing, spacing: 4.0) {
                Text("$\(value)")
                    .padding(.horizontal, 6.0)
                Text(changeString)
                    .foregroundColor(.white)
                    .padding(.horizontal, 10.0)
                    .padding(.vertical, 1.0)
                    .background(Capsule().fill(percentChange >= 0 ? Color.accentColor : Color.red))
            }
        }
        .foregroundColor(.text)
        .padding(5.0)
    }
}

private struct MarketActionButton: View {
    var action: () -> Void
    var text: String
    var body: some View {
        ActionButton(action: action, text: text)
            .foregroundColor(.white)
    }
}

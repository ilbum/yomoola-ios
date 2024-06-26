//
//  ProfileView.swift
//  YoMoola
//
//  Created by Blue Heron on 2/4/23.
//

import SwiftUI

private let spacer: CGFloat = 90
private let imageWidth: CGFloat = 70.0

struct ProfileView: View {
    init(dataCreditCards: [CreditCardModel]) {
        self.dataCreditCards = dataCreditCards
        _activeCreditCard = .init(initialValue: dataCreditCards[0])
    }
    var dataCreditCards: [CreditCardModel]
    @State var activeCreditCard: CreditCardModel
    @State var creditCardModal = false
    var body: some View {
        FullScreenBackgroundScrollView(backgroundImage: "background-2") {
            ProfileSection
                .foregroundColor(.text)
            // WalletsSection
            Spacer().frame(height: spacer * 0.4)
            SettingsTitle
            SettingsSection
                .padding(.horizontal)
        }
    }
    
    // ----------------------------------------
    // # Components
    // ----------------------------------------
    var ProfileSection: some View {
        VStack(spacing: 7.0) {
            Spacer().frame(height: spacer)
            CircleImageBordered(image: "profile-male-1", width: 125)
                .padding(.bottom)
            Text(userName)
                .foregroundColor(.accentColorDark)
                .font(.title)
                .fontWeight(.bold)
            Text("@\(userId)")
        }
        .padding(.bottom)
    }
    var WalletsSection: some View {
        VStack {
            HStack {
                Text("Wallets")
                    .foregroundColor(.accentColorDark)
                    .font(.title2)
                    .fontWeight(.bold)
                Spacer()
            }
            .padding(.leading).padding(.leading)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 10.0) {
                    CircleImageBordered(image: "yomoola-logo-padding-bg-green", width: imageWidth)
                        .padding(.leading).padding(.leading)
                    CircleImageBordered(image: "profile-male-2", width: imageWidth)
                    CircleImageBordered(image: "profile-female-1", width: imageWidth)
                    CircleImageBordered(image: "profile-male-3", width: imageWidth)
                    CircleImageBordered(image: "profile-female-2", width: imageWidth)
                        .padding(.trailing).padding(.trailing)
                }
                .padding(.vertical, 3.0)
            }
        }
        .foregroundColor(.text)
        .padding(.bottom)
    }
    var SettingsTitle: some View {
        HStack {
            Text("Settings")
                .foregroundColor(.accentColorDark)
                .font(.title2)
                .fontWeight(.bold)
            Spacer()
        }
        .padding(.horizontal).padding(.horizontal)
    }
    var SettingsSection: some View {
        VStack {
            SettingsRow(image: "person.text.rectangle", text: "Personal Info")
            Divider()
            Button { creditCardModal.toggle() } label: {
                SettingsRow(image: "creditcard", text: "Payment Method")
                    .padding(.vertical, 5.0)
            }
            .sheet(isPresented: $creditCardModal) {
                CreditCardModal(activeCreditCard: $activeCreditCard, dataCreditCards: dataCreditCards)
            }
            Divider()
            SettingsRow(image: "bell", text: "Notifications")
        }
        .foregroundColor(.text)
        .padding()
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var dataCreditCards = [
        CreditCardModel(name: "Chase", type: "Visa", number: "4024007128069472"),
        CreditCardModel(name: "Bank of America", type: "Visa", number: "4916280452115283")
    ]
    static var previews: some View {
        ProfileView(dataCreditCards: dataCreditCards)
    }
}

// ----------------------------------------
// # View Components
// ----------------------------------------
struct SettingsRow: View {
    var image: String
    var text: String
    var body: some View {
        HStack {
            Image(systemName: image)
                .foregroundColor(.accentColorDark)
                .imageScale(.large)
                .padding(.trailing)
            Text(text)
                .foregroundColor(.text)
            Spacer()
            Image(systemName: "chevron.right")
                .foregroundColor(.accentColorDark)
                .imageScale(.large)
        }
        .padding(4.0)
    }
}

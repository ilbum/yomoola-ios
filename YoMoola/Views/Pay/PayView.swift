//
//  PayView.swift
//  YoMoola
//
//  Created by Blue Heron on 2/4/23.
//

import SwiftUI

/*
 TODO: Update view
 - Padding?
 - Title --> Transfer
 -
 */

struct PayView: View {
    init() {
        //Use this if NavigationBarTitle is with Large Font
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor(Color.accentColorDark)]
        //Use this if NavigationBarTitle is with displayMode = .inline
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor(Color.accentColorDark)]
    }
    // popup for the camera
    @State var cameraModal = false
    @State var searchString = ""
    var body: some View {
        List {
            SearchSection
                .padding()
            //.listRowSeparator(.hidden)
            
//            NavigationLink {
//                PayDetailView(dataCreditCards: DataCreditCards)
//            } label: {
//                QrScanRow
//                    .padding(.horizontal)
//                    .padding(.top, 5.0)
//            }
            //.listRowSeparator(.hidden)
            
            QrScanRow
                .padding(.horizontal)
                .padding(.top, 5.0)
            
            HStack {
                CircleImage(image: "yomoola-logo-padding-bg-green", width: 55)
                    .padding(.trailing, 12)
                Text("Wallets")
                    .foregroundColor(.accentColorDark)
                    .font(.title)
                    .overlay(Rectangle().frame(height: 1).offset(y: 4), alignment: .bottom).foregroundColor(.accentColorDim)
                Spacer()
            }
            .padding(.horizontal)
            .listRowSeparator(.hidden)
            
//            NavigationLink {
//                PayDetailView(dataCreditCards: DataCreditCards)
//            } label: {
//                UserRow(image: "merchant-1", name: "Harborside", id: "harborside")
//            }
            UserRow(image: "merchant-1", name: "Harborside", id: "harborside")
            UserRow(image: "profile-male-2", name: "Kurt Hubble", id: "kurthubble")
            UserRow(image: "profile-female-1", name: "Deborah Penton", id: "browniexbay")
            UserRow(image: "profile-male-3", name: "Rex Cota", id: "rexelglass")
            UserRow(image: "profile-female-2", name: "Irma Nelson", id: "irma")
        }
        .listStyle(.plain)
        .navigationTitle("Transfer")
        .toolbar {
            ToolbarItemGroup(placement: .primaryAction) {
                Button(action: { print("TODO refresh") }) {
                    Label {
                        Text("Help")
                    } icon: {
                        Image(systemName: "questionmark.circle")
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
    }
    
    // ----------------------------------------
    // # Components
    // ----------------------------------------
    var TopSection: some View {
        HStack {
            Spacer()
            Text("Pay")
                .font(.title)
                .fontWeight(.bold)
                .padding(.vertical)
            Spacer()
        }
    }
    var SearchSection: some View {
        SearchInput(searchString: $searchString, labelText: "Search for a Wallet")
    }
    var QrScanRow: some View {
        NavigationLink {
            PayDetailView(dataCreditCards: DataCreditCards)
        } label: {
            HStack {
                Text(Image(systemName: "qrcode"))
                    .font(.largeTitle)
                    .padding(.trailing, 9.0)
                Text("Scan a QR code")
                    .font(.title3)
                Spacer()
            }
            .foregroundColor(.accentColorDark)
        }
//        Button(action: { cameraModal = true }) {
//            HStack {
//                Text(Image(systemName: "qrcode"))
//                    .font(.largeTitle)
//                    .padding(.trailing, 9.0)
//                Text("Scan a QR code")
//                    .font(.title3)
//                Spacer()
//            }
//        }
//        .foregroundColor(.accentColorDark)
//        .sheet(isPresented: $cameraModal) {
//            TempView()
//        }
    }
    var SearchResults: some View {
        VStack {
            UserRow(image: "yomoola-logo-padding-bg-green", name: "YoMoola", id: "yomoola")
            Divider()
            UserRow(image: "profile-male-2", name: "Jason Anderson", id: "janderson100")
            Divider()
            UserRow(image: "profile-female-1", name: "Cookies", id: "cookies")
        }
        .padding(.vertical, 10.0)
        .background(Color.accentColorLight)
        .cornerRadius(25)
    }
    
    var CameraControls: some View {
        HStack(spacing: 20.0) {
            WhiteCardButton(action: { print("todo") }) {
                Image(systemName: "arrow.clockwise")
            }
            WhiteCardButton(action: { print("todo") }) {
                Image(systemName: "sun.max.fill")
            }
            WhiteCardButton(action: { print("todo") }) {
                Image(systemName: "questionmark")
            }
        }
        .foregroundColor(.accentColor)
    }
}

struct PayView_Previews: PreviewProvider {
    @State static var dataWallet = [
        WalletModel(name: "Harborside", username: "harborside", image: "merchant-1"),
        WalletModel(name: "Kurt Hubble", username: "kurthubble", image: "profile-male-2"),
        WalletModel(name: "Deborah Penton", username: "browniexbay", image: "profile-female-1"),
        WalletModel(name: "Rex Cota", username: "rexelglass", image: "profile-male-3"),
        WalletModel(name: "Irma Nelson", username: "irma", image: "profile-female-2")
    ]
    static var previews: some View {
        PayView()
    }
}

// ----------------------------------------
// WalletView Components
// ----------------------------------------
struct TempView: View {
    var body: some View {
        VStack {
            Text("Camera Section TODO")
                .font(.title)
                .fontWeight(.bold)
            Spacer()
        }
        .background(.gray)
        .frame(height: 400)
    }
}

//
//  PayView.swift
//  YoMoola
//
//  Created by Blue Heron on 2/4/23.
//

import SwiftUI

struct PayView: View {
    // popup for the camera
    @State var cameraModal = false
    @State var searchString = ""
    var body: some View {
        NavigationView {
            List {
                SearchSection
                    .padding()
                
                CameraSection
                    .padding()
                
                HStack {
                    Text("YoMoola Wallets")
                        .font(.title)
                        .padding()
                    Spacer()
                    Button(action: { print("TODO") }) {
                        Text(Image(systemName: "plus"))
                            .foregroundColor(.accentColor)
                            .font(.title)
                    }
                }

                
                NavigationLink {
                    PayDetailView()
                } label: {
                    UserRow(image: "yomoola-logo-padding-bg-green", name: "YoMoola", id: "yomoola")
                }
                UserRow(image: "profile-male-2", name: "Kurt Hubble", id: "kurthubble")
                UserRow(image: "profile-female-1", name: "Deborah Penton", id: "browniexbay")
                UserRow(image: "profile-male-3", name: "Rex Cota", id: "rexelglass")
                UserRow(image: "profile-female-2", name: "Irma Nelson", id: "irma")
            }
            .listStyle(.plain)
            //.navigationTitle(smoothie.title)
//            .toolbar {
//                Text("Add Wallet")
//            }
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
        //TextFieldBorderedGray(labelText: "Search for a Wallet", inputString: $searchString)
        HStack {
            Text(Image(systemName: "magnifyingglass"))
                .font(.title)
                .foregroundColor(.accentColor)
            TextField("Search for a Wallet", text: $searchString)
        }
    }
    var CameraSection: some View {
        Button(action: { cameraModal = true }) {
            HStack {
                Text(Image(systemName: "qrcode"))
                    .font(.largeTitle)
                    .padding(.trailing, 9.0)
                Text("Scan a QR code")
                    .font(.title3)
                Spacer()
            }
        }
        .foregroundColor(.accentColorDark)
        //        .listRowBackground(Color.gray)
        .sheet(isPresented: $cameraModal) {
            CameraQrView()
        }
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
    static var previews: some View {
        PayView()
    }
}


// ----------------------------------------
// WalletView Components
// ----------------------------------------
struct CameraQrView: View {
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


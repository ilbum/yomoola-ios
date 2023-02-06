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
//        List {
//            TopSection
//                .padding(.top)
//
//            CameraSection
//                .padding()
//
//            SearchSection
//                .padding([.horizontal, .bottom])
//
//            SearchResults
//                .padding(.horizontal)
//        }
//        .listStyle(.plain)
//        .background(backgroundLinearGradient)
//        .scrollContentBackground(.hidden)
        
        FullScreenBackgroundScrollView(backgroundImage: "background-1") {
            VStack {
                TopSection
                    .padding(.top)

                CameraSection
                    .padding()

                SearchSection
                    .padding([.horizontal, .bottom])

                SearchResults
                    .padding(.horizontal)

//                CameraSection
//                    .padding(.bottom)
//                CameraControls
            }
            .padding()
        }
        .foregroundColor(.white)
        .background(Color.accentColor)
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
    var CameraSection: some View {
        Button(action: { cameraModal = true }) {
            HStack {
                Text(Image(systemName: "qrcode"))
                    .font(.title)
                Text("Open Camera Modal")
                Spacer()
            }
        }
        .buttonStyle(.bordered)
        .sheet(isPresented: $cameraModal) {
            CameraQrView()
        }
    }
    var SearchSection: some View {
        TextFieldBorderedGray(labelText: "Search for a Wallet", inputString: $searchString)
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


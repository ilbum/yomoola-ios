//
//  WalletModel.swift
//  YoMoola
//
//  Created by Blue Heron on 2/9/23.
//

import SwiftUI

// ---------------------------------------------------------
// # WalletModel
// ---------------------------------------------------------
struct WalletModel: Codable, Hashable, Identifiable {
    // ---------------------------------------------------------
    // ## Properties
    // ---------------------------------------------------------
    var id: UUID
    var name: String
    var username: String
    var image: String
    
    // Computed Properties
    var displayUsername: String {
        "@\(username)"
    }
    
    // ---------------------------------------------------------
    // ## init
    // ---------------------------------------------------------
    init(name: String, username: String, image: String) {
        self.id = UUID()
        self.name = name
        self.username = username
        self.image = image
    }
}

let DataWallets: [WalletModel] = [
    WalletModel(name: "Harborside", username: "harborside", image: "merchant-1"),
    WalletModel(name: "Kurt Hubble", username: "kurthubble", image: "profile-male-2"),
    WalletModel(name: "Deborah Penton", username: "browniexbay", image: "profile-female-1"),
    WalletModel(name: "Rex Cota", username: "rexelglass", image: "profile-male-3"),
    WalletModel(name: "Irma Nelson", username: "irma", image: "profile-female-2")
]

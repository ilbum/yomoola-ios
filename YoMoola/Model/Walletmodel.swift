//
//  Walletmodel.swift
//  YoMoola
//
//  Created by Blue Heron on 2/9/23.
//

import SwiftUI

// ---------------------------------------------------------
// # Walletmodel
// ---------------------------------------------------------
struct Walletmodel: Codable, Hashable, Identifiable {
    // ---------------------------------------------------------
    // ## Properties
    // ---------------------------------------------------------
    var id: UUID
    var name: String
    var username: String
    
    // Computed Properties
    var displayUsername: String {
        "@\(username)"
    }
    
    // ---------------------------------------------------------
    // ## init
    // ---------------------------------------------------------
    init(quantity: Int, name: String, username: String) {
        self.id = UUID()
        self.name = name
        self.username = username
    }
}

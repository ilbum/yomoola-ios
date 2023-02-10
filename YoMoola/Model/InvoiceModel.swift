//
//  InvoiceModel.swift
//  YoMoola
//
//  Created by Blue Heron on 2/7/23.
//

import SwiftUI

// ---------------------------------------------------------
// # InvoiceModel
// ---------------------------------------------------------
struct InvoiceModel: Codable, Hashable, Identifiable {
    // ---------------------------------------------------------
    // ## Properties
    // ---------------------------------------------------------
    var id: UUID
    var quantity: Int
    var name: String
    var price: Float
    
    // Computed Properties
    var total: String {
        "$\(String(Float(quantity) * price))"
    }
    
    // ---------------------------------------------------------
    // ## init
    // ---------------------------------------------------------
    init(quantity: Int, name: String, price: Float) {
        self.id = UUID()
        self.quantity = quantity
        self.name = name
        self.price = price
    }
}

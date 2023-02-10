//
//  CreditCardModel.swift
//  YoMoola
//
//  Created by Blue Heron on 2/8/23.
//

import SwiftUI

// ---------------------------------------------------------
// # CreditCardModel
// ---------------------------------------------------------
struct CreditCardModel: Codable, Hashable, Identifiable {
    // ---------------------------------------------------------
    // ## Properties
    // ---------------------------------------------------------
    var id: UUID
    var name: String
    var type: String
    var number: String
    // var expirationDate: Date
    // var zipCode: String
    
    // ----- Computed Properties
    var displayNumber: String {
        let range = number.index(number.endIndex, offsetBy: -4)..<number.endIndex
        return "****\(String(number[range]))"
    }
    
    // ---------------------------------------------------------
    // ## init
    // ---------------------------------------------------------
    init(type: String, number: String) {
        self.id = UUID()
        self.name = ""
        self.type = type
        self.number = number
    }
    init(name: String, type: String, number: String) {
        self.id = UUID()
        self.name = name
        self.type = type
        self.number = number
    }
}

let DataCreditCards: [CreditCardModel] = [
    CreditCardModel(name: "Chase", type: "Visa", number: "4024007128069472"),
    CreditCardModel(name: "Bank of America", type: "Visa", number: "4916280452115283")
]

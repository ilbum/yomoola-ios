//
//  CreditCardComponents.swift
//  YoMoola
//
//  Created by Blue Heron on 2/8/23.
//

import SwiftUI

struct CreditCardRow: View {
    var creditCard: CreditCardModel
    var body: some View {
        HStack(spacing: 15) {
            ResizedSfSymbolImage(image: "creditcard.circle.fill", width: 60)
                .foregroundColor(Color.accentColorDark)
            VStack(alignment: .leading, spacing: 5) {
                Text(creditCard.name)
                Text(creditCard.type)
                    .font(.caption)
            }
            Spacer()
            Text(creditCard.displayNumber)
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 20.0).fill(Color.accentColorLight))
    }
}

struct CreditCardComponents_Previews: PreviewProvider {
    static var creditCard: CreditCardModel = CreditCardModel(name: "Chase", type: "Visa", number: "4024007128069472")
    static var previews: some View {
        ScrollView {
            Spacer().frame(height: 200)
            CreditCardRow(creditCard: creditCard)
        }
        .background(.gray)
    }
}

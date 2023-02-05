//
//  UserRow.swift
//  YoMoola
//
//  Created by Blue Heron on 2/4/23.
//

import SwiftUI

struct UserRow: View {
    var image: String
    var name: String
    var id: String
    var idFromatted: String {
        return "@\(id)"
    }
    var imageFormatted: String {
        if image.count == 0 {
            return "logo"
        } else {
            return image
        }
    }
    var body: some View {
        HStack {
            CircleImageAccentColor(image: "logo", width: 50)
                .padding(.trailing)
            VStack(alignment: .leading) {
                Text(name)
                    .fontWeight(.bold)
                Text(idFromatted)
            }
            Spacer()
        }
    }
}

struct UserRow_Previews: PreviewProvider {
    static var previews: some View {
        FullScreenBackgroundView(backgroundImage: "background-1") {
            UserRow(image: "logo", name: "YoMoola Merchant", id: "yomoola")
        }
    }
}

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
            CircleImage(image: image, width: 65)
                .padding(.trailing, 8.0)
            VStack(alignment: .leading) {
                Text(name)
                    .fontWeight(.bold)
                Text(idFromatted)
            }
            .foregroundColor(.text)
            Spacer()
        }
        .padding(10.0)
        .padding(.horizontal, 10.0)
    }
}

struct UserRow_Previews: PreviewProvider {
    static var previews: some View {
        PayView()
//        FullScreenBackgroundView(backgroundImage: "background-1") {
//            UserRow(image: "logo", name: "YoMoola Merchant", id: "yomoola")
//        }
    }
}

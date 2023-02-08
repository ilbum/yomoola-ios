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
            Text("")
            CircleImageBordered(image: image, width: 50)
                .padding(.trailing, 8.0)
            VStack(alignment: .leading) {
                Text(name)
                    .fontWeight(.bold)
                    .padding(.bottom, -0.1)
                Text(idFromatted)
                    .foregroundColor(.gray)
                    .font(.callout)
            }
            .foregroundColor(.text)
            Spacer()
        }
        .padding(10.0)
        .padding(.trailing, 10.0)
        .listRowBackground(Color.accentColorLight)
        // .listRowBackground(Color(uiColor: UIColor.clear))
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

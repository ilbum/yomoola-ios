//
//  ResizedImage.swift
//  YoMoola
//
//  Created by Blue Heron on 2/4/23.
//

import SwiftUI

struct ResizedImage: View {
    var image: String
    var width: CGFloat
    var body: some View {
        VStack(alignment: .leading) {
            Image(image)
                .resizable()
                .scaledToFit()
                .frame(width: width)
        }
    }
}

struct CircleImage: View {
    var image: String
    var width: CGFloat
    var body: some View {
        ZStack {
            Circle().frame(width: width * 1.25, height: width * 1.25).foregroundColor(.accentColorDark)
            ResizedImage(image: image, width: width)
        }
    }
}

struct ResizedImage_Previews: PreviewProvider {
    static var previews: some View {
        FullScreenBackgroundView(backgroundImage: "background-1") {
            VStack(spacing: 50) {
                ResizedImage(image: "logo", width: 100)
                CircleImage(image: "logo", width: 100)
            }
        }
    }
}

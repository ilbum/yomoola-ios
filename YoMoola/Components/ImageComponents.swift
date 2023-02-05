//
//  ImageComponents.swift
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

struct CircleImageAccentColor: View {
    var image: String
    var width: CGFloat
    var body: some View {
        ZStack {
            Circle().frame(width: width * 1.25, height: width * 1.25).foregroundColor(.accentColor)
            ResizedImage(image: image, width: width)
        }
    }
}

struct CircleImage: View {
    var image: String
    var width: CGFloat
    var body: some View {
        ResizedImage(image: image, width: width)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth: 4.0))
            //.shadow(radius: 7.0)
    }
}

struct ImageComponents_Previews: PreviewProvider {
    static let width: CGFloat = 100
    static var previews: some View {
        FullScreenBackgroundView(backgroundImage: "background-2") {
            VStack(spacing: 50) {
                ResizedImage(image: "logo", width: width)
                CircleImageAccentColor(image: "logo", width: width)
                CircleImage(image: "profile-male-1", width: width)
            }
        }
    }
}

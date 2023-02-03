//
//  WhiteCards.swift
//  YoMoola
//
//  Created by Blue Heron on 2/2/23.
//

import SwiftUI

struct WhiteCardShadow<Content: View>: View {
    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }
    var content: () -> Content
    var body: some View {
        HStack {
            content()
                .padding()
        }
        .background(.white)
        .cornerRadius(20.0)
        .shadow(color: .gray.opacity(0.4), radius: 4.5, x: 0.0, y: 3.5)
    }
}

struct WhiteCardShadowButton<Content: View>: View {
    init(action: @escaping () -> Void, @ViewBuilder content: @escaping () -> Content) {
        self.action = action
        self.content = content
    }
    var action: () -> Void
    var content: () -> Content
    var body: some View {
        Button(action: action) {
            WhiteCardShadow {
                content()
            }
        }
    }
}

struct WhiteCards_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 30.0) {
            Spacer()
            WhiteCardShadowButton(action: { print("TODO") }) {
                Text("I am a button")
                    .font(.title)
            }
            WhiteCardShadow {
                Image("Social-Apple")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40.0)
            }
            Spacer()
            HStack { Spacer() }
        }
        .background(backgroundLinearGradient)
    }
}

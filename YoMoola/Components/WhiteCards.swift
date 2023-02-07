//
//  WhiteCards.swift
//  YoMoola
//
//  Created by Blue Heron on 2/2/23.
//

import SwiftUI

struct WhiteCard<Content: View>: View {
    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }
    var content: () -> Content
    var body: some View {
        content()
        .background(.white)
        .cornerRadius(cardCornerRadius)
    }
}

struct WhiteCardButton<Content: View>: View {
    init(action: @escaping () -> Void, @ViewBuilder content: @escaping () -> Content) {
        self.action = action
        self.content = content
    }
    var action: () -> Void
    var content: () -> Content
    var body: some View {
        Button(action: action) {
            WhiteCardHStack {
                content()
            }
        }
    }
}

struct WhiteCardHStack<Content: View>: View {
    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }
    var content: () -> Content
    var body: some View {
        WhiteCard {
            HStack {
                content()
                    .padding()
            }
        }
    }
}

struct WhiteCardHStackShadow<Content: View>: View {
    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }
    var content: () -> Content
    var body: some View {
        WhiteCardHStack {
            content()
        }
        .shadow(color: .gray.opacity(0.4), radius: 4.5, x: 0.0, y: 3.5)
    }
}

struct WhiteCardVStack<Content: View>: View {
    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }
    var content: () -> Content
    var body: some View {
        WhiteCard {
            VStack {
                content()
                    .padding()
            }
        }
    }
}

struct WhiteCardVStackShadow<Content: View>: View {
    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }
    var content: () -> Content
    var body: some View {
        WhiteCardVStack {
            content()
        }
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
            WhiteCardHStackShadow {
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
            WhiteCardHStackShadow {
                Image("Social-Apple")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40.0)
            }
            WhiteCardHStack {
                Text("Hello this is no shadow")
            }
            WhiteCardButton(action: { print("TODO home bell") }) {
                Text(Image(systemName: "bell"))
                    .font(.title3)
            }
            Spacer()
            HStack { Spacer() }
        }
        .background(Color.accentColor)
    }
}

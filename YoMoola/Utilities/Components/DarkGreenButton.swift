//
//  DarkGreenButton.swift
//  YoMoola
//
//  Created by Blue Heron on 2/3/23.
//

import SwiftUI

struct DarkGreenCard<Content: View>: View {
    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }
    var content: () -> Content
    var body: some View {
        HStack {
            content()
            //.padding()
        }
        .background(Color.accentColorDark)
        .cornerRadius(20.0)
    }
}

struct DarkGreenCardButton<Content: View>: View {
    init(action: @escaping () -> Void, @ViewBuilder content: @escaping () -> Content) {
        self.action = action
        self.content = content
    }
    var action: () -> Void
    var content: () -> Content
    var body: some View {
        Button(action: action) {
            DarkGreenCard {
                content()
            }
        }
    }
}

struct HomeDarkGreenCardCtaButtons: View {
//    init(action: @escaping () -> Void, ) {
//        self.action = action
//        self.content = content
//    }
    var action: () -> Void
    var icon: String
    var text: String
    var body: some View {
        Button(action: action) {
            DarkGreenCard {
                VStack(spacing: 5.0) {
                    Text(Image(systemName: icon))
                        .font(.title3)
                        .foregroundColor(Color.accentColor)
                    Text(text)
                        .font(.caption)
                        .foregroundColor(.white)
                }
                .padding(10.0)
            }
            .padding(.trailing)
        }
    }
}

struct DarkGreenButton_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 20.0) {
            Spacer()
            HomeDarkGreenCardCtaButtons(action: { print("") }, icon: "cube", text: "Deposit")
            HomeDarkGreenCardCtaButtons(action: { print("") }, icon: "arrow.left.arrow.right", text: "Exchange")
            DarkGreenCardButton(action: { print("TODO hello world") }) {
                Text("Hello World")
            }
            Spacer()
        }
    }
}

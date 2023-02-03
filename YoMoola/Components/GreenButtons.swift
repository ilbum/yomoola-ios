//
//  GreenButtons.swift
//  YoMoola
//
//  Created by Blue Heron on 2/2/23.
//

import SwiftUI

struct BackChevron: View {
    var action: () -> Void
    var body: some View {
        Button(action: action) {
            VStack {
                Text(Image(systemName: "chevron.left"))
                    .foregroundColor(Color.accentColorDark)
                    .font(.title3)
                    .padding()
                    .padding(.horizontal, 5.0)
            }
            .background(Color.accentColorLight)
            .cornerRadius(25.0)
        }
    }
}

struct BlockButtonDark: View {
    var text: String
    var action: () -> Void
    var body: some View {
        HStack {
            Button(action: action) {
                HStack {
                    Spacer()
                    Text(text)
                        .foregroundColor(.white)
                        .padding(.vertical, 8.0)
                    Spacer()
                }
            }
        }
        .buttonStyle(.borderedProminent)
        .tint(.accentColorDark)
    }
}

struct BlockButton: View {
    var text: String
    var action: () -> Void
    var body: some View {
        HStack {
            Button(action: action) {
                HStack {
                    Spacer()
                    Text(text)
                        .foregroundColor(.white)
                        .padding(.vertical, 8.0)
                    Spacer()
                }
            }
        }
        .buttonStyle(.borderedProminent)
        .tint(.accentColor)
    }
}

struct GreenButtons_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 30.0) {
            BackChevron { print("BackChevron") }
            BlockButton(text: "BlockButton") { print("BlockButton") }
            BlockButtonDark(text: "BlockButtonDark") { print("BlockButtonDark") }
        }
        .padding()
    }
}

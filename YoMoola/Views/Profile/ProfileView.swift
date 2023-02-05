//
//  ProfileView.swift
//  YoMoola
//
//  Created by Blue Heron on 2/4/23.
//

import SwiftUI

private let spacer: CGFloat = 90

struct ProfileView: View {
    var body: some View {
        FullScreenBackgroundScrollView(backgroundImage: "background-2") {
            ProfileSection
                .foregroundColor(.text)
            WalletsSection
            Spacer().frame(height: spacer * 0.4)
            
            HStack {
                Text("Settings")
                    .foregroundColor(.accentColorDark)
                    .font(.title2)
                    .fontWeight(.bold)
                Spacer()
            }
            .padding(.horizontal).padding(.horizontal)
            
            Settings
                .padding(.horizontal)
        }
    }
    
    // ----------------------------------------
    // # Components
    // ----------------------------------------
    var ProfileSection: some View {
        VStack(spacing: 7.0) {
            Spacer().frame(height: spacer)
            CircleImage(image: "logo", width: 100)
                .padding(.bottom)
            Text("User Name")
                .foregroundColor(.accentColorDark)
                .font(.title)
                .fontWeight(.bold)
            Text("yomoolaID")
        }
        .padding(.bottom)
    }
    var WalletsSection: some View {
        VStack {
            HStack {
                Text("Wallets")
                    .foregroundColor(.accentColorDark)
                    .font(.title2)
                    .fontWeight(.bold)
                Spacer()
            }
            .padding(.leading).padding(.leading)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 10.0) {
                    CircleImage(image: "logo", width: 50)
                        .padding(.leading).padding(.leading)
                    CircleImage(image: "logo", width: 50)
                    CircleImage(image: "logo", width: 50)
                    CircleImage(image: "logo", width: 50)
                    CircleImage(image: "logo", width: 50)
                        .padding(.trailing).padding(.trailing)
                }
            }
        }
        .foregroundColor(.text)
        .padding(.bottom)
    }
    var Settings: some View {
        VStack {
            SettingsRow(image: "note.text", text: "Personal Info")
            Divider()
            SettingsRow(image: "bell", text: "Notifications")
        }
        .foregroundColor(.text)
        .padding()
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

// ----------------------------------------
// # View Components
// ----------------------------------------
struct SettingsRow: View {
    var image: String
    var text: String
    var body: some View {
        HStack {
            Image(systemName: image)
                .foregroundColor(.accentColorDark)
                .imageScale(.large)
                .padding(.trailing)
            Text(text)
            Spacer()
            Image(systemName: "chevron.right")
                .foregroundColor(.accentColorDark)
                .imageScale(.large)
        }
        .padding(4.0)
    }
}
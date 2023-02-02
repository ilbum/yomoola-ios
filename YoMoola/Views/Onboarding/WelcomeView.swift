//
//  WelcomeView.swift
//  YoMoola
//
//  Created by Blue Heron on 2/1/23.
//

import SwiftUI

struct WelcomeView: View {
    @Binding var onboardStepNumber: Int
    var body: some View {
        VStack {
            Spacer().frame(height: 40.0)
            ImageHome
            Title
            SubTitleContent
            GetStartedButton
            ImageCreditCards
            Spacer()
        }
    }
    
    var ImageHome: some View {
        Image("home-screen-wallet")
            .resizable()
            .scaledToFit()
            .padding()
            .padding(.horizontal)
    }
    var Title: some View {
        Text("YO\nMOOLA!")
            .foregroundColor(.accentColorDark)
            .font(.title)
            .fontWeight(.heavy)
            .padding(.bottom)
    }
    var SubTitleContent: some View {
        VStack(alignment: .center) {
            Text("The easiest way to pay with and earn on your crypto")
                .foregroundColor(.text)
                .fixedSize(horizontal: false, vertical: true)
                .multilineTextAlignment(.center)
        }
        .padding(.horizontal).padding(.horizontal)
        .padding(.bottom)
    }
    var GetStartedButton: some View {
        HStack {
            Button(action: {
                print("TODO")
            }) {
                HStack {
                    Spacer()
                    Text("Get Started")
                        .padding(.vertical, 6.0)
                    Spacer()
                }
            }
        }
        .buttonStyle(.borderedProminent)
        .tint(.accentColorDark)
        .padding(.horizontal)
        .padding()
    }
    var ImageCreditCards: some View {
        Image("home-screen-credit-cards")
            .resizable()
            .scaledToFit()
            .padding()
            .padding(.horizontal)
    }
}

struct WelcomeView_Previews: PreviewProvider {
    @State static var onboardStepNumber: Int = 0
    static var previews: some View {
        WelcomeView(onboardStepNumber: $onboardStepNumber)
    }
}

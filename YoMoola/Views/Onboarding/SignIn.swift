//
//  SignIn.swift
//  YoMoola
//
//  Created by Blue Heron on 2/1/23.
//

import SwiftUI

struct SignIn: View {
    // parameters
    @Binding var onboardStepNumber: Int
    // state
    @State var email = ""
    @State var password = ""
    @State var validationError = false
    @State var rememberMe = false
    
    let iconSize: CGFloat = 30.0
    
    var body: some View {
        ScrollView {
            TopButtonSection
            
            Title
                .padding(.bottom)
            
            VStack {
                TextFieldBorderedGray(labelText: "Enter your email address", inputString: $email)
                    .padding(.bottom, 0.0)
                TextFieldBorderedGray(labelText: "Password", inputString: $email)
            }
            .padding(.horizontal)
            
            SignInButton
                .padding()
            
            RememberResetHStack
                .padding(.horizontal)
            
            Spacer().frame(height: 75.0)
            
            OrContinueWith
                .padding(.bottom)
            
            SocialLogins
                .padding(.bottom)
            
            BlockButton(text: "Don't have an account? Sign up!") {
                print("TODO")
            }
            .padding()
        }
        .background(backgroundLinearGradient)
    }
    
    // ----------------------------------------
    // Components
    // ----------------------------------------
    var TopButtonSection: some View {
        HStack {
            BackChevron {
                withAnimation(.easeIn(duration: screenAnimationDuration)) {
                    onboardStepNumber = 0
                }
            }
            //.shadow(color: .gray.opacity(0.66), radius: 3.5, x: 0.0, y: 3.5)
            Spacer()
        }
        .padding().padding(.bottom)
    }
    var Title: some View {
        HStack {
            Text("Sign in to Your Account")
                .foregroundColor(.accentColorDark)
                .font(.largeTitle)
                .fontWeight(.heavy)
                .padding([.horizontal, .bottom]).padding(.leading)
            Spacer()
        }
    }
    var SignInButton: some View {
        BlockButtonDark(text: "Sign In") {
            withAnimation(Animation.easeIn(duration: screenAnimationDuration)) {
                onboardStepNumber = 2
            }
        }
    }
    var RememberResetHStack: some View {
        HStack {
            Button(action: { rememberMe.toggle() }) {
                HStack {
                    Text(Image(systemName: rememberMe ? "checkmark.square.fill" : "square"))
                        .foregroundColor(.accentColorDark)
                        .font(.subheadline)
                    Text("Remember Me")
                        .foregroundColor(.gray)
                        .font(.subheadline)
                }
            }
            Spacer()
            Text("Reset Password")
                .font(.subheadline)
                .fontWeight(.bold)
                .foregroundColor(Color.accentColorDark)
        }
    }
    var OrContinueWith: some View {
        HStack {
            ContinueWithDivider
            Text("or continue with")
                .lineLimit(1)
            ContinueWithDivider
        }
    }
    var ContinueWithDivider: some View {
        VStack {
            Divider()
                .foregroundColor(.accentColorDark)
                .padding(.horizontal)
        }
    }
    var SocialLogins: some View {
        HStack {
            WhiteCardShadowButton(action: { print("TODO Facebook") }) {
                Image("Social-Facebook")
                    .resizable()
                    .scaledToFit()
                    .frame(width: iconSize)
            }
            .padding(.horizontal)
            WhiteCardShadowButton(action: { print("TODO Google") }) {
                Image("Social-Google")
                    .resizable()
                    .scaledToFit()
                    .frame(width: iconSize)
            }
            .padding(.horizontal)
            WhiteCardShadowButton(action: { print("TODO Apple") }) {
                Image("Social-Apple")
                    .resizable()
                    .scaledToFit()
                    .frame(width: iconSize)
            }
            .padding(.horizontal)
        }
    }
}

struct SignIn_Previews: PreviewProvider {
    @State static var onboardStepNumber: Int = 1
    static var previews: some View {
        SignIn(onboardStepNumber: $onboardStepNumber)
    }
}

//
//  SignIn.swift
//  YoMoola
//
//  Created by Blue Heron on 2/1/23.
//

import SwiftUI

struct SignIn: View {
    @State var email = ""
    @State var password = ""
    @State var validationError = false
    @State var rememberMe = false
    
    var body: some View {
        Title
    }
    
    var Title: some View {
        Text("Sign in to Your Account")
            .foregroundColor(.accentColorDark)
            .font(.title)
            .fontWeight(.heavy)
            .padding(.bottom)
    }
//    var EmailInput: some View {
//        
//    }
}

//struct SignIn_Previews: PreviewProvider {
//    @State static var onboardStepNumber: Int = 0
//    static var previews: some View {
//        SignIn()
//    }
//}

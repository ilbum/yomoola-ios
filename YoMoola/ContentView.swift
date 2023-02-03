//
//  ContentView.swift
//  YoMoola
//
//  Created by Blue Heron on 1/30/23.
//

import SwiftUI

struct ContentView: View {
    @State var onboardStepNumber = 0
    var body: some View {
        if onboardStepNumber == 0 {
            WelcomeView(onboardStepNumber: $onboardStepNumber)
        } else if onboardStepNumber == 1 {
            SignIn(onboardStepNumber: $onboardStepNumber)
        } else {
            Text("Next Step")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(onboardStepNumber: 0)
    }
}

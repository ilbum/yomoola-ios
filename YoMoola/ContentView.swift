//
//  ContentView.swift
//  YoMoola
//
//  Created by Blue Heron on 1/30/23.
//

import SwiftUI

struct ContentView: View {
    enum Tab {
        case home
        case wallet
        case pay
        case transactions
        case profile
    }
    @State private var onboardStepNumber = 3
    @State private var selection: Tab = .home
    var body: some View {
        if onboardStepNumber == 0 {
            WelcomeView(onboardStepNumber: $onboardStepNumber)
        } else if onboardStepNumber == 1 {
            SignIn(onboardStepNumber: $onboardStepNumber)
        } else {
            TabView(selection: $selection) {
                NavigationView {
                    HomeView()
                        .tabItem { Label("Home", systemImage: "house") }
                        .tag(Tab.home)
                }
                NavigationView {
                    PayView()
                }
                    .tabItem { Label("Pay", systemImage: "creditcard") }
                    .tag(Tab.pay)
                NavigationView {
                    ProfileView()
                }
                    .tabItem { Label("Profile", systemImage: "person") }
                    .tag(Tab.profile)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    @State static var onboardStepNumber = 0
    //@State static var selection: Tab = .home
    static var previews: some View {
        ContentView()
    }
}

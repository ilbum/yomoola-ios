//
//  FullScreenViews.swift
//  YoMoola
//
//  Created by Blue Heron on 2/2/23.
//

import SwiftUI

//struct FullScreenViews<Content: View>: View {
//    init(@ViewBuilder content: @escaping () -> Content) {
//        UIScrollView.appearance().bounces = false
//        self.content = content
//    }
//    var backgroundImage: String
//    var content: () -> Content
//
//    var body: some View {
//        GeometryReader { geometry in
//            ZStack {
//                VStack {
//                    content()
//
//                    // Pushes out to edges of frame
//                    HStack { Spacer() }
//                }
//                .foregroundColor(.white)
//                .padding()
//                .edgesIgnoringSafeArea(.all) // TODO: look into this for other views
//            }
//        }
//    }
//}

struct FullScreenScrollView<Content: View>: View {
    init(@ViewBuilder content: @escaping () -> Content) {
        UIScrollView.appearance().bounces = false
        self.content = content
    }
    var content: () -> Content
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                VStack {
                    Spacer()
                    HStack { Spacer() }
                }
                .background(
                    LinearGradient(gradient: Gradient(colors: [.white, .white, .white, .accentColorLight, .accentColorLight, .accentColorLight]), startPoint: .topLeading, endPoint: .bottomTrailing)
                )
                
                ScrollView {
                    content()
                        .padding(.top)
                    // Pushes out to edges of frame
                    HStack { Spacer() }
                }
                .foregroundColor(Color.text)
                .padding()
                .edgesIgnoringSafeArea(.all)
            }
        }
    }
}

struct FullScreenViews_Previews: PreviewProvider {
    static var previews: some View {
        FullScreenScrollView {
            Text("Hello World")
        }
    }
}

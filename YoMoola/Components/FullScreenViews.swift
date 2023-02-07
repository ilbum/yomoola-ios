//
//  FullScreenViews.swift
//  YoMoola
//
//  Created by Blue Heron on 2/2/23.
//

import SwiftUI

struct FullScreenBackgroundView<Content: View>: View {
    init(backgroundImage: String, @ViewBuilder content: @escaping () -> Content) {
        UIScrollView.appearance().bounces = false
        self.backgroundImage = backgroundImage
        self.content = content
    }
    var backgroundImage: String
    var content: () -> Content

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                // Background Image
                Image(backgroundImage)
                    .resizable()
                    .aspectRatio(geometry.size, contentMode: .fill)
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    content()

                    // Pushes out to edges of frame
                    HStack { Spacer() }
                }
                .foregroundColor(.white)
                .padding()
                .edgesIgnoringSafeArea(.all) // TODO: look into this for other views
            }
        }
    }
}

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
                .background(backgroundLinearGradient)
                
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

struct FullScreenBackgroundScrollView<Content: View>: View {
    init(backgroundImage: String, @ViewBuilder content: @escaping () -> Content) {
        UIScrollView.appearance().bounces = false
        self.backgroundImage = backgroundImage
        self.content = content
    }
    var backgroundImage: String
    var content: () -> Content
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                // Background Image
                Image(backgroundImage)
                    .resizable()
                    .aspectRatio(geometry.size, contentMode: .fill)
                    .edgesIgnoringSafeArea(.all)
                
                ScrollView {
                    content()
                    
                    // Pushes out to edges of frame
                    HStack { Spacer() }
                }
                //.foregroundColor(.white)
                .edgesIgnoringSafeArea(.all)
            }
        }
    }
}

struct FullScreenViews_Previews: PreviewProvider {
    static var previews: some View {
        FullScreenScrollView {
            Spacer().frame(height: 100)
            Text("Hello World")
                .foregroundColor(.red)
        }
        FullScreenBackgroundView(backgroundImage: "background-1") {
            VStack {
                Spacer()
                Text("Hello World")
                    .foregroundColor(.red)
                Spacer()
            }
        }
        FullScreenBackgroundScrollView(backgroundImage: "background-1") {
            VStack {
                Spacer().frame(height:  80.0)
                Text("Hello World")
                    .foregroundColor(.red)
            }
        }
    }
}

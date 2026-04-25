//
//  SplashView.swift
//  VibeStream
//
//  Created by Laura Burroughs on 4/25/26.
//

import SwiftUI

struct SplashView: View {
    
    @State private var isActive = false
    @State private var scale: CGFloat = 0.8
    @State private var opacity = 0.0
    
    var body: some View {
        if isActive {
            MediaLibraryView()
        } else {
            ZStack {
                Color.appBackground.ignoresSafeArea()
                
                VStack(spacing: 12) {
                    Image("VibeStreamLogo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200)
                        .scaleEffect(scale)
                        .opacity(opacity)
                    
                    Text("VibeStream")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                        .opacity(opacity)
                }
            }
            .onAppear {
                animate()
            }
        }
    }
    
    private func animate() {
        withAnimation(.easeOut(duration: 0.6)) {
            scale = 1.1
            opacity = 1.0
        }

        withAnimation(.easeInOut(duration: 0.4).delay(0.6)) {
            scale = 1.0
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 1.4) {
            withAnimation {
                isActive = true
            }
        }
    }
}



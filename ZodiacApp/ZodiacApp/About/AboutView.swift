//
//  AboutView.swift
//  ZodiacApp
//
//  Created by Daniel on 2025-10-15.
//

import SwiftUI


struct AboutView: View {
    @State private var isVisible = false
    
    var body: some View {
        ZStack {
            // Background Image
            Image("backgroundImageName")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
                .overlay(
                    LinearGradient(
                        colors: [.black.opacity(0.4), .clear],
                        startPoint: .bottom,
                        endPoint: .top
                    )
                )

            // Frosted Glass Card
            VStack(spacing: 20) {
                Text("Team Members")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .shadow(radius: 3)

                VStack(spacing: 10) {
                    Text("Daniel Wang - A01386598")
                    Text("Gem Sha - A01345766")
                    Text("Andre Hindarmara - A01075140")
                }
                .font(.body)
                .foregroundColor(.white.opacity(0.9))
            }
            .padding(.vertical, 40)
            .padding(.horizontal, 30)
            .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 25, style: .continuous))
            .overlay(
                RoundedRectangle(cornerRadius: 25, style: .continuous)
                    .stroke(Color.white.opacity(0.3), lineWidth: 1)
            )
            .shadow(radius: 15)
            .multilineTextAlignment(.center)
            .opacity(isVisible ? 1 : 0)
            .scaleEffect(isVisible ? 1 : 0.95)
            .animation(.easeOut(duration: 1), value: isVisible)
            .onAppear {
                isVisible = true
            }
        }
    }
}


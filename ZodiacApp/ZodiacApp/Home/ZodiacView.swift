//
//  AboutView.swift
//  ZodiacApp
//
//  Created by Gem on 2025-09-26.
//

import SwiftUI

struct ZodiacView: View {
    @State var zodiacSigns: [Zodiac] = []
    
    var body: some View {
        NavigationView {
            List(zodiacSigns, id: \.name) { zodiac in
                NavigationLink(destination: DetailZodiacView(zodiac: zodiac)) {
                    HStack(spacing: 15) {
                        Image(zodiac.name) // Dynamically use zodiac name for image
                           .resizable()
                           .scaledToFit()
                           .frame(width: 100, height: 100)
                           .clipShape(Circle())
                           .shadow(color: .blue.opacity(0.3), radius: 3, x: 0, y: 2)
                        
                        Text(zodiac.name)
                            .font(.title3)
                            .fontWeight(.medium)
                            .padding(.vertical, 4)
                            .foregroundColor(.primary)
                        
                        Spacer()
                    }
                    .padding(.vertical, 10)
                }
            }
            .navigationTitle("Zodiac Signs")
            .accentColor(.blue)
            .onAppear {
                self.zodiacSigns = zodiacData // Use local zodiacData array
            }
        }
    }
}

#Preview {
    ZodiacView()
}

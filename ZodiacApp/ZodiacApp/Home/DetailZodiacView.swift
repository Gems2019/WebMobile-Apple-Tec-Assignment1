//
//  DetailZodiacView.swift
//  ZodiacApp
//
//  Created by Gem on 2025-09-26.
//

import SwiftUI

struct DetailZodiacView: View {
    let zodiac: Zodiac

    var body: some View {
        ScrollView {
            VStack(alignment: .center, spacing: 20) {
                
                Image(zodiac.name)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 400, height: 400)
                    .clipShape(Circle())
                    .shadow(color: .blue.opacity(0.3), radius: 3, x: 0, y: 2)
                
                Text(zodiac.description)
                    .font(.body)
                    .foregroundColor(Color("Text"))
                    .lineLimit(nil)
                    .multilineTextAlignment(.leading)
                    .padding()
            }
            .padding()
        }
        .background(Color("AppBackgroundColor"))
        .navigationTitle(zodiac.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    DetailZodiacView(zodiac: Zodiac(name: "Rat", description: "People born in the Year of the Rat are recognized for their charm and attraction to the opposite sex."))
}

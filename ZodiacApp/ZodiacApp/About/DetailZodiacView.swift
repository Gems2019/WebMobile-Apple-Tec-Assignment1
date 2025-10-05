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
            VStack(alignment: .leading, spacing: 16) {
                
                Image(zodiac.name)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 400, height: 400)
                
                Text(zodiac.description)
                    .font(.body)
                    .lineLimit(nil) // Allow unlimited lines
                    .multilineTextAlignment(.leading)
            }
            .padding()
        }
        .navigationTitle(zodiac.name)
        .font(.headline)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    DetailZodiacView(zodiac: Zodiac(name: "Rat", description: "People born in the Year of the Rat are recognized for their charm and attraction to the opposite sex."))
}

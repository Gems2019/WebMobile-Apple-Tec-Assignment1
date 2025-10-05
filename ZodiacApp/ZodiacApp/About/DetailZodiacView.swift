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
        VStack(alignment: .leading, spacing: 16) {
            
            Text(zodiac.name)
                .font(.largeTitle)
                .fontWeight(.bold)
            Text(zodiac.description)
                .font(.body)
        }
        .padding()
        .navigationTitle(zodiac.name)
    }
}

#Preview {
    DetailZodiacView(zodiac: Zodiac(name: "Rat", description: "People born in the Year of the Rat are recognized for their charm and attraction to the opposite sex."))
}

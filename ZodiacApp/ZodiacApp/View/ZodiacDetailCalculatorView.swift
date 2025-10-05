//
//  ZodiacDetailCalculatorView.swift
//  ZodiacApp
//
//  Created by Andre Hindarmara on 2025-10-04.
//

import SwiftUI

struct ZodiacDetailCalculatorView: View {
    let zodiac: Zodiac
    
    var body: some View {
        Section(header: Text("Your Zodiac Sign")) {
            VStack(alignment: .leading, spacing: 12) {
                Text(zodiac.name)
                    .font(.headline)
                
                HStack {
                    Spacer()
                    Image(zodiac.name)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 150)
                    Spacer()
                }
                
                Text(zodiac.description)
                    .font(.body)
                    .lineLimit(nil)
                    .multilineTextAlignment(.leading)
                    .fixedSize(horizontal: false, vertical: true)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.vertical, 8)
            .onAppear {
                print("DetailZodiacView UI appeared for: \(zodiac.name)")
            }
        }
    }
}

#Preview {
    Form {
        ZodiacDetailCalculatorView(zodiac: Zodiac(name: "Rat", description: "People born in the Year of the Rat are recognized for their charm and attraction to the opposite sex."))
    }
}

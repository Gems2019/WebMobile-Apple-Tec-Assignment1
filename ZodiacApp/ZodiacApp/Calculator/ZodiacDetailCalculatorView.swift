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
            VStack(alignment: .center, spacing: 15) {
                Text(zodiac.name)
                    .font(.title2)
                    .foregroundColor(Color("Text"))
                    .fontWeight(.semibold)
                    .foregroundColor(.blue)
                
                Image(zodiac.name)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120, height: 120)
                    .clipShape(Circle())
                    .shadow(color: .blue.opacity(0.3), radius: 3, x: 0, y: 2)
                
                Text(zodiac.description)
                    .font(.body)
                    .foregroundColor(Color("Text"))
                    .lineLimit(nil)
                    .multilineTextAlignment(.leading)
                    .fixedSize(horizontal: false, vertical: true)
                    .padding(12)
            }
            .frame(maxWidth: .infinity, alignment: .center)
            .padding(.vertical, 12)
            .background(Color("CardBackgroundColor"))
            .cornerRadius(12)
            .shadow(radius: 5)
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

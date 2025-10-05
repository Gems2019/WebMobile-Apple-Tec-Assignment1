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
                    Image(zodiac.name) // Dynamically use zodiac name for image
                       .resizable()
                       .scaledToFit()
                       .frame(width: 100, height: 100)
                    Spacer()
                    Text(zodiac.name)
                        .padding(.vertical, 4)
                }
            }
            .navigationTitle("Zodiac Signs")
            .onAppear {
                self.zodiacSigns = zodiacData // Use local zodiacData array
            }
        }
    }
}

#Preview {
    ZodiacView()
}

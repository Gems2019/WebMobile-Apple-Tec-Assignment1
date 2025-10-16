//
//  AboutView.swift
//  ZodiacApp
//
//  Created by Daniel on 2025-10-15.
//

import SwiftUI

struct AboutView: View {
    var body: some View {
        VStack(spacing: 25) {
            Text("Team Members")
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundColor(.blue)
            
            VStack(spacing: 12) {
                Text("Daniel Wang - A01386598")
                Text("Gem Sha - A01345766")
                Text("Andre Hindarmara - A01075140")
            }
            .font(.body)
            
            Spacer()
        }
        .padding()
    }
}
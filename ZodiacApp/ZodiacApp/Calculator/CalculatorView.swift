//
//  CalculatorView.swift
//  ZodiacApp
//
//  Created by Gem on 2025-09-26.
//

import SwiftUI

struct CalculatorView: View {
    @State private var birthYearString: String = "" // holds user input
    @State private var validationMessage: String = ""
    @State private var zodiacSign: String?
    
    var body: some View {
        Form {
            Section (header: Text("Enter your birth year")){
                TextField("User birth year", text: $birthYearString)
                    .keyboardType(.numberPad)
            }
            
            Section {
                Button("Submit") {
                    validateInput()
                }
            }
            
            if !validationMessage.isEmpty {
                Section {
                    Text(validationMessage)
                        .foregroundColor(.red)
                }
            }
            
            // show DetailZodiacView
            
        }
    }
    
    private func validateInput() {
        let trimmedYearString = birthYearString.trimmingCharacters(in: .whitespaces)
        
        guard !trimmedYearString.isEmpty else {
            validationMessage = "Please enter a birth year."
            return
        }
        
        guard trimmedYearString.count == 4 else {
            validationMessage = "Please enter a valid 4-digit birth year."
            return
        }
        
        guard let birthYear = Int(trimmedYearString) else {
            validationMessage = "Please enter a valid 4-digit birth year."
            return
        }
        
        guard birthYear >= 1700 && birthYear <= 2025 else {
            validationMessage = "Please enter a birth year between 1700 and 2025."
            return
        }
        
        let userZodiacSign = findZodiacSign(forYear: birthYear)
        zodiacSign = userZodiacSign
    }
    
//    private func findZodiacSign(forYear year: Int) -> String {
//        if year % 12
//    }
}

#Preview {
    CalculatorView()
}

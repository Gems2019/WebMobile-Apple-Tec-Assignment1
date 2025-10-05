//
//  CalculatorView.swift
//  ZodiacApp
//
//  Created by Gem on 2025-09-26.
//

import SwiftUI
import Foundation

struct CalculatorView: View {
    @State private var birthYearString: String = "" // holds user input
    @State private var validationMessage: String = ""
    @State private var selectedZodiac: Zodiac?
    
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
                
                Button("Reset") {
                    birthYearString = ""
                    validationMessage = ""
                    zodiacSign = nil
                    selectedZodiac = nil
                }
            }
            
            if !validationMessage.isEmpty {
                Section {
                    Text(validationMessage)
                        .foregroundColor(.red)
                }
            }
            
            // Show DetailZodiacView injected directly when zodiac is determined
            if let zodiac = selectedZodiac {
                Section(header: Text("Your Zodiac Sign")) {
                    DetailZodiacView(zodiac: zodiac)
                }
            }
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
        selectedZodiac = findZodiacObject(for: userZodiacSign)
        validationMessage = "" // Clear validation message on successful input
    }
    
    private func findZodiacSign(forYear year: Int) -> String {
        let zodiac = year % 12
        
        switch zodiac {
        case 0:
            return "Rat"
        case 1:
            return "Ox"
        case 2:
            return "Tiger"
        case 3:
            return "Rabbit"
        case 4:
            return "Dragon"
        case 5:
            return "Snake"
        case 6:
            return "Horse"
        case 7:
            return "Goat"
        case 8:
            return "Monkey"
        case 9:
            return "Rooster"
        case 10:
            return "Dog"
        default:
            return "Pig"
        }
    }
    
    private func findZodiacObject(for signName: String) -> Zodiac? {
        return zodiacData.first { $0.name == signName }
    }
}

#Preview {
    CalculatorView()
}

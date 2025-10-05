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
            
            HStack {
                Button("Submit") {
                    validateInput()
                }
                Spacer()
                Button("Reset") {
                    birthYearString = ""
                    validationMessage = ""
                    selectedZodiac = nil
                }
            }
            .padding(.horizontal)
            
            if !validationMessage.isEmpty {
                Section {
                    Text(validationMessage)
                        .foregroundColor(.red)
                        .onAppear {
                            print("Validation message UI appeared: \(validationMessage)")
                        }
                }
            }
            
            // Show ZodiacDetailCalculatorView when zodiac is determined
            if let zodiac = selectedZodiac {
                ZodiacDetailCalculatorView(zodiac: zodiac)
            }
        }
    }
    
    private func validateInput() {
        print("validateInput() called") // Debug print
        let trimmedYearString = birthYearString.trimmingCharacters(in: .whitespaces)
        
        guard !trimmedYearString.isEmpty else {
            DispatchQueue.main.async {
                validationMessage = "Please enter a birth year."
                selectedZodiac = nil
            }
            print("Validation failed: empty input")
            return
        }
        
        guard trimmedYearString.count == 4 else {
            DispatchQueue.main.async {
                validationMessage = "Please enter a valid 4-digit birth year."
                selectedZodiac = nil
            }
            print("Validation failed: not 4 digits")
            return
        }
        
        guard let birthYear = Int(trimmedYearString) else {
            DispatchQueue.main.async {
                validationMessage = "Please enter a valid 4-digit birth year."
                selectedZodiac = nil
            }
            print("Validation failed: not a number")
            return
        }
        
        guard birthYear >= 1700 && birthYear <= 2025 else {
            DispatchQueue.main.async {
                validationMessage = "Please enter a birth year between 1700 and 2025."
                selectedZodiac = nil
            }
            print("Validation failed: year out of range")
            return
        }
        
        let userZodiacSign = findZodiacSign(forYear: birthYear)
        print("Found zodiac sign: \(userZodiacSign)") // Debug print
        let zodiacObject = findZodiacObject(for: userZodiacSign)
        print("Selected zodiac object: \(zodiacObject?.name ?? "nil")") // Debug print
        
        DispatchQueue.main.async {
            selectedZodiac = zodiacObject
            validationMessage = "" // Clear validation message on successful input
        }
        print("Validation message cleared, selectedZodiac set")
    }
    
    private func findZodiacSign(forYear year: Int) -> String {
        // Chinese Zodiac calculation: 1900 is Rat (year 0), so we offset by 1900
        let zodiacIndex = (year - 1900) % 12
        
        switch zodiacIndex {
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
        case 11:
            return "Pig"
        default:
            return "Rat" // Fallback, though this shouldn't happen
        }
    }
    
    private func findZodiacObject(for signName: String) -> Zodiac? {
        return zodiacData.first { $0.name == signName }
    }
}

#Preview {
    CalculatorView()
}

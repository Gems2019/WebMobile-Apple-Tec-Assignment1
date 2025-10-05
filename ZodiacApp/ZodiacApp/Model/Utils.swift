//
//  Utils.swift
//  ZodiacApp
//
//  Created by Andre Hindarmara on 2025-10-04.
//

import Foundation

struct ValidationResult {
    let isValid: Bool
    let errorMessage: String
    let zodiac: Zodiac?
}

class ZodiacUtils {
    
    static func validateYear(_ yearString: String) -> ValidationResult {
        print("validateYear() called") // Debug print
        let trimmedYearString = yearString.trimmingCharacters(in: .whitespaces)
        
        guard !trimmedYearString.isEmpty else {
            print("Validation failed: empty input")
            return ValidationResult(isValid: false, errorMessage: "Please enter a birth year.", zodiac: nil)
        }
        
        guard trimmedYearString.count == 4 else {
            print("Validation failed: not 4 digits")
            return ValidationResult(isValid: false, errorMessage: "Please enter a valid 4-digit birth year.", zodiac: nil)
        }
        
        guard let birthYear = Int(trimmedYearString) else {
            print("Validation failed: not a number")
            return ValidationResult(isValid: false, errorMessage: "Please enter a valid 4-digit birth year.", zodiac: nil)
        }
        
        guard birthYear >= 1700 && birthYear <= 2025 else {
            print("Validation failed: year out of range")
            return ValidationResult(isValid: false, errorMessage: "Please enter a birth year between 1700 and 2025.", zodiac: nil)
        }
        
        let userZodiacSign = findZodiacSign(forYear: birthYear)
        print("Found zodiac sign: \(userZodiacSign)") // Debug print
        let zodiacObject = findZodiacObject(for: userZodiacSign)
        print("Selected zodiac object: \(zodiacObject?.name ?? "nil")") // Debug print
        
        return ValidationResult(isValid: true, errorMessage: "", zodiac: zodiacObject)
    }
    
    static func findZodiacSign(forYear year: Int) -> String {
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
            return "Rat"
        }
    }
    
    static func findZodiacObject(for signName: String) -> Zodiac? {
        return zodiacData.first { $0.name == signName }
    }
}

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
        ZStack {
            Color("AppBackgroundColor").ignoresSafeArea()
            
            Form {
                Section (header: Text("Enter your birth year")){
                    TextField("User birth year", text: $birthYearString)
                        .keyboardType(.numberPad)
                }
            
            HStack {
                Button("Submit") {
                    let result = ZodiacUtils.validateYear(birthYearString)
                    DispatchQueue.main.async {
                        validationMessage = result.errorMessage
                        selectedZodiac = result.zodiac
                    }
                    print("Validation message cleared, selectedZodiac set")
                }
                .foregroundColor(.white)
                .padding(.horizontal, 16)
                .padding(.vertical, 8)
                .background(Color.blue)
                .cornerRadius(8)
                
                Spacer()
                
                Button("Reset") {
                    birthYearString = ""
                    validationMessage = ""
                    selectedZodiac = nil
                }
                .foregroundColor(.blue)
                .padding(.horizontal, 16)
                .padding(.vertical, 8)
                .background(Color.blue.opacity(0.1))
                .cornerRadius(8)
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
            .scrollContentBackground(.hidden)
            .background(Color.clear)
        }
    }
    

}

#Preview {
    CalculatorView()
}

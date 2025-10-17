//
//  ContentView.swift
//  ToonMania
//
//  Created by Gem on 2025-09-26.
//

import SwiftUI
import SwiftData

struct ContentView: View {
   
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]

    var body: some View {
        TabView {
            ZodiacView().tabItem {
                Image(systemName: "house")
                Text("Home")
            }.tag(1)
            
            CalculatorView().tabItem {
                Image(systemName: "list.bullet")
                Text("Calculator")
            }.tag(2)
            
            AboutView().tabItem {
                Image(systemName: "sun.max")
                Text("About")
            }.tag(3)
        }
    }

    private func addItem() {
        withAnimation {
            let newItem = Item(timestamp: Date())
            modelContext.insert(newItem)
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(items[index])
            }
        }
    }
    

}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}


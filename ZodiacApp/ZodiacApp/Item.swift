//
//  Item.swift
//  ZodiacApp
//
//  Created by Gem on 2025-09-26.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}

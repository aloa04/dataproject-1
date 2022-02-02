//
//  Card.swift
//  Travis (iOS)
//
//  Created by Pablo Bottero on 2/2/22.
//

import SwiftUI

// Sample Card Model and Sample Data....
struct Card: Identifiable {
    
    var id = UUID().uuidString
    var cardColor: Color
    var date: String = ""
    var title: String
}

//
//  Download.swift
//  Travis (iOS)
//
//  Created by Pablo Bottero on 25/1/22.
//

import SwiftUI

// Sample data for Bar Graph...
struct Download: Identifiable{
    
    var id = UUID().uuidString
    var downloads: CGFloat
    var weekDay: String
}

var downloads: [Download] = [

    Download(downloads: 7, weekDay: "Lun"),
    Download(downloads: 2, weekDay: "Mar"),
    Download(downloads: 5, weekDay: "Mie"),
    Download(downloads: 15, weekDay: "Jue"),
    Download(downloads: 6, weekDay: "Vie"),
    Download(downloads: 9, weekDay: "Sab"),
    Download(downloads: 10, weekDay: "Dom"),
]

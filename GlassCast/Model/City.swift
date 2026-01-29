//
//  City.swift
//  GlassCast
//
//  Created by Chandra Kiran Reddy Yeduguri on 25/01/26.
//


import Foundation

struct City: Identifiable, Codable, Hashable {
    var id: UUID = UUID()
    let name: String
    let country: String?
    let lat: Double
    let lon: Double
}

//
//  FindCityResponse.swift
//  GlassCast
//
//  Created by Chandra Kiran Reddy Yeduguri on 25/01/26.
//

import Foundation

struct FindCityResponse: Codable {
    let list: [FindCityItem]
}

struct FindCityItem: Codable {
    let name: String
    let sys: FindCitySys
    let coord: FindCityCoord
}

struct FindCitySys: Codable {
    let country: String
}

struct FindCityCoord: Codable {
    let lat: Double
    let lon: Double
}

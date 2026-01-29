//
//  WeatherResponse.swift
//  GlassCast
//
//  Created by Chandra Kiran Reddy Yeduguri on 25/01/26.
//

import Foundation

struct WeatherResponse: Codable {
    let coord: Coord
    let weather: [Weather]
    let main: Main
    let wind: Wind
    let dt: Date        // timestamp
    let name: String
    let sys: Sys

    enum CodingKeys: String, CodingKey {
        case coord, weather, main, wind, name, sys
        case dt
    }
}

struct Coord: Codable {
    let lon: Double
    let lat: Double
}

struct Weather: Codable, Identifiable {
    let id: Int             // weather condition ID
    let main: String        // Group of weather params (Rain, Snow)
    let description: String // Full description
    let icon: String        // OWM icon code
}

struct Main: Codable {
    let temp: Double
    let feels_like: Double
    let temp_min: Double
    let temp_max: Double
    let pressure: Double
    let humidity: Double
}

struct Wind: Codable {
    let speed: Double
    let deg: Double
}

struct Sys: Codable {
    let country: String?
    let sunrise: Date?
    let sunset: Date?

    enum CodingKeys: String, CodingKey {
        case country, sunrise, sunset
    }
}

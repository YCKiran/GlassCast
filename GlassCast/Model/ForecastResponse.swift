//
//  ForecastResponse.swift
//  GlassCast
//
//  Created by Chandra Kiran Reddy Yeduguri on 25/01/26.
//

import Foundation

struct ForecastResponse: Codable {
    let list: [ForecastItem]
    let city: ForecastCity
}

struct ForecastItem: Codable, Identifiable {
//    var id: UUID = UUID()
    var id: Int { Int(dt.timeIntervalSince1970) }

    let dt: Date
    let main: Main
    let weather: [Weather]
    let wind: Wind
    let dt_txt: String?
}

struct ForecastCity: Codable {
    let name: String
    let country: String
    let timezone: Int
    let sunrise: Date?
    let sunset: Date?
}

extension ForecastResponse {
    var dailyForecasts: [ForecastItem] {
        let grouped = Dictionary(grouping: list) { item in
            let day = Calendar.current.startOfDay(for: item.dt)
            return day
        }

        return grouped
            .sorted { $0.key < $1.key }
            .compactMap { $0.value.first }
    }
}

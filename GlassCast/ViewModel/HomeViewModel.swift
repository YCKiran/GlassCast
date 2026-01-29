//
//  HomeViewModel.swift
//  GlassCast
//
//  Created by Chandra Kiran Reddy Yeduguri on 25/01/26.
//

import Foundation
import Combine


final class HomeViewModel: ObservableObject {
    @Published var weather: WeatherResponse?
    @Published var forecast: ForecastResponse?
    @Published var isLoading = false
    @Published var errorMessage: String?
    @Published var unitSymbol: String?

    private let service = OpenWeatherService()

    func loadWeather(city: City, unit: String) async {
        isLoading = true
        defer { isLoading = false }
        
        unitSymbol = unit == "metric" ? "°C" : "°F"

        do {
            weather = try await service.fetchCurrentWeather(lat: city.lat, lon: city.lon, unit: unit)
            forecast = try await service.fetchFiveDayForecast(lat: city.lat, lon: city.lon, unit: unit)
            
//            weather = try await service.fetchCurrentWeather(city: city.name, unit: unit)
//            forecast = try await service.fetchFiveDayForecast(city: city.name, unit: unit)
            print("Weather: \(weather!)")
            print("Forecast: \(forecast!)")
        } catch {
            print("Error in fetching weather: \(error)")
            errorMessage = error.localizedDescription
        }
    }
}


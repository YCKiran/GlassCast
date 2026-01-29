//
//  OpenWeatherService.swift
//  GlassCast
//
//  Created by Chandra Kiran Reddy Yeduguri on 25/01/26.
//

import Foundation

final class OpenWeatherService {
    
    func fetchCurrentWeather(lat: Double, lon: Double, unit: String) async throws -> WeatherResponse {
        
        let urlString =
        "https://api.openweathermap.org/data/2.5/weather?lat=\(lat)&lon=\(lon)&units=\(unit)&appid=\(Constants.openWeatherAPIKey)"
        
        let url = URL(string: urlString)!
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .secondsSince1970
        return try decoder.decode(WeatherResponse.self, from: data)
        
    }
    
    func fetchFiveDayForecast(lat: Double, lon: Double, unit: String) async throws -> ForecastResponse {
        let urlString =
        "https://api.openweathermap.org/data/2.5/forecast?lat=\(lat)&lon=\(lon)&units=\(unit)&appid=\(Constants.openWeatherAPIKey)"
        
        let url = URL(string: urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)!
        let (data, _) = try await URLSession.shared.data(from: url)
        
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .secondsSince1970
        
        return try decoder.decode(ForecastResponse.self, from: data)
    }
}

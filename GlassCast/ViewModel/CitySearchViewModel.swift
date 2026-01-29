//
//  CitySearchViewModel.swift
//  GlassCast
//
//  Created by Chandra Kiran Reddy Yeduguri on 25/01/26.
//

import SwiftUI
import Combine
import Foundation

final class CitySearchViewModel: ObservableObject {
    @Published var results: [City] = []

    func searchCity(query: String) async {
        guard !query.isEmpty else {
            results = []
            return
        }

        let api = "https://api.openweathermap.org/data/2.5/find?q=\(query)&type=like&appid=\(Constants.openWeatherAPIKey)"

        guard let url = URL(string: api) else { return }

        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoded = try JSONDecoder().decode(FindCityResponse.self, from: data)

            self.results = decoded.list.map {
                City(
                    name: $0.name,
                    country: $0.sys.country,
                    lat: $0.coord.lat,
                    lon: $0.coord.lon
                )
            }

        } catch {
            results = []
        }
    }

    func saveCity(_ city: City) async {
        try? await SupabaseService.shared.saveFavoriteCity(city)
    }
}

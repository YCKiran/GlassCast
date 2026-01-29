//
//  Constants.swift
//  GlassCast
//
//  Created by Chandra Kiran Reddy Yeduguri on 25/01/26.
//

import Foundation

enum Constants {
    static let supabaseURL = "https://\(Bundle.main.object(forInfoDictionaryKey: "SUPABASE_URL") as! String)"
    static let supabaseAnonKey = Bundle.main.object(forInfoDictionaryKey: "SUPABASE_KEY") as! String
    static let openWeatherAPIKey = Bundle.main.object(forInfoDictionaryKey: "WEATHER_API_KEY") as! String
}

//
//  ForecastCardView.swift
//  GlassCast
//
//  Created by Chandra Kiran Reddy Yeduguri on 25/01/26.
//


import SwiftUI

struct ForecastCardView: View {
    let item: ForecastItem

    // MARK: - Forecast Card Styled
    var body: some View {
        VStack(spacing: 10) {
            Text(formattedDay)
                .foregroundColor(.white)
                .font(.system(size: 14))
            
            Image(systemName: weatherIcon)
                .foregroundColor(.white)
                .font(.system(size: 24))
            
            Text("\(Int(item.main.temp_max))°")
                .foregroundColor(.white)
                .font(.system(size: 18, weight: .semibold))
            
            Text("\(Int(item.main.temp_min))°")
                .foregroundColor(.white.opacity(0.6))
                .font(.system(size: 14))
        }
        .padding()
        .frame(width: 90, height: 130)
//        .background(Color.white.opacity(0.06).blur(radius: 16))
//        .clipShape(RoundedRectangle(cornerRadius: 18))
//        .overlay(
//            RoundedRectangle(cornerRadius: 18)
//                .stroke(Color.white.opacity(0.15), lineWidth: 1)
//        )
        .glassEffect(.clear, in: RoundedRectangle(cornerRadius: 18))
    }
    
    // MARK: - Derived Values

    private var formattedDay: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEE"
        return formatter.string(from: item.dt)
    }

    private var weatherIcon: String {
        guard let cloud = item.weather.first?.main.lowercased() else {
            return "undefined"
        }
        return CloudTypes(rawValue: cloud)?.name ?? "questionmark.circle"
    }

}


enum CloudTypes: String {
    case clear
    case clouds
    case rain
    case drizzle
    case thunderstorm
    case snow
    case mist
    case fog
    case haze
    
    var name: String {
        switch self {
        case .clear:
            "sun.max.fill"
        case .clouds:
            "cloud.fill"
        case .rain:
            "cloud.rain.fill"
        case .drizzle:
            "cloud.drizzle.fill"
        case .thunderstorm:
            "cloud.bolt.rain.fill"
        case .snow:
            "snow"
        case .mist:
            "cloud.fog.fill"
        case .fog:
            "cloud.fog.fill"
        case .haze:
            "line.3.horizontal"
        }
    }
}

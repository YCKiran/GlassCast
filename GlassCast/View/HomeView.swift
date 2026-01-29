//
//  HomeView.swift
//  GlassCast
//
//  Created by Chandra Kiran Reddy Yeduguri on 25/01/26.
//


//import SwiftUI
//
//struct HomeView: View {
//    @EnvironmentObject var session: SessionManager
//    @AppStorage("temp_unit") private var tempUnit: String = "metric"
//
//    @StateObject private var vm = HomeViewModel()
//    @StateObject private var searchVM = CitySearchViewModel()
//
//    @State private var searchQuery = ""
//    @State private var showSettings = false
//
////    @State private var selectedCity = City(name: "Bengaluru", country: "IN")
//    @State private var selectedCity = City(
//        name: "Bengaluru",
//        country: "IN",
//        lat: 12.9716,
//        lon: 77.5946
//    )
//    
//    var body: some View {
//        NavigationStack {
//            ScrollView {
//                
//                VStack(alignment: .center, spacing: 16) {
//                    // Current Weather
//                    if let weather = vm.weather, let unitSymbol = vm.unitSymbol {
//                        VStack(alignment: .center) {
//                            Text(weather.name)
//                                .font(.largeTitle).bold()
//                            
//                            Text("\(Int(weather.main.temp))" + unitSymbol)
//                                .font(.system(size: 70)).bold()
//                            
//                            Text(weather.weather.first?.description.capitalized ?? "")
//                                .font(.title3)
//                        }
//                        .padding(.horizontal)
//                    }
//                }.padding()
//                
//                VStack(alignment: .leading, spacing: 16) {
//                    // Forecast
//                    if let forecast = vm.forecast {
//                        ScrollView(.horizontal, showsIndicators: false) {
//                            HStack(spacing: 12) {
//                                ForEach(forecast.dailyForecasts) { item in
//                                    ForecastCardView(item: item)
//                                }
//                            }
//                            .padding(.horizontal)
//                        }
//                    }
//                }
//                .padding(.top)
//            }
//            .refreshable {
//                await vm.loadWeather(city: selectedCity, unit: tempUnit)
//            }
//            .searchable(text: $searchQuery, placement: .navigationBarDrawer, prompt: "Search city")
//            .onChange(of: searchQuery) { _, q in
//                Task {
//                    await searchVM.searchCity(query: q)
//                }
//            }
//            .onSubmit(of: .search) {
//                Task {
//                    await handleCitySelection(name: searchQuery)
//                }
//            }
//            .overlay(alignment: .top) {
//                if !searchQuery.isEmpty && !searchVM.results.isEmpty {
//                    searchResultsOverlay
//                }
//            }
//            .task {
//                await vm.loadWeather(city: selectedCity, unit: tempUnit)
//            }
////            .onAppear {
////                Task {
////                    await vm.loadWeather(city: selectedCity, unit: tempUnit)
////                }
////            }
////            .refreshable {
////                await vm.loadWeather(city: selectedCity, unit: tempUnit)
////            }
//            .toolbar {
//                ToolbarItem(placement: .topBarTrailing) {
//                    Button {
//                        showSettings = true
//                    } label: {
//                        Image(systemName: "gearshape")
//                    }
//                }
//            }
//            .sheet(isPresented: $showSettings) {
//                SettingsView()
//                    .environmentObject(session)
//            }
//        }
//    }
//
//    // MARK: - Search Overlay
//    private var searchResultsOverlay: some View {
//        ScrollView {
//            VStack(alignment: .leading) {
//                ForEach(searchVM.results, id: \.self) { city in
//                    Button {
//                        Task { await handleCitySelection(city: city) }
//                    } label: {
//                        HStack {
//                            VStack(alignment: .leading) {
//                                Text(city.name)
//                                    .font(.headline)
//                                if let country = city.country {
//                                    Text(country)
//                                        .font(.subheadline).foregroundColor(.secondary)
//                                }
//                            }
//                            Spacer()
//                        }
//                        .padding(12)
//                    }
//                }
//            }
//            .background(.ultraThinMaterial)
//            .clipShape(RoundedRectangle(cornerRadius: 12))
//            .padding()
//        }
//        .padding(.top, 60)
//    }
//
//    // MARK: - Handle Selection
//    private func handleCitySelection(city: City) async {
//        self.selectedCity = city
//        self.searchQuery = ""
//
//        await vm.loadWeather(city: selectedCity, unit: tempUnit)
//        await searchVM.saveCity(city)
//    }
//
//    private func handleCitySelection(name: String) async {
////        let city = City(name: name, country: nil)
////        await handleCitySelection(city: city)
//    }
//}


//import SwiftUI
//
//struct HomeView: View {
//    @EnvironmentObject var session: SessionManager
//    @AppStorage("temp_unit") private var tempUnit: String = "metric"
//
//    @StateObject private var vm = HomeViewModel()
//    @StateObject private var searchVM = CitySearchViewModel()
//
//    @State private var searchQuery = ""
//    @State private var showSettings = false
//
//    @State private var selectedCity = City(
//        name: "Bengaluru",
//        country: "IN",
//        lat: 12.9716,
//        lon: 77.5946
//    )
//
//    var body: some View {
//        NavigationStack {
//            
//            ScrollView {
//                LazyVStack(alignment: .center, spacing: 24) {
//                    
//                    // MARK: Current Weather Section
//                    if let weather = vm.weather, let symbol = vm.unitSymbol {
//                        currentWeatherSection(weather: weather, unitSymbol: symbol)
//                            .padding(.top, 20)
//                    }
//
//                    // MARK: Forecast Section
//                    if let forecast = vm.forecast {
//                        forecastSection(forecast)
//                            .padding(.horizontal)
//                    }
//                }
//                .padding(.horizontal)
//            }
//
//            // MARK: Refreshable
//            .refreshable {
//                await vm.loadWeather(city: selectedCity, unit: tempUnit)
//            }
//
//            // MARK: Initial Load
//            .task {
//                await vm.loadWeather(city: selectedCity, unit: tempUnit)
//            }
//
//            // MARK: Search Field
//            .searchable(text: $searchQuery,
//                        placement: .navigationBarDrawer,
//                        prompt: "Search city")
//
//            .onChange(of: searchQuery) { _, q in
//                Task { await searchVM.searchCity(query: q) }
//            }
//
//            .onChange(of: tempUnit, { _, _ in
//                Task {
//                    await vm.loadWeather(city: selectedCity, unit: tempUnit)
//                }
//            })
//
////            .onSubmit(of: .search) {
////                Task { await handleCitySelection(name: searchQuery) }
////            }
//
//            // MARK: Search Overlay
//            .overlay(alignment: .top) {
//                if !searchQuery.isEmpty && !searchVM.results.isEmpty {
//                    searchResultsOverlay
//                }
//            }
//
//            .toolbar {
//                ToolbarItem(placement: .topBarTrailing) {
//                    Button { showSettings = true } label: {
//                        Image(systemName: "gearshape")
//                    }
//                }
//            }
//
//            .sheet(isPresented: $showSettings) {
//                SettingsView()
//                    .environmentObject(session)
//            }
//        }
//    }
//    
//    private func currentWeatherSection(weather: WeatherResponse, unitSymbol: String) -> some View {
//        VStack(alignment: .center, spacing: 8) {
//            Text(weather.name)
//                .font(.largeTitle).bold()
//
//            Text("\(Int(weather.main.temp))\(unitSymbol)")
//                .font(.system(size: 70)).bold()
//
//            Text(weather.weather.first?.description.capitalized ?? "")
//                .font(.title3)
//        }
//    }
//
//
//    private func forecastSection(_ forecast: ForecastResponse) -> some View {
//        ScrollView(.horizontal, showsIndicators: false) {
//            LazyHStack(spacing: 12) {
//                ForEach(forecast.dailyForecasts) { item in
//                    ForecastCardView(item: item)
//                }
//            }
//            .padding(.vertical)
//        }
//    }
//
//    private var searchResultsOverlay: some View {
//        ScrollView {
//            VStack(alignment: .leading, spacing: 0) {
//                ForEach(searchVM.results, id: \.self) { city in
//                    Button {
////                        Task { await handleCitySelection(city: city) }
//                        Task {
//                            self.selectedCity = city
//                            self.searchQuery = ""
//                            await vm.loadWeather(city: selectedCity, unit: tempUnit)
//                            await searchVM.saveCity(city)
//                        }
//                    } label: {
//                        HStack {
//                            VStack(alignment: .leading) {
//                                Text(city.name)
//                                    .font(.headline)
//                                if let country = city.country {
//                                    Text(country)
//                                        .font(.subheadline)
//                                        .foregroundColor(.secondary)
//                                }
//                            }
//                            Spacer()
//                        }
//                        .padding(12)
//                    }
//                }
//            }
//            .background(.ultraThinMaterial)
//            .clipShape(RoundedRectangle(cornerRadius: 12))
//            .padding()
//        }
//        .padding(.top, 10)
//    }
//
//    
////    private func handleCitySelection(city: City) async {
////        self.selectedCity = city
////        self.searchQuery = ""
////        await vm.loadWeather(city: selectedCity, unit: tempUnit)
////        await searchVM.saveCity(city)
////    }
////
////    private func handleCitySelection(name: String) async {
//////        let city = City(name: name, country: nil)
//////        await handleCitySelection(city: city)
////    }
//
//    
//}
//
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var session: SessionManager
    @AppStorage("temp_unit") private var tempUnit: String = "metric"

    @StateObject private var vm = HomeViewModel()
    @StateObject private var searchVM = CitySearchViewModel()

    @State private var searchQuery = ""
    @State private var showSettings = false
    @State private var showAlert = false

    @State private var selectedCity = City(
        name: "Bengaluru",
        country: "IN",
        lat: 12.9716,
        lon: 77.5946
    )
    
    private var currentWeatherCloud: String {
        guard let cloud = vm.weather?.weather.first?.main.lowercased() else {
            return "undefined"
        }
        return CloudTypes(rawValue: cloud)?.name ?? "questionmark.circle"
    }

    var body: some View {
        NavigationStack {
            ZStack {

                // MARK: Background Gradient
                LinearGradient(
                    colors: [
                        Color(hex: "#0F1C3F"),
                        Color(hex: "#091021")
                    ],
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()

                ScrollView(showsIndicators: false) {
                    VStack(alignment: .leading, spacing: 24) {

//                        // MARK: Header
//                        headerSection
//
//                        // MARK: Search Bar
//                        searchBar

                        // MARK: Current Weather
                        if let weather = vm.weather, let symbol = vm.unitSymbol {
                            currentWeatherCard(weather: weather, unitSymbol: symbol)
                                .padding(.horizontal)
                                .padding(.top, 8)
                        }

                        // MARK: Forecast
                        if let forecast = vm.forecast {
                            forecastHeader
                                .padding(.horizontal)

                            forecastScroll(forecast)
                            
                        }

                        Spacer(minLength: 40)
                    }
                    .padding(.top, 20)
                }

                // MARK: Search Overlay
                if !searchQuery.isEmpty && !searchVM.results.isEmpty {
                    searchResultsOverlay
                }
            }

            // MARK: Refreshable
            .refreshable {
//                await vm.loadWeather(city: selectedCity, unit: tempUnit)
                print("Refreshing...")
                Task {
                    await vm.loadWeather(city: selectedCity, unit: tempUnit)
                    print("Refreshed!")
                }
            }

            // MARK: Initial Load
            .task {
                print("Called task")
                await vm.loadWeather(city: selectedCity, unit: tempUnit)
            }

            // MARK: Search binding
            .searchable(text: $searchQuery,
                        placement: .navigationBarDrawer,
                        prompt: "Search city")

            .onChange(of: searchQuery) { _, q in
                Task {
                    await searchVM.searchCity(query: q)
                }
            }

            // MARK: Temp Unit Change
            .onChange(of: tempUnit) { _, _ in
                Task {
                    await vm.loadWeather(city: selectedCity, unit: tempUnit)
                }
            }

            // MARK: Settings
            .sheet(isPresented: $showSettings) {
                SettingsView()
                    .environmentObject(session)
            }

            // MARK: Toolbar
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button { showSettings = true } label: {
                        Image(systemName: "gearshape")
                            .foregroundColor(.white)
                    }
                }
            }
            // MARK: Alert
            .alert("Error", isPresented: $showAlert) {
                Button("Ok", role: .cancel){
                    vm.errorMessage = nil
                }
            } message: {
                Text(vm.errorMessage ?? "Undefined Error")
            }
        }
    }
}

// MARK: - Header
private extension HomeView {
    var headerSection: some View {
        HStack {
            Spacer()
            Text("GlassCast")
                .foregroundColor(.white)
                .font(.system(size: 22, weight: .semibold))
            Spacer()

            Button {
                showSettings = true
            } label: {
                Image(systemName: "gearshape.fill")
                    .foregroundColor(.white)
                    .font(.system(size: 20))
            }
        }
        .padding(.horizontal)
    }
}

// MARK: - Search Bar
private extension HomeView {
    var searchBar: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.white.opacity(0.6))

            TextField("Search for a city...", text: $searchQuery)
                .foregroundColor(.white)
        }
        .padding()
        .background(Color.white.opacity(0.08).blur(radius: 20))
        .clipShape(RoundedRectangle(cornerRadius: 18))
        .overlay(
            RoundedRectangle(cornerRadius: 18)
                .stroke(Color.white.opacity(0.15), lineWidth: 1)
        )
        .padding(.horizontal)
    }
}

// MARK: - Current Weather Card
private extension HomeView {
    func currentWeatherCard(weather: WeatherResponse, unitSymbol: String) -> some View {
        GlassCard {
            VStack(alignment: .leading, spacing: 18) {

                Text("CURRENT LOCATION")
                    .foregroundColor(.white.opacity(0.7))
                    .font(.system(size: 13, weight: .semibold))

                HStack {
                    VStack(alignment: .leading, spacing: 6) {
                        Text(weather.name)
                            .foregroundColor(.white)
                            .font(.system(size: 26, weight: .bold))

                        Text("\(Int(weather.main.temp))\(unitSymbol)")
                            .foregroundColor(.white)
                            .font(.system(size: 54, weight: .bold))

                        HStack(spacing: 6) {
//                            Image(systemName: "cloud.sun.fill")
//                                .foregroundColor(.white.opacity(0.85))
                            Text(weather.weather.first?.description.capitalized ?? "")
                                .foregroundColor(.white.opacity(0.7))
                                .font(.system(size: 15))
                        }

                        Text("H: \(Int(weather.main.temp_max))°   L: \(Int(weather.main.temp_min))°")
                            .foregroundColor(.white.opacity(0.65))
                            .font(.system(size: 13))
                    }

                    Spacer()

                    Image(systemName: currentWeatherCloud)
                        .font(.system(size: 70))
                        .foregroundColor(.white.opacity(0.25))
                }

                HStack(spacing: 0) {
                    WeatherMetric(icon: "wind",
                                  value: "\(Int(weather.wind.speed)) mph")

                    Divider().background(Color.white.opacity(0.2))

                    WeatherMetric(icon: "drop.fill",
                                  value: "\(Int(weather.main.humidity))%")

                    Divider().background(Color.white.opacity(0.2))

                    WeatherMetric(icon: "sun.max.fill",
                                  value: "\(weather.main.pressure) hPa")
                }
                .padding()
                .padding(.vertical, 10)
                .background(Color.white.opacity(0.05))
                .clipShape(RoundedRectangle(cornerRadius: 16))
                
            }
        }
        
    }
}

// MARK: - Forecast Header
private extension HomeView {
    var forecastHeader: some View {
        HStack {
            Text("5-Day Forecast")
                .foregroundColor(.white)
                .font(.system(size: 18, weight: .semibold))

            Spacer()

//            Button(action: {}) {
//                HStack(spacing: 2) {
//                    Text("Full Details")
//                    Image(systemName: "chevron.right")
//                }
//                .foregroundColor(.blue)
//                .font(.system(size: 14, weight: .semibold))
//            }
        }
    }
}

// MARK: - Forecast Scroll
private extension HomeView {
    func forecastScroll(_ forecast: ForecastResponse) -> some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 16) {
                ForEach(forecast.dailyForecasts) { item in
                    ForecastCardView(item: item)
                }
            }
            .padding(.horizontal)
            .padding(.bottom, 20)
        }
    }
}

// MARK: - City Search Overlay
private extension HomeView {
    var searchResultsOverlay: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                
                ForEach(searchVM.results, id: \.self) { city in
                    Button {
                        Task {
                            self.selectedCity = city
                            self.searchQuery = ""
                            await vm.loadWeather(city: selectedCity, unit: tempUnit)
                            await searchVM.saveCity(city)
                        }
                    } label: {
                        HStack {
                            VStack(alignment: .leading) {
                                Text(city.name)
                                    .foregroundColor(.white)
                                    .font(.headline)

                                if let country = city.country {
                                    Text(country)
                                        .foregroundColor(.white.opacity(0.6))
                                        .font(.subheadline)
                                }
                            }
                            Spacer()
                        }
                        .padding(12)
                    }
                }
            }
//            .background(Color.white.opacity(0.9).blur(radius: 20))
            .background(
                LinearGradient(
                    colors: [
                        Color(hex: "#0F1C3F"),
                        Color(hex: "#091021")
                    ],
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
//            .clipShape(RoundedRectangle(cornerRadius: 14))
            .glassEffect(.clear, in: RoundedRectangle(cornerRadius: 14))
            .padding()
        }
        .padding(.top, 10)
    }
}

// MARK: - GlassCard
struct GlassCard<Content: View>: View {
    let content: Content
    init(@ViewBuilder content: () -> Content) { self.content = content() }

    var body: some View {
        content
            .padding(24)
//            .background(Color.white.opacity(0.05).blur(radius: 20))
//            .clipShape(RoundedRectangle(cornerRadius: 22))
//            .overlay(
//                RoundedRectangle(cornerRadius: 22)
//                    .stroke(Color.white.opacity(0.15), lineWidth: 1)
//            )
            .glassEffect(.clear, in: RoundedRectangle(cornerRadius: 22))
    }
}

// MARK: - WeatherMetric
struct WeatherMetric: View {
    let icon: String
    let value: String
    var body: some View {
        HStack(spacing: 6) {
            Image(systemName: icon)
                .foregroundColor(.white.opacity(0.9))
                .font(.system(size: 16))
            Text(value)
                .foregroundColor(.white.opacity(0.9))
                .font(.system(size: 14))
        }
        .frame(maxWidth: .infinity)
    }
}



// MARK: - HEX Color Helper
//extension Color {
//    init(hex: String) {
//        let scanner = Scanner(string: hex)
//        _ = scanner.scanString("#")
//        var rgb: UInt64 = 0
//        scanner.scanHexInt64(&rgb)
//        self.init(
//            red: Double((rgb >> 16) & 0xFF) / 255,
//            green: Double((rgb >> 8) & 0xFF) / 255,
//            blue: Double(rgb & 0xFF) / 255
//        )
//    }
//}


#Preview {
   HomeView()
}

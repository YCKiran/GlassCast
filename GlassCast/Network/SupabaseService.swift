//
//  SupabaseService.swift
//  GlassCast
//
//  Created by Chandra Kiran Reddy Yeduguri on 25/01/26.
//

import Supabase
import Foundation

final class SupabaseService {
    static let shared = SupabaseService()
    
    var session: Session?
    
    let client: SupabaseClient

    private init() {
        client = SupabaseClient(
            supabaseURL: URL(string: Constants.supabaseURL)!,
            supabaseKey: Constants.supabaseAnonKey
        )
    }

    func getCurrentSession() async throws {
        do {
            self.session = try await client.auth.session
        } catch {
            print("No active session: " + error.localizedDescription)
        }
    }
    
    // MARK: - Auth
    func signIn(email: String, password: String) async throws {
        try await client.auth.signIn(email: email, password: password)
    }

    func signUp(email: String, password: String) async throws {
        try await client.auth.signUp(email: email, password: password)
    }

    func signOut() async throws {
        try await client.auth.signOut()
    }

    func forgotPassword(email: String) async throws {
        try await client.auth.resetPasswordForEmail(email)
    }
    
    var currentUserId: UUID? {
        client.auth.currentUser?.id
    }

    // MARK: - Save Favorite City
    func saveFavoriteCity(_ city: City) async throws {
        guard let userId = currentUserId else { return }

//        let payload: [String: Any] = [
//            "user_id": userId,
//            "city_name": city.name,
//            "lat": city.lat,
//            "lon": city.lon
//        ]
        let payload: FavoriteCityRow = FavoriteCityRow(id: city.id, user_id: userId, city_name: city.name, lat: city.lat, lon: city.lon)
        

        try await client.from("favorite_cities").insert(payload).execute()
    }

//    // MARK: - Fetch Cities for Logged in User
//    func fetchFavoriteCities() async throws -> [City] {
//        guard let userId = currentUserId else { return [] }
//
//        let response = try await client
//            .database
//            .from("favorite_cities")
//            .select()
//            .eq(column: "user_id", value: userId)
//            .order(column: "created_at", ascending: false)
//            .execute()
//
//        let cities = try response.decoded(to: [FavoriteCityRow].self)
//
//        return cities.map {
//            City(name: $0.city_name,
//                 country: nil,
//                 lat: $0.lat,
//                 lon: $0.lon)
//        }
//    }
}

// MARK: - DTO for Supabase Row
struct FavoriteCityRow: Codable {
    let id: UUID
    let user_id: UUID
    let city_name: String
    let lat: Double
    let lon: Double
//    let created_at: String
}

//
//  SessionManager.swift
//  GlassCast
//
//  Created by Chandra Kiran Reddy Yeduguri on 25/01/26.
//


import Foundation
import Combine
import Supabase

@MainActor
final class SessionManager: ObservableObject {

    @Published var isAuthenticated: Bool = false

    init() {
        self.isAuthenticated = SupabaseService.shared.currentUserId != nil
    }

    func updateAuthState() {
        isAuthenticated = SupabaseService.shared.currentUserId != nil
    }

    func signOut() async {
        do {
            try await SupabaseService.shared.signOut()
            isAuthenticated = false     // Redirect triggers
        } catch {
            print("Sign out error: \(error)")
        }
    }
}

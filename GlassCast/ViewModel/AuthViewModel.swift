//
//  AuthViewModel.swift
//  GlassCast
//
//  Created by Chandra Kiran Reddy Yeduguri on 25/01/26.
//

import Foundation
import Combine

class AuthViewModel: ObservableObject {
//    @Published var email: String?
//    @Published var password: String?
    @Published var email = ""
    @Published var password = ""
    @Published var isAuthenticated = false
    @Published var errorMessage: String?
    
    func isSessionActive() async {
        do {
            try await SupabaseService.shared.getCurrentSession()
            isAuthenticated = true
        } catch {
            errorMessage = error.localizedDescription
        }
    }

    func login() async {
        if email != "" && password != "" {
            do {
                try await SupabaseService.shared.signIn(
                    email: email,
                    password: password
                )
                isAuthenticated = true
            } catch {
                errorMessage = error.localizedDescription
            }
        } else {
            errorMessage = "Enter a valid email and password."
        }
    }

    func signUp() async {
        if email != "" && password != "" {
            do {
                try await SupabaseService.shared.signUp(
                    email: email,
                    password: password
                )
                isAuthenticated = true
            } catch {
                errorMessage = error.localizedDescription
            }
        } else {
            errorMessage = "Enter a valid email and password."
        }
    }
    
    func resetPassword() async {
        if email != "" {
            do {
                try await SupabaseService.shared.forgotPassword(email: email)
            } catch {
                errorMessage = error.localizedDescription
            }
        } else {
            errorMessage = "Enter a valid email address."
        }
    }
}


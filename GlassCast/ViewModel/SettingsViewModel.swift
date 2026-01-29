//
//  SettingsViewModel.swift
//  GlassCast
//
//  Created by Chandra Kiran Reddy Yeduguri on 25/01/26.
//


import Combine
import SwiftUI

final class SettingsViewModel: ObservableObject {
    @AppStorage("temp_unit") var tempUnit: String = "metric"

    func signOut() async {
        try? await SupabaseService.shared.signOut()
        print("Signed out successfully")
    }
}

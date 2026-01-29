//
//  SettingsView.swift
//  GlassCast
//
//  Created by Chandra Kiran Reddy Yeduguri on 25/01/26.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var session: SessionManager
    @AppStorage("temp_unit") private var tempUnit = "metric"

    var body: some View {
        NavigationStack {
            Form {
                Toggle("Use Fahrenheit", isOn:
                    Binding(
                        get: { tempUnit == "imperial" },
                        set: { tempUnit = $0 ? "imperial" : "metric" }
                    )
                )

                Button("Sign Out") {
                    Task {
                        await session.signOut()
                    }
                }
                .foregroundStyle(.red)
            }
            .navigationTitle("Settings")
        }
    }
}

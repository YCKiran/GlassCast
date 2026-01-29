//
//  RootView.swift
//  GlassCast
//
//  Created by Chandra Kiran Reddy Yeduguri on 25/01/26.
//


import SwiftUI

struct RootView: View {
    @StateObject private var session = SessionManager()

    var body: some View {
        Group {
            if session.isAuthenticated {
                HomeView()
                    .environmentObject(session)
            } else {
                AuthView()
                    .environmentObject(session)
            }
        }
    }
}



//#Preview {
//    RootView()
//}

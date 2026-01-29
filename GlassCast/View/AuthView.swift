//
//  AuthView.swift
//  GlassCast
//
//  Created by Chandra Kiran Reddy Yeduguri on 25/01/26.
//

import SwiftUI
import Combine

struct AuthView: View {
    @EnvironmentObject var session: SessionManager
    @StateObject private var vm = AuthViewModel()

    @State private var showAlert: Bool = false
    @State private var alertType: AlertTypes = .info
    @State private var alertMessage: String?
    
    private let topColor = Color(hex: "#0F1C3F")
    private let bottomColor = Color(hex: "#091021")
    
    var body: some View {
            ZStack {
                // Background Gradient
                LinearGradient(
                    colors: [topColor, bottomColor],
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()
                
                VStack(spacing: 28) {
                    
                    // Logo + Title
                    VStack(spacing: 8) {
                        HStack(spacing: 8) {
                            Image(systemName: "cloud.sun.fill")
                                .foregroundColor(.white)
                                .font(.system(size: 26))
                            Text("GlassCast")
                                .foregroundColor(.white)
                                .font(.system(size: 28, weight: .semibold))
                        }
                        
                        Text("Real-time weather at your fingertips.")
                            .foregroundColor(.white.opacity(0.65))
                            .font(.system(size: 15))
                    }
                    .padding(.top, 40)
                    
                    // Glass Card
                    VStack(spacing: 22) {
                        
                        VStack(alignment: .leading, spacing: 6) {
                            Text("Username or Email")
                                .foregroundColor(.white.opacity(0.7))
                                .font(.system(size: 14))
                            
                            HStack {
                                TextField("Enter your username", text: $vm.email)
                                    .foregroundColor(.white)
                                    .textInputAutocapitalization(.never)
                                
                                Image(systemName: "person.crop.circle")
                                    .foregroundColor(.white.opacity(0.5))
                            }
                            .padding()
//                            .background(Color.white.opacity(0.08))
//                            .clipShape(RoundedRectangle(cornerRadius: 12))
//                            .overlay(
//                                RoundedRectangle(cornerRadius: 12)
//                                    .stroke(Color.white.opacity(0.12), lineWidth: 1)
//                            )
                            .glassEffect(.clear.interactive(), in: RoundedRectangle(cornerRadius: 12))
                        }
                        
                        VStack(alignment: .leading, spacing: 6) {
                            Text("Password")
                                .foregroundColor(.white.opacity(0.7))
                                .font(.system(size: 14))
                            
                            HStack {
                                SecureField("Password", text: $vm.password)
                                    .foregroundColor(.white)
                                
                                Image(systemName: "lock.fill")
                                    .foregroundColor(.white.opacity(0.5))
                            }
                            .padding()
//                            .background(Color.white.opacity(0.08))
//                            .clipShape(RoundedRectangle(cornerRadius: 12))
//                            .overlay(
//                                RoundedRectangle(cornerRadius: 12)
//                                    .stroke(Color.white.opacity(0.12), lineWidth: 1)
//                            )
                            .glassEffect(.clear.interactive(), in: RoundedRectangle(cornerRadius: 12))
                            
//                            HStack {
//                                Spacer()
//                                
//                                Button {
//                                    Task {
//                                        await vm.resetPassword()
//                                        if vm.email != "" {
//                                            alertType = .info
//                                            alertMessage = "Check your inbox for a password reset link."
//                                            showAlert = true
//                                        } else {
//                                            guard let errorMessage = vm.errorMessage else { return }
//                                            alertType = .error
//                                            alertMessage = errorMessage
//                                            showAlert = true
//                                        }
//                                    }
//                                } label: {
//                                    Text("Forgot?")
//                                }
//                                    .foregroundColor(Color.blue)
//                                    .font(.system(size: 13, weight: .semibold))
//                            }
                        }
                        
                        GlassEffectContainer {
                            // Sign In Button
                            Button {
                                Task {
                                    await vm.login()
                                    if vm.isAuthenticated {
                                        session.updateAuthState()
                                    } else {
                                        if let errorMessage = vm.errorMessage {
                                            alertType = .error
                                            alertMessage = errorMessage
                                            showAlert = true
                                        }
                                    }
                                    
                                }
                            } label: {
                                Text("Sign In")
                                    .font(.system(size: 18, weight: .semibold))
                                    .frame(maxWidth: .infinity)
                                    .padding()
//                                    .background(Color.blue)
                                    .foregroundColor(.white)
//                                    .clipShape(RoundedRectangle(cornerRadius: 14))
//                                    .shadow(color: Color.blue.opacity(0.4),
//                                            radius: 10, y: 5)
                                    .glassEffect(.regular.tint(.blue).interactive(), in: RoundedRectangle(cornerRadius: 14))
                            }
                            
                            // Create Account Button
                            Button {
                                Task {
                                    await vm.signUp()
                                    if vm.isAuthenticated {
                                        session.updateAuthState()
                                        alertType = .info
                                        alertMessage = "Please check your inbox for a confirmation link. And then sign in again."
                                        showAlert = true
                                    }
                                    if let error = vm.errorMessage {
                                        alertType = .error
                                        alertMessage = error
                                        showAlert = true
                                    }
                                }
                            } label: {
                                Text("Create Account")
                                    .font(.system(size: 17, weight: .semibold))
                                    .frame(maxWidth: .infinity)
                                    .padding()
                                    .foregroundColor(.blue)
//                                    .background(Color.white.opacity(0.05))
//                                    .clipShape(RoundedRectangle(cornerRadius: 14))
//                                    .overlay(
//                                        RoundedRectangle(cornerRadius: 14)
//                                            .stroke(Color.blue.opacity(0.4), lineWidth: 1)
//                                    )
                                    .glassEffect(.regular.tint(.white.opacity(0.4)).interactive(), in: RoundedRectangle(cornerRadius: 14))
                            }
                        }
                    }
                    .padding(24)
//                    .background(Color.white.opacity(0.05).blur(radius: 30))
//                    .clipShape(RoundedRectangle(cornerRadius: 24))
//                    .overlay(
//                        RoundedRectangle(cornerRadius: 24)
//                            .stroke(Color.white.opacity(0.15), lineWidth: 1)
//                    )
                    .glassEffect(.clear.tint(.white.opacity(0.01)), in: RoundedRectangle(cornerRadius: 30))
                    .padding(.horizontal, 22)
                    
                    // OR CONNECT WITH
//                    VStack(spacing: 16) {
//                        Text("OR CONNECT WITH")
//                            .foregroundColor(.white.opacity(0.5))
//                            .font(.system(size: 13))
//                        
//                        HStack(spacing: 30) {
//                            Circle()
//                                .frame(width: 50, height: 50)
//                                .foregroundColor(Color.white.opacity(0.08))
//                                .overlay(
//                                    Image(systemName: "iphone")
//                                        .foregroundColor(.white.opacity(0.8))
//                                        .font(.system(size: 20))
//                                )
//                            
//                            Circle()
//                                .frame(width: 50, height: 50)
//                                .foregroundColor(Color.white.opacity(0.08))
//                                .overlay(
//                                    Image(systemName: "globe")
//                                        .foregroundColor(.white.opacity(0.8))
//                                        .font(.system(size: 20))
//                                )
//                        }
//                    }
                    
                    Spacer()
                    
                    Text("SECURE END-TO-END ENCRYPTION")
                        .foregroundColor(.white.opacity(0.4))
                        .font(.system(size: 12))
                        .padding(.bottom, 20)
                }
            }
            .onChange(of: showAlert) { _, newValue in
                print(newValue)
            }
            .alert(alertType.name, isPresented: $showAlert) {
                Button("OK", role: .cancel) {
                    alertMessage = nil
                }
            } message: {
                Text(alertMessage ?? "Undefiend Issue...")
            }
            

        }
    }


    
    
#Preview {
    AuthView()
        .preferredColorScheme(.dark)
}


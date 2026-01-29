//
//  ContentView.swift
//  GlassCast
//
//  Created by Chandra Kiran Reddy Yeduguri on 25/01/26.
//

import SwiftUI

struct ContentView: View {
    @State private var showAlert = false
    
    var body: some View {
        
        
//        VStack {
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundStyle(.tint)
//                .font(.largeTitle)
//                    .foregroundStyle(.white)
//                    .frame(width: 60, height: 60)
//                    .glassEffect(.regular.interactive())
//            Text("Hello, world!")
//                .font(.title)
//                    .bold()
//                    .foregroundStyle(.white)  // High contrast for legibility
//                    .padding()
//                    .glassEffect()
//                .padding()
//            
//            Button("Sign In") {
//                
//            }
//            .padding()
//            .glassEffect(.regular.tint(.orange.opacity(0.5)).interactive(), in: .capsule)
//            
//        }
//        .padding()
//        
//        GlassEffectContainer {
//            HStack(spacing: 20) {
//                Image(systemName: "pencil")
//                    .frame(width: 44, height: 44)
//                    .glassEffect(.regular.interactive())
//                
//                Image(systemName: "eraser")
//                    .frame(width: 44, height: 44)
//                    .glassEffect(.regular.interactive())
//            }
//        }
//
        
        
        Button("Show Alert") {
                    // 2. Change the state to true when the button is tapped.
                    showAlert = true
                }
                // 3. Attach the .alert modifier to the view.
                .alert("Important Message", isPresented: $showAlert) {
                    // 4. Define the alert's buttons and actions.
                    Button("OK", role: .cancel) {
                        // Action to perform when "OK" is tapped (optional)
                        print("Alert dismissed")
                    }
                } message: {
                    // 5. Define the alert's message (optional).
                    Text("This is a simple alert in SwiftUI.")
                }
        
    }
}

#Preview {
    ContentView()
        .preferredColorScheme(.dark)
}

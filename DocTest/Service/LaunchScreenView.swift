//
//  LaunchScreenView.swift
//  DocTest
//
//  Created by Nikita Tsomuk on 16.03.2024.
//

import SwiftUI

struct LaunchScreenView: View {
    
    @State private var isActive = false
    @State private var size = 0.5
    @State private var opacity = 0.5
    
    var body: some View {
        
        if isActive {
            ContentView()
        } else {
            ZStack {
                Color.accentColor
                    .ignoresSafeArea()
                VStack {
                    Text("Doct24")
                        .font(.system(size: 100, weight: .bold))
                        .foregroundColor(.white)
                        .scaleEffect(size)
                        .opacity(opacity)
                        .onAppear {
                            withAnimation(.easeIn(duration: 1.3)) {
                                self.size = 0.7
                                self.opacity = 1.0
                            }
                        }
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2.2) {
                                withAnimation {
                                    self.isActive = true
                                }
                            }
                        }
                }
            }
        }
    }
}

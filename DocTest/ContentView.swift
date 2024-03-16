//
//  ContentView.swift
//  DocTest
//
//  Created by Nikita Tsomuk on 16.03.2024.
//

import SwiftUI

struct ContentView: View {
    
    let tabBarAppeareance = UITabBarAppearance()
    
    var body: some View {
        TabView {
//           MainView()
            DoctorCardView() // Временно
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Главная")
                }
//            VisitView()
            DoctorDetailView() // Временно
                .tabItem {
                    Image(systemName: "calendar.badge.plus")
                    Text("Приемы")
                }
//            ChatView()
            PriceView()
                .tabItem {
                    Image(systemName: "message.badge.filled.fill")
                    Text("Чат")
                }
            ProfileView()
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Профиль")
                }
        }
        .toolbarBackground(.black, for: .tabBar)
    }
}

#Preview {
    ContentView()
}

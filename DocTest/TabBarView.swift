//
//  ContentView.swift
//  DocTest
//
//  Created by Nikita Tsomuk on 16.03.2024.
//

import SwiftUI

struct TabBarView: View {
    
    init() {
        UITabBar.appearance().backgroundColor = UIColor.white
    }
    
    
    var body: some View {
        return TabView {
            DoctorListView()
                .tabItem {
                    Label("Главная", systemImage: "house.fill")
                }
            
            Image(systemName: "calendar.badge.plus").font(.largeTitle)
                .tabItem {
                    Label("Приемы", systemImage: "calendar.badge.plus")
                }
            
            Image(systemName: "message.badge.filled.fill").font(.largeTitle)
                .tabItem {
                    Label("Чат", systemImage: "message.badge.filled.fill")
                }
            
            Image(systemName: "person.fill").font(.largeTitle)
                .tabItem {
                    Label("Профиль", systemImage: "person.fill")
                }
        }
    }
}

#Preview {
    TabBarView()
}

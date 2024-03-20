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
        NavigationView {
            TabView {
                Group {
                    DoctorListView()
                        .tabItem {
                            Image(systemName: "house.fill")
                            Text("Главная")
                        }
                    VisitView()
                        .tabItem {
                            Image(systemName: "calendar.badge.plus")
                            Text("Приемы")
                        }
                    ChatView()
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
                .toolbarBackground(.white, for: .tabBar)
                .toolbarBackground(.visible, for: .tabBar)
            } .navigationBarTitle("Педиатры", displayMode: .inline)
        }
    }
}

#Preview {
    ContentView()
}

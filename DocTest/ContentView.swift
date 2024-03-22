//
//  ContentView.swift
//  DocTest
//
//  Created by Nikita Tsomuk on 16.03.2024.
//

import SwiftUI

struct ContentView: View {
    
    let tabBarAppeareance = UITabBarAppearance()
    
    @State var selection = 0
    
    var body: some View {
        NavigationView {
            TabView(selection: $selection) {
                Group {
                    DoctorListView()
                        .tabItem {
                            Image(systemName: "house.fill")
                            Text("Главная")
                        }
                        .tag(0)
                        
                    VisitView()
                        .tabItem {
                            Image(systemName: "calendar.badge.plus")
                            Text("Приемы")
                        }
                        .tag(1)
                    ChatView()
                        .tabItem {
                            Image(systemName: "message.badge.filled.fill")
                            Text("Чат")
                        }
                        .tag(2)
                    ProfileView()
                        .tabItem {
                            Image(systemName: "person.fill")
                            Text("Профиль")
                        }
                        .tag(3)
                }
                .toolbarBackground(.white, for: .tabBar)
                .toolbarBackground(.visible, for: .tabBar)
            }
            .navigationBarTitle(selection == 0 ? "Педиатры" : "", displayMode: .inline)
        }
        
    }
}

#Preview {
    ContentView()
}

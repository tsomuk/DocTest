//
//  ContentView.swift
//  DocTest
//
//  Created by Nikita Tsomuk on 16.03.2024.
//

import SwiftUI

struct TabBarView: View {
    
    let tabBarAppeareance = UITabBarAppearance()
    
    @State var selection = 0
    
    var body: some View {
        NavigationView {
            TabView(selection: $selection) {
                Group {
                    DoctorListBuilder.create()
                        .tabItem {
                            Label("Главная", systemImage: "house.fill")
                        }
                        .tag(0)
                    
                    Image(systemName: "calendar.badge.plus").font(.largeTitle)
                        .tabItem {
                            Label("Приемы", systemImage: "calendar.badge.plus")
                        }
                        .tag(1)
                    Image(systemName: "message.badge.filled.fill").font(.largeTitle)
                        .tabItem {
                            Label("Чат", systemImage: "message.badge.filled.fill")
                        }
                        .tag(2)
                    Image(systemName: "person.fill").font(.largeTitle)
                        .tabItem {
                            Label("Профиль", systemImage: "person.fill")
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
    TabBarView()
}

//
//  MainScreen.swift
//  DocTest
//
//  Created by Nikita Tsomuk on 16.03.2024.
//

import SwiftUI

struct DoctorListView: View {
    
    private let networkService = NetworkService.shared
    @State var doctor: Doctor?
    //    @State var numberOfCards: Int?
    var numberOfCards: Int = 20
    
    var body: some View {
        ZStack {
            Color.background.edgesIgnoringSafeArea(.all)
            ScrollView {
                VStack(spacing: 16) {
                    ForEach((0...numberOfCards), id: \.self) { item in
                        DoctorCardView(
                            surname: "\(doctor?.record.data.users[item].lastName ?? "Last Name")",
                            name: "\(doctor?.record.data.users[item].firstName ?? "Name")",
                            patronymic: "\(doctor?.record.data.users[item].patronymic ?? "Patronymic")",
                            speciality: "Педиатр",
                            expYears: doctor?.record.data.users[item].seniority ?? 0,
                            price: doctor?.record.data.users[item].videoChatPrice ?? 0,
                            rating: doctor?.record.data.users[item].rank ?? 0
                        )
                        
                        
                    }
                    
                }
            }
            .onAppear {
                Task {
                    let result = try await networkService.fetchData()
                    self.doctor = result
                    //                    self.numberOfCards = result.record.data.users.count
                }
            }
        }
    }
    
    func calculateExperence(startDate: Double, endDate: Double) -> Int {
        let startDate = Date(timeIntervalSince1970: startDate)
        let endDate = Date(timeIntervalSince1970: endDate)
        
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year], from: startDate, to: endDate)
        
        if let years = components.year {
            print("Разница в годах: \(years)")
            return years
        } else {
            print("Ошибка вычисления разницы в годах")
            return 0
        }
    }
}

#Preview {
    DoctorListView()
}

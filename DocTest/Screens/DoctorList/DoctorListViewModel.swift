//
//  DoctorListViewModel.swift
//  DocTest
//
//  Created by Nikita Tsomuk on 22.03.2024.
//

import Foundation

final class DoctorListViewModel: ObservableObject {
    
    @Published var numberOfCards: Int = 0
    @Published var doctor: Doctor? = nil
    @Published var doctorDataBase : [User] = []
    
    init() {
//        doctorDataBase = getData()
    }
    
    
    private let networkService = NetworkService.shared
    
    func getDoctor(_ index: Int) -> User? {
        doctor?.record.data.users[index]
    }
    
    func getData()  {
        Task {
            let result = try await networkService.fetchData()
            await MainActor.run {
                self .doctorDataBase = result.record.data.users
            }
        }
    }
}

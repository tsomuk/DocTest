//
//  DoctorListViewModel.swift
//  DocTest
//
//  Created by Nikita Tsomuk on 22.03.2024.
//

import Foundation

final class DoctorListViewModel: ObservableObject {
    
    private let networkService = NetworkService.shared
    
    @Published var numberOfCards: Int = 0
    @Published var doctor: Responce? = nil
    @Published var doctorDataBase : [User] = []
    
    init() {
      getData()
    }
    
    func getData()  {
        Task {
            do {
                let result = try await networkService.fetchData()
                await MainActor.run {
                    self.doctorDataBase = result.data.users
                }
            }
            catch {
                print(error.localizedDescription)
            }
        }
    }
}

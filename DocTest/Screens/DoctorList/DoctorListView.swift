//
//  MainScreen.swift
//  DocTest
//
//  Created by Nikita Tsomuk on 16.03.2024.
//

import SwiftUI

struct DoctorListView: View {
    
    @StateObject var viewModel = DoctorListViewModel()
    @State private var selectedFilter: Filter = .price
    @State private var searchTerm = ""
    
    var searchedDoctor: [User] {
        if searchTerm.isEmpty { return viewModel.doctorDataBase }
        return viewModel.doctorDataBase.filter {
            $0.lastName.localizedCaseInsensitiveContains(searchTerm) ||
            $0.firstName.localizedCaseInsensitiveContains(searchTerm)
        }
    }
    
    enum Filter {
        case price
        case stag
        case ranting
    }
    
    init() {
        UISegmentedControl.appearance().selectedSegmentTintColor = .accent
        let attributes : [NSAttributedString.Key: Any] = [.foregroundColor : UIColor.white]
        let attributes2 : [NSAttributedString.Key: Any] = [.foregroundColor : UIColor.gray]
        UISegmentedControl.appearance().setTitleTextAttributes(attributes, for: .selected)
        UISegmentedControl.appearance().setTitleTextAttributes(attributes2, for: .normal)
        
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.background.ignoresSafeArea()
                
                ScrollView {
                    
                    picker
                        .padding(.bottom, 8)
                    
                    VStack(spacing: 16) {
                        ForEach(searchedDoctor) { doctor in
                            DoctorCardView(doctor: doctor)
                        }
                    }
                }
                .onAppear {
                    viewModel.getData()
                }
                .padding(.horizontal, 16)
            }
            .navigationTitle("Педиатры")
            .toolbarTitleDisplayMode(.inline)
            .searchable(text: $searchTerm, prompt: "Поиск")
        }
    }
}


#Preview {
    DoctorListView()
}


extension DoctorListView {
    var picker: some View {
        Picker(selection: $selectedFilter) {
            Text("По цене").tag(Filter.price)
            Text("По стажу").tag(Filter.stag)
            Text("По рейтингу").tag(Filter.ranting)
        } label: {
            Text("Picker")
        }
        .pickerStyle(.segmented)
        .foregroundStyle(.accent)
    }
}

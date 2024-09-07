//
//  MainScreen.swift
//  DocTest
//
//  Created by Nikita Tsomuk on 16.03.2024.
//

import SwiftUI

struct DoctorListView: View {
    
    @StateObject var viewModel = DoctorListViewModel()
    
    var body: some View {
        NavigationStack {
                ScrollView {
                    VStack(spacing: 16) {

                        ForEach(viewModel.doctorDataBase) { doctor in
                            DoctorCardView(doctor: doctor)
                        }
                    }
                }
                .onAppear {
                    viewModel.getData()
            
            }
        .navigationTitle("Педиатры")
        .toolbarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    DoctorListView()
}

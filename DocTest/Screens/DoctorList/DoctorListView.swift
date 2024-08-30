//
//  MainScreen.swift
//  DocTest
//
//  Created by Nikita Tsomuk on 16.03.2024.
//

import SwiftUI

struct DoctorListView: View {
    
    @StateObject var viewModel: DoctorListViewModel
    
    var body: some View {
        NavigationStack {
        ZStack {
            Color.background.edgesIgnoringSafeArea(.all)
                ScrollView {
                    VStack(spacing: 16) {
                        ForEach((0..<viewModel.numberOfCards), id: \.self) { item in
                            DoctorCardView(doctor: viewModel.getDoctor(item)!)
                        }
                    }
                }
                .onAppear {
                    viewModel.getData()
            }
            }
        .navigationTitle("Педиатры")
        .toolbarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    DoctorListView(viewModel: DoctorListViewModel())
}

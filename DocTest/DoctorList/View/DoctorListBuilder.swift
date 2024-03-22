//
//  DoctorListBuilder.swift
//  DocTest
//
//  Created by Nikita Tsomuk on 22.03.2024.
//

import SwiftUI

final class DoctorListBuilder {
    static func create() -> some View {
        let vm = DoctorListViewModel()
        
        return DoctorListView(viewModel: vm)
    }
}

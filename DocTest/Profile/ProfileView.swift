//
//  ProfileView.swift
//  DocTest
//
//  Created by Nikita Tsomuk on 16.03.2024.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        Image(systemName: "person.fill")
            .resizable()
            .frame(width: 150, height: 150, alignment: .center)
            .foregroundColor(.accentColor)
    }
}


#Preview {
    ProfileView()
}

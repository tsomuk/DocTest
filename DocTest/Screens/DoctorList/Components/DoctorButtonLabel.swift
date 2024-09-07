//
//  DefaultButton.swift
//  DocTest
//
//  Created by Nikita Tsomuk on 20.03.2024.
//

import SwiftUI


struct DoctorButtonLabel: View {
    
    var buttonTitle: String
    
    var body: some View {
        Text(buttonTitle)
            .foregroundColor(.white)
            .fontWeight(.bold)
            .frame(height: 60)
            .frame(maxWidth: .infinity)
            .background(.accent)
            .cornerRadius(8)
            
    }
}

#Preview {
    DoctorButtonLabel(buttonTitle: "Test title")
        .padding(.horizontal)
}

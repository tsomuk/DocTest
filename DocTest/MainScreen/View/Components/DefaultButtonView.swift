//
//  DefaultButton.swift
//  DocTest
//
//  Created by Nikita Tsomuk on 20.03.2024.
//

import SwiftUI


struct DefaultButtonView: View {
    
    var buttonTitle: String
    var extraPadding: CGFloat
    
    var body: some View {
        Text(buttonTitle)
            .foregroundColor(.white)
            .fontWeight(.bold)
            .frame(width: UIScreen.main.bounds.width - 32 - extraPadding, height: 60)
            .background(.accent)
            .cornerRadius(8)
            .padding(.horizontal)
    }
}

//
//  PriceView.swift
//  DocTest
//
//  Created by Nikita Tsomuk on 22.03.2024.
//

import SwiftUI

struct PriceView: View {
    
    var description: String
    var price : Int
    
    var body: some View {
        RoundedRectangle(cornerRadius: 8)
            .frame(
                width: UIScreen.main.bounds.width - 32,
                height: 60
            )
            .overlay(
                HStack {
                    Text(description)
                    Spacer()
                    Text("от \(price) ₽")
                }
                    .font(.system(size: 16, weight: .semibold))
                    .padding(.horizontal, 16)
                    .foregroundColor(.black)
            )
        
            .foregroundColor(.white)
            .fontWeight(.bold)
    }
}

#Preview {
    PriceView(description: "Прием", price: 800)
}

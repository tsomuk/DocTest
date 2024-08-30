//
//  PriceSegment.swift
//  DocTest
//
//  Created by Nikita Tsomuk on 22.03.2024.
//

import SwiftUI

struct PriceSegment: View {
    
    let title: String
    let time: String
    let price: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .bold()
            
            RoundedRectangle(cornerRadius: 8)
                .frame(width: UIScreen.main.bounds.width - 32, height: 56)
                .foregroundColor(.white)
                .overlay {
                    HStack {
                        Text(time)
                        Spacer()
                        Text(price)
                            .bold()
                    }
                    .padding(.horizontal, 16)
                    .foregroundStyle(.black)
                }
        }
        .padding(.horizontal, 16)
    }
}

#Preview {
    PriceSegment(title: "Прием", time: "30 мин", price: "500 ₽")
}

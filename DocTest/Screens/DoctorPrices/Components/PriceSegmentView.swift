//
//  PriceSegment.swift
//  DocTest
//
//  Created by Nikita Tsomuk on 22.03.2024.
//

import SwiftUI

struct PriceSegmentView: View {
    
    let title: String
    let time: String
    let price: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .bold()
            
            HStack {
                Text(time)
                Spacer()
                Text(price)
                    .bold()
            }
            .padding(.horizontal,16)
            .frame(maxWidth: .infinity, maxHeight: 56)
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 8))
        }
    }
}

#Preview {
    ZStack {
        Color.gray.opacity(0.3).ignoresSafeArea()
        PriceSegmentView(title: "Прием", time: "30 мин", price: "500 ₽")
            .padding(.horizontal, 16)
    }
}

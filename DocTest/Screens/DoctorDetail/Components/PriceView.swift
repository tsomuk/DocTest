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
        HStack {
            Text(description)
            Spacer()
            Text("от \(price) ₽")
        }
        .padding()
        .font(.system(size: 16, weight: .bold))
        .frame(maxWidth: .infinity, maxHeight: 60)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}

#Preview {
    ZStack {
        Color.background.ignoresSafeArea()
        PriceView(description: "Прием", price: 800)
            .padding()
    }
}

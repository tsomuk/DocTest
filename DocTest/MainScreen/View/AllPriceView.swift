//
//  PriceView.swift
//  DocTest
//
//  Created by Nikita Tsomuk on 16.03.2024.
//

import SwiftUI

struct AllPriceView: View {
    var body: some View {
        ZStack {
            Color.background.edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 24) {
                PriceSegment(title: "Видеоконсультация", time: "30 мин", price: "600 ₽")
                PriceSegment(title: "Чат с врачем", time: "30 мин", price: "600 ₽")
                PriceSegment(title: "Прием в клинике", time: "В клинике", price: "600 ₽")
                Spacer()
            } .padding(16)
                .navigationBarTitle("Стоимость услуг", displayMode: .inline)
        }
    }
}

#Preview {
    AllPriceView()
}

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
                }
        }
        .padding(.horizontal, 16)
    }
}

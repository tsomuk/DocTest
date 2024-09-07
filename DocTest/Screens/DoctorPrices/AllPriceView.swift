//
//  PriceView.swift
//  DocTest
//
//  Created by Nikita Tsomuk on 16.03.2024.
//

import SwiftUI

struct AllPriceView: View {
    
    @State var doctor: User
    
    var body: some View {
        ZStack {
            Color.background.edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 24) {
                PriceSegmentView(title: "Видеоконсультация", time: "30 мин", price: "\(doctor.videoChatPrice) ₽")
                PriceSegmentView(title: "Чат с врачом", time: "30 мин", price: "\(doctor.textChatPrice) ₽")
                PriceSegmentView(title: "Приём в клинике", time: "В клинике", price: "\(doctor.hospitalPrice) ₽")
                Spacer()
            } .padding(16)
                .navigationBarTitle("Стоимость услуг", displayMode: .inline)
        }
    }
}

#Preview {
    AllPriceView(doctor: DoctorMock.mrKim)
}

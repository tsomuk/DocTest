//
//  DoctorDetailView.swift
//  DocTest
//
//  Created by Nikita Tsomuk on 16.03.2024.
//

import SwiftUI

struct DoctorDetailView: View {
    
    
    var body: some View {
        
//        var doctorDetail: User
        
        ZStack(content: {
            Color.background.edgesIgnoringSafeArea(.all)
            VStack(alignment: .leading) {
                HStack(spacing: 16) {
                    Image(.mockPhoto)
                        .resizable()
                        .frame(width: 50, height: 50)
                        .cornerRadius(25)
                    VStack(alignment: .leading) {
//                        Text("\(doctorDetail.lastName)")
                        Text("Фамилия")
                        Text("Имя Отчество")
                    }
                    .bold()
                    .font(.system(size: 16, weight: .semibold))
                } .padding(.horizontal, 16)
                
                VStack(alignment: .leading, spacing: 10) {
                    TitleWithImage(title: "Опыт работы", imageName: "syringe.fill")
                    TitleWithImage(title: "Врач высшей категории", imageName: "cross.circle")
                    TitleWithImage(title: "И.М.Сеченов", imageName: "cross.vial.fill")
                    TitleWithImage(title: "Детская клиника", imageName: "pill.circle.fill")
                    
                    NavigationLink(destination: AllPriceView().toolbarRole(.editor)) {
                        PriceView(description: "Стоимость услуг", price: 400)
                    }
                    
                    Text("Проводит диагностику и лечение терапевтических больных. Осуществляет расшифровку и снятие Экг. Дает рекомендации по диетологии. Доктор имеет опыт работы в России и зарубежом. Проводит консультации пациентов на английском языке")
                        .font(.system(size: 14))
                } .padding(16)
                
                Spacer()
                
                Button(action: {
                    print("Make an apointment")
                }) {
                    DefaultButtonView(buttonTitle: "Записаться", extraPadding: 0)
                }
            }
            .navigationBarTitle("Педиатр", displayMode: .inline)
            .padding(16)
        })
    }
}

#Preview {
    DoctorDetailView()
}

struct TitleWithImage: View {
    let title: String
    let imageName: String
    
    var body: some View {
        HStack {
            Image(systemName: imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 14, height: 14)
            Text(title)
                .font(.system(size: 14))
        }
        .foregroundStyle(.darkGray)
    }
}



struct PriceView: View {
    
    var description: String
    var price : Int
    
    
    var body: some View {
        RoundedRectangle(cornerRadius: 8)
            .frame(width: UIScreen.main.bounds.width - 32, height: 60)
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

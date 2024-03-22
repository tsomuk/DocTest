//
//  DoctorDetailView.swift
//  DocTest
//
//  Created by Nikita Tsomuk on 16.03.2024.
//

import SwiftUI

struct DoctorDetailView: View {
    
    @State var doctor: User
    
    var body: some View {
        
        ZStack(content: {
            Color.background.edgesIgnoringSafeArea(.all)
            VStack(alignment: .leading) {
                HStack(spacing: 16) {
                    HStack(alignment: .top) {
                        AsyncImage(url: URL(string: doctor.avatar ?? "")) { phase in
                            switch phase {
                            case .empty:
                                Image(systemName: "person.circle.fill")
                                    .resizable()
                                    .frame(width: 50, height: 50)
                                    .foregroundStyle(.accent)
                            case .success(let image):
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 50, height: 50)
                                    .cornerRadius(25)
                            case .failure:
                                Image(systemName: "person.circle.fill")
                                    .resizable()
                                    .frame(width: 50, height: 50)
                                    .foregroundStyle(.accent)
                            @unknown default:
                                EmptyView()
                            }
                        }
                    }
                    
                    Text("\(doctor.lastName)\n\(doctor.firstName) \(doctor.patronymic)")
                        .bold()
                        .font(.system(size: 16, weight: .semibold))
                } .padding(.horizontal, 16)
                
                VStack(alignment: .leading, spacing: 10) {
                    TitleWithImage(title: "Опыт работы \(doctor.seniority) лет", imageName: "syringe.fill")
                    TitleWithImage(title: "Врач высшей категории", imageName: "cross.circle")
                    TitleWithImage(title: "И.М.Сеченов", imageName: "cross.vial.fill")
                    TitleWithImage(title: "Детская клиника", imageName: "pill.circle.fill")
                    
                    NavigationLink(destination: AllPriceView(doctor: doctor).toolbarRole(.editor)) {
                        PriceView(description: "Стоимость услуг", price: doctor.textChatPrice)
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

//#Preview {
//    DoctorDetailView()
//}

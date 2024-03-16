//
//  DoctorDetailView.swift
//  DocTest
//
//  Created by Nikita Tsomuk on 16.03.2024.
//

import SwiftUI

struct DoctorDetailView: View {
    
    
    var body: some View {
        
        ZStack(content: {
            Color.background.edgesIgnoringSafeArea(.all)
            VStack(alignment: .leading) {
                HStack {
                    Image(.mockPhoto)
                        .resizable()
                        .frame(width: 50, height: 50)
                        .cornerRadius(25)
                    VStack(alignment: .leading) {
                        Text("Фамилия")
                            .bold()
                            .font(.title3)
                        Text("Имя Отчество")
                            .bold()
                            .font(.title3)
                        
                        
                    } .padding(.horizontal, 16)
                    
                }
                VStack(alignment: .leading) {
                    
                    TitleWithImage(title: "Опыт работы", imageName: "syringe.fill")
                    TitleWithImage(title: "Врач высшей категории", imageName: "cross.circle")
                    TitleWithImage(title: "И.М.Сеченов", imageName: "cross.vial.fill")
                    TitleWithImage(title: "Детская клиника", imageName: "pill.circle.fill")
                    
                    Button(action: {
                        print("Move to price screen")
                    }) {
                        RoundedRectangle(cornerRadius: 8)
                            .frame(width: UIScreen.main.bounds.width - 32, height: 60, alignment: .center)
                            .overlay(
                                HStack {
                                    Text("Стоимость услуг ")
                                    Spacer()
                                    Text("от 400 ₽")
                                        
                                } 
                                    .padding(.horizontal, 16)
                                    .foregroundColor(.black)
                            )
                        
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                    }
                    
                    Text("Проводит диагностику и лечение терапевтических больных. Осуществляет расшифровку и снятие Экг. Дает рекомендации по диетологии. Доктор имеет опыт работы в России и зарубежом. Проводит консультации пациентов на английском языке")
                } .padding(16)
                
                
                Spacer()
                Button(action: {
                    print("Make an apointment")
                }) {
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color(.accent))
                        .frame(width: UIScreen.main.bounds.width - 32, height: 60, alignment: .center)
                        .overlay(
                            Text("Записаться"))
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                }
            }
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
                .frame(width: 14, height: 15)
            Text(title)
        }
    }
}

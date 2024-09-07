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
                                ProgressView()
                                    .frame(width: 50, height: 50)
                            case .success(let image):
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 50, height: 50)
                                    .cornerRadius(25)
                            default:
                                Image(systemName: "person.circle.fill")
                                    .resizable()
                                    .frame(width: 50, height: 50)
                                    .foregroundStyle(.accent)
                            }
                        }
                    }
                    
                    Text("\(doctor.lastName)\n\(doctor.firstName) \(doctor.patronymic)")
                        .font(.system(size: 16, weight: .semibold))
                } 
                .padding(.horizontal, 16)
                
                VStack(alignment: .leading, spacing: 10) {
                    TitleWithImage(title: doctor.seniority.getYearsStringDetail(), imageName: "clock")
                    TitleWithImage(title: chechScientificDegreeLabel(), imageName: "cross.case")
                    TitleWithImage(title: doctor.educationTypeLabel?.name ?? "Нет данных об образовании", imageName: "graduationcap")
                    TitleWithImage(title: "Детская клиника \"РебёнОК\"", imageName: "mappin.and.ellipse")
                    
                    NavigationLink(destination: AllPriceView(doctor: doctor).toolbarRole(.editor)) {
                        PriceView(description: "Стоимость услуг", price: findMinimumPrice() ?? 0)
                    }
                    
                    Text("Проводит диагностику и лечение терапевтических больных. Осуществляет расшифровку и снятие Экг. Дает рекомендации по диетологии. Доктор имеет опыт работы в России и зарубежом. Проводит консультации пациентов на английском языке")
                        .font(.system(size: 14))
                } .padding(16)
                
                Spacer()
                
                Button(action: {
                    print("Make an apointment")
                }) {
                    DoctorButtonLabel(buttonTitle: "Записаться")
                }
            }
            .navigationBarTitle("Педиатр", displayMode: .inline)
            .padding(16)
        })
    }
    
    func findMinimumPrice() -> Int? {
        [doctor.hospitalPrice, doctor.textChatPrice, doctor.videoChatPrice].min()
    }
    
    func chechScientificDegreeLabel() -> String {
        if doctor.scientificDegreeLabel == "нет" {
            return "Нет данных об ученой степени"
        } else {
            return doctor.scientificDegreeLabel.capitalizedSentence
        }
    }
}

#Preview {
    DoctorDetailView(doctor: Doctor.mockDoc)
}




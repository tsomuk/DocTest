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
        
        ZStack {
            Color.background.edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .leading, spacing: 20) {
                
                photoAndNameBlock
                
                characteristics
                    
                
                PriceView(description: "Стоимость услуг", price: findMinimumPrice() ?? 0)
                
                description
                
                Spacer()
                
                NavigationLink(destination: AllPriceView(doctor: doctor).toolbarRole(.editor)) {
                    DoctorButtonLabel(buttonTitle: "Записаться")
                }
                .padding(.bottom, 10)
            }
            .padding(.horizontal, 16)
            .navigationBarTitle("Педиатр", displayMode: .inline)
        }
    }
    
    func findMinimumPrice() -> Int? {
        [doctor.hospitalPrice, doctor.textChatPrice, doctor.videoChatPrice].min()
    }
    
    func chechScientificDegreeLabel() -> String {
        if doctor.scientificDegreeLabel.rawValue == "нет" {
            return "Нет данных об ученой степени"
        } else {
            return doctor.scientificDegreeLabel.rawValue.capitalizedSentence
        }
    }
}

#Preview {
    DoctorDetailView(doctor: Responce.mockDoctor)
}



extension DoctorDetailView {
    var characteristics: some View {
        VStack(alignment: .leading, spacing: 10) {
            TitleWithImage(title: doctor.seniority.getYearsStringDetail(), imageName: "clock")
            TitleWithImage(title: chechScientificDegreeLabel(), imageName: "cross.case")
            TitleWithImage(title: doctor.educationTypeLabel?.name ?? "Нет данных об образовании", imageName: "graduationcap")
            TitleWithImage(title: "Детская клиника \"РебёнОК\"", imageName: "mappin.and.ellipse")
        }
    }
    
    var description: some View {
        Text("Проводит диагностику и лечение терапевтических больных. Осуществляет расшифровку и снятие Экг. Дает рекомендации по диетологии. Доктор имеет опыт работы в России и зарубежом. Проводит консультации пациентов на английском языке")
            .font(.system(size: 14))
    }
    
    var photoAndNameBlock: some View {
        HStack(spacing: 16) {
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
                            .clipShape(Circle())
                    default:
                        Image(systemName: "person.circle.fill")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .foregroundStyle(.accent)
                    }
                
            }
            
            Text("\(doctor.lastName)\n\(doctor.firstName) \(doctor.patronymic)")
                .font(.system(size: 16, weight: .semibold))
        }
    }
}
